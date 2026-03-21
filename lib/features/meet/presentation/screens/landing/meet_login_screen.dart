import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import '../../../data/datasources/meet_api_service.dart';

/// Meet Login Screen
/// 1:1 clone of apps/meet/src/components/extra-pages/Login.tsx
/// Form: Room ID, User Type, Name, User ID → isRoomActive → createRoom (if needed) → getJoinToken
class MeetLoginScreen extends ConsumerStatefulWidget {
  final void Function(String token) onLoginSuccess;
  final String? roomId;

  const MeetLoginScreen({super.key, required this.onLoginSuccess, this.roomId});

  @override
  ConsumerState<MeetLoginScreen> createState() => _MeetLoginScreenState();
}

class _MeetLoginScreenState extends ConsumerState<MeetLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _roomId = 'room01';
  String _userType = 'participant';
  late TextEditingController _nameController;
  late TextEditingController _userIdController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.roomId != null) {
      _roomId = widget.roomId!;
    }
    _userIdController = TextEditingController(
      text: DateTime.now().millisecondsSinceEpoch.toString(),
    );
    _nameController = TextEditingController(
      text: 'User ${DateTime.now().millisecondsSinceEpoch % 100}',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _userIdController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final api = ref.read(meetApiServiceProvider);

      // 1. Check if room is active
      bool isRoomActive;
      try {
        isRoomActive = await api.isRoomActive(_roomId);
      } catch (e) {
        // Server-side /auth/room/isRoomActive can be flaky; don't block joining.
        // Degrade gracefully by attempting createRoom then getJoinToken.
        isRoomActive = false;
      }

      // 2. If not active, create room
      if (!isRoomActive) {
        await api.createRoom(_roomId);
        isRoomActive = true;
      }

      // 3. Get join token
      if (isRoomActive) {
        final token = await api.getJoinToken(
          roomId: _roomId,
          name: _nameController.text.trim(),
          userId: _userIdController.text.trim(),
          isAdmin: _userType == 'admin',
        );

        if (token != null && token.isNotEmpty && mounted) {
          widget.onLoginSuccess(token);
        } else if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Không nhận được token từ server'),
              backgroundColor: AppColors.error,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi: ${e.toString()}'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _resetForm() {
    setState(() {
      _userIdController.text = DateTime.now().millisecondsSinceEpoch.toString();
      _nameController.text = 'User ${DateTime.now().millisecondsSinceEpoch % 100}';
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.surface,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => _goHome(context),
        ),
        title: Text(
          'Torii Meet',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.22),
                        blurRadius: 14,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: AppColors.textOnPrimary.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.video_chat_rounded,
                          color: AppColors.textOnPrimary,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Vào phòng họp Torii Meet',
                          style: theme.textTheme.titleSmall?.copyWith(
                                color: AppColors.textOnPrimary,
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(Icons.video_chat_rounded, color: AppColors.primary, size: 22),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Vào phòng họp',
                            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Nhập thông tin để nhận mã tham gia.',
                            style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textTertiary),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Login Card
                Container(
                  constraints: const BoxConstraints(maxWidth: 460),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.grey300),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.textPrimary.withOpacity(0.04),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildFieldLabel(context, 'Phòng họp'),
                          _buildDropdown(
                            context,
                            value: _roomId,
                            items: List.generate(
                              10,
                              (i) => DropdownMenuItem(
                                value: 'room${(i + 1).toString().padLeft(2, '0')}',
                                child: Text('Phòng Global ${i + 1}'),
                              ),
                            ),
                            onChanged: (v) => setState(() => _roomId = v ?? _roomId),
                          ),
                          const SizedBox(height: 14),

                          _buildFieldLabel(context, 'Vai trò'),
                          _buildDropdown(
                            context,
                            value: _userType,
                            items: const [
                              DropdownMenuItem(value: 'participant', child: Text('Người tham gia')),
                              DropdownMenuItem(value: 'admin', child: Text('Quản trị viên')),
                            ],
                            onChanged: (v) => setState(() => _userType = v ?? _userType),
                          ),
                          const SizedBox(height: 14),

                          _buildFieldLabel(context, 'Tên hiển thị'),
                          _buildTextField(
                            context,
                            controller: _nameController,
                            hint: 'Ví dụ: Nguyễn Văn A',
                            icon: Icons.person_outline_rounded,
                            validator: (v) => (v == null || v.trim().isEmpty) ? 'Vui lòng nhập tên' : null,
                          ),
                          const SizedBox(height: 14),

                          _buildFieldLabel(context, 'User ID (Dành cho Dev)'),
                          _buildTextField(
                            context,
                            controller: _userIdController,
                            hint: 'Mã định danh người dùng',
                            icon: Icons.fingerprint_rounded,
                            validator: (v) => (v == null || v.trim().isEmpty) ? 'Bắt buộc' : null,
                          ),
                          const SizedBox(height: 16),

                          // Dynamic Login Button
                          SizedBox(
                            height: 48,
                            child: ElevatedButton(
                              onPressed: _isLoading ? null : _handleLogin,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: theme.colorScheme.primary,
                                foregroundColor: AppColors.textOnPrimary,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: _isLoading
                                  ? const SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 3,
                                        valueColor: AlwaysStoppedAnimation<Color>(AppColors.textOnPrimary),
                                      ),
                                    )
                                  : const Text(
                                      'Vào phòng họp',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 0.2,
                                      ),
                                    ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextButton(
                            onPressed: _isLoading ? null : _resetForm,
                            child: Text(
                              'Đặt lại chi tiết',
                              style: TextStyle(
                                color: AppColors.textTertiary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: SizedBox(
            height: 48,
            child: OutlinedButton.icon(
              onPressed: _isLoading ? null : () => _goHome(context),
              icon: const Icon(Icons.home_outlined),
              label: const Text(
                'Về trang chủ',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.grey300),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFieldLabel(BuildContext context, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 4),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildDropdown(
    BuildContext context, {
    required String value,
    required List<DropdownMenuItem<String>> items,
    required ValueChanged<String?> onChanged,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.textPrimaryDark.withOpacity(0.05) : AppColors.textPrimary.withOpacity(0.02),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: (isDark ? AppColors.textPrimaryDark : AppColors.textPrimary).withOpacity(0.08)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          items: items,
          onChanged: onChanged,
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    String? Function(String?)? validator,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary.withOpacity(0.5)),
        hintText: hint,
        filled: true,
        fillColor: isDark ? AppColors.textPrimaryDark.withOpacity(0.05) : AppColors.textPrimary.withOpacity(0.02),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: (isDark ? AppColors.textPrimaryDark : AppColors.textPrimary).withOpacity(0.08)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: (isDark ? AppColors.textPrimaryDark : AppColors.textPrimary).withOpacity(0.08)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
        ),
      ),
    );
  }

  void _goHome(BuildContext context) {
    final router = GoRouter.maybeOf(context);
    if (router != null) {
      router.go('/');
    } else {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }
}
