import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/theme/theme_provider.dart';

// Màu theo template HTML (Torii Nihongo Profile Details)
const _colorPrimary = Color(0xFF1F3E72);
const _colorBgLight = Color(0xFFF9FAFB);
const _colorBgDark = Color(0xFF0F172A);
const _colorSurfaceLight = Color(0xFFFFFFFF);
const _colorSurfaceDark = Color(0xFF1E293B); // slate-800
const _colorBorderLight = Color(0xFFE2E8F0);
const _colorBorderDark = Color(0xFF334155);
const _colorLabelLight = Color(0xFF334155);
const _colorLabelDark = Color(0xFFCBD5E1);
const _colorTextLight = Color(0xFF1E293B);
const _colorTextDark = Color(0xFFF1F5F9);
const _colorHintLight = Color(0xFF64748B);
const _colorIconMuted = Color(0xFF94A3B8);

const _radiusInput = 12.0;
const _radiusButton = 16.0;

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  bool _isLoading = false;

  DateTime? _dateOfBirth;
  String _gender = 'Nam';
  String _country = 'Việt Nam';
  String _level = 'N5';

  static const _genders = ['Nam', 'Nữ', 'Khác'];
  static const _countries = ['Việt Nam', 'Japan', 'United States'];
  static const _levels = ['N5', 'N4', 'N3', 'N2', 'N1'];

  @override
  void initState() {
    super.initState();
    final user = ref.read(authStateProvider).value?.user;
    _nameController = TextEditingController(text: user?.displayName ?? '');
    _emailController = TextEditingController(text: user?.email ?? '');
    _phoneController = TextEditingController(text: user?.userMetadata?['phone']?.toString() ?? '');
    _addressController = TextEditingController(text: user?.userMetadata?['address']?.toString() ?? '');
    final meta = user?.userMetadata;
    if (meta != null) {
      _gender = meta['gender']?.toString() ?? _gender;
      _country = meta['country']?.toString() ?? _country;
      _level = meta['level']?.toString() ?? _level;
      final dob = meta['dateOfBirth']?.toString();
      if (dob != null) _dateOfBirth = DateTime.tryParse(dob);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final success = await ref.read(authNotifierProvider.notifier).updateProfile(
          displayName: _nameController.text.trim(),
          metadata: {
            'dateOfBirth': _dateOfBirth?.toIso8601String(),
            'phone': _phoneController.text.trim().isEmpty ? null : _phoneController.text.trim(),
            'gender': _gender,
            'country': _country,
            'level': _level,
            'address': _addressController.text.trim().isEmpty ? null : _addressController.text.trim(),
          },
        );

    setState(() => _isLoading = false);

    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đã lưu thông tin'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.success,
        ),
      );
      Navigator.pop(context);
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Không thể lưu thông tin'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  bool get _isDark {
    return Theme.of(context).brightness == Brightness.dark;
  }

  Color get _bgColor => _isDark ? _colorBgDark : _colorBgLight;
  Color get _surfaceColor => _isDark ? _colorSurfaceDark : _colorSurfaceLight;
  Color get _borderColor => _isDark ? _colorBorderDark : _colorBorderLight;
  Color get _labelColor => _isDark ? _colorLabelDark : _colorLabelLight;
  Color get _textColor => _isDark ? _colorTextDark : _colorTextLight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFieldLabel('Họ và tên'),
                      const SizedBox(height: 8),
                      _buildTextField(
                        controller: _nameController,
                        hint: 'Nhập họ và tên',
                        validator: (v) => (v == null || v.trim().isEmpty) ? 'Vui lòng nhập họ và tên' : null,
                      ),
                      const SizedBox(height: 24),
                      _buildFieldLabel('Email'),
                      const SizedBox(height: 8),
                      _buildTextField(
                        controller: _emailController,
                        hint: 'Nhập email',
                        readOnly: true,
                        enabled: false,
                      ),
                      const SizedBox(height: 24),
                      _buildFieldLabel('Ngày sinh'),
                      const SizedBox(height: 8),
                      _buildDateField(context),
                      const SizedBox(height: 24),
                      _buildFieldLabel('Số điện thoại'),
                      const SizedBox(height: 8),
                      _buildTextField(
                        controller: _phoneController,
                        hint: 'Nhập số điện thoại',
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(child: _buildGenderField(context)),
                          const SizedBox(width: 16),
                          Expanded(child: _buildCountryField(context)),
                        ],
                      ),
                      const SizedBox(height: 24),
                      _buildFieldLabel('Cấp độ'),
                      const SizedBox(height: 8),
                      _buildLevelField(context),
                      const SizedBox(height: 24),
                      _buildFieldLabel('Địa chỉ cụ thể'),
                      const SizedBox(height: 8),
                      _buildTextField(
                        controller: _addressController,
                        hint: 'Nhập địa chỉ chi tiết',
                      ),
                      const SizedBox(height: 24),
                      _buildLinkAccountButton(context),
                    ],
                  ),
                ),
              ),
            ),
            _buildFooter(context),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 24, right: 20),
        child: FloatingActionButton.small(
          onPressed: () => ref.read(themeModeProvider.notifier).toggleTheme(),
          backgroundColor: _surfaceColor,
          foregroundColor: _textColor,
          elevation: 4,
          child: Icon(
            _isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
            color: _isDark ? const Color(0xFFFBBF24) : _colorIconMuted,
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: _surfaceColor,
        border: Border(bottom: BorderSide(color: _borderColor)),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new_rounded, size: 20, color: _labelColor),
            style: IconButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: const EdgeInsets.all(4),
            ),
          ),
          const Expanded(
            child: Text(
              'Thông tin cá nhân',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 40),
        ],
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: _labelColor,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    bool readOnly = false,
    bool enabled = true,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      enabled: enabled,
      keyboardType: keyboardType,
      validator: validator,
      style: TextStyle(fontSize: 16, color: _textColor),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: _colorHintLight, fontSize: 16),
        filled: true,
        fillColor: _surfaceColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_radiusInput),
          borderSide: BorderSide(color: _borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_radiusInput),
          borderSide: BorderSide(color: _borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_radiusInput),
          borderSide: const BorderSide(color: _colorPrimary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_radiusInput),
          borderSide: const BorderSide(color: AppColors.error),
        ),
      ),
    );
  }

  Widget _buildDateField(BuildContext context) {
    final displayText = _dateOfBirth != null
        ? '${_dateOfBirth!.day.toString().padLeft(2, '0')}/${_dateOfBirth!.month.toString().padLeft(2, '0')}/${_dateOfBirth!.year}'
        : '';

    return InkWell(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: _dateOfBirth ?? DateTime(2000),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (picked != null) setState(() => _dateOfBirth = picked);
      },
      borderRadius: BorderRadius.circular(_radiusInput),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: _surfaceColor,
          borderRadius: BorderRadius.circular(_radiusInput),
          border: Border.all(color: _borderColor),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                displayText.isEmpty ? 'Chọn ngày sinh' : displayText,
                style: TextStyle(
                  fontSize: 16,
                  color: displayText.isEmpty ? _colorHintLight : _textColor,
                ),
              ),
            ),
            Icon(Icons.calendar_today_rounded, size: 20, color: _colorIconMuted),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel('Giới tính'),
        const SizedBox(height: 8),
        _buildDropdownTile(
          leading: Icon(Icons.account_circle_rounded, color: _colorPrimary, size: 24),
          value: _gender,
          onTap: () => _showPicker(context, _genders, (v) => setState(() => _gender = v)),
        ),
      ],
    );
  }

  Widget _buildCountryField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel('Quốc gia'),
        const SizedBox(height: 8),
        _buildDropdownTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              'https://flagcdn.com/w40/vn.png',
              width: 20,
              height: 16,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Icon(Icons.flag_rounded, size: 20, color: _colorIconMuted),
            ),
          ),
          value: _country,
          onTap: () => _showPicker(context, _countries, (v) => setState(() => _country = v)),
        ),
      ],
    );
  }

  Widget _buildLevelField(BuildContext context) {
    return _buildDropdownTile(
      value: 'Cấp độ $_level',
      onTap: () => _showPicker(context, _levels, (v) => setState(() => _level = v)),
      showChevron: true,
    );
  }

  Widget _buildDropdownTile({
    Widget? leading,
    required String value,
    required VoidCallback onTap,
    bool showChevron = true,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(_radiusInput),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: _surfaceColor,
          borderRadius: BorderRadius.circular(_radiusInput),
          border: Border.all(color: _borderColor),
        ),
        child: Row(
          children: [
            if (leading != null) ...[leading, const SizedBox(width: 8)],
            Expanded(
              child: Text(
                value,
                style: TextStyle(fontSize: 16, color: _textColor),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (showChevron)
              Icon(Icons.expand_more_rounded, size: 24, color: _colorIconMuted),
          ],
        ),
      ),
    );
  }

  void _showPicker(BuildContext context, List<String> options, ValueChanged<String> onSelected) {
    showModalBottomSheet<String>(
      context: context,
      backgroundColor: _surfaceColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: options
                .map(
                  (opt) => ListTile(
                    title: Text(opt, style: TextStyle(color: _textColor)),
                    onTap: () {
                      onSelected(opt);
                      Navigator.pop(ctx, opt);
                    },
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }

  Widget _buildLinkAccountButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: TextButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Tính năng đang phát triển'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          foregroundColor: _colorPrimary,
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Liên kết tài khoản', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            SizedBox(width: 4),
            Icon(Icons.chevron_right_rounded, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, MediaQuery.of(context).padding.bottom + 20),
      decoration: BoxDecoration(
        color: _surfaceColor,
        border: Border(top: BorderSide(color: _borderColor)),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          onPressed: _isLoading ? null : _handleSave,
          style: ElevatedButton.styleFrom(
            backgroundColor: _colorPrimary,
            foregroundColor: Colors.white,
            elevation: 4,
            shadowColor: _colorPrimary.withValues(alpha: 0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_radiusButton),
            ),
          ),
          child: _isLoading
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : const Text(
                  'Lưu thông tin',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
        ),
      ),
    );
  }
}
