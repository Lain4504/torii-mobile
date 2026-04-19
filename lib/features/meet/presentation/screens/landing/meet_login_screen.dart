import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../data/datasources/meet_api_service.dart';

const _meetRoomAlphabet = 'abcdefghijklmnopqrstuvwxyz';

/// Giống [generateMeetStyleRoomId] trên web (`apps/meet/.../login.tsx`).
String generateMeetStyleRoomId() {
  final r = Random.secure();
  String pick(int n) {
    final b = StringBuffer();
    for (var i = 0; i < n; i++) {
      b.write(_meetRoomAlphabet[r.nextInt(_meetRoomAlphabet.length)]);
    }
    return b.toString();
  }

  return '${pick(3)}-${pick(4)}-${pick(3)}';
}

/// Meet Login Screen
/// Khớp luồng `apps/meet/src/components/extra-pages/login.tsx`:
/// nhập mã phòng hoặc tạo mã ngẫu nhiên → isRoomActive → createRoom → getJoinToken
class MeetLoginScreen extends ConsumerStatefulWidget {
  final void Function(String token) onLoginSuccess;
  final String? roomId;

  const MeetLoginScreen({super.key, required this.onLoginSuccess, this.roomId});

  @override
  ConsumerState<MeetLoginScreen> createState() => _MeetLoginScreenState();
}

class _MeetLoginScreenState extends ConsumerState<MeetLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _userType = 'participant';
  late TextEditingController _roomIdController;
  late TextEditingController _nameController;
  late TextEditingController _userIdController;
  bool _isLoading = false;
  String? _formError;

  @override
  void initState() {
    super.initState();
    _roomIdController = TextEditingController(text: widget.roomId ?? '');
    _userIdController = TextEditingController(
      text: DateTime.now().millisecondsSinceEpoch.toString(),
    );
    _nameController = TextEditingController(
      text: 'user-${Random().nextInt(100)}',
    );
  }

  @override
  void dispose() {
    _roomIdController.dispose();
    _nameController.dispose();
    _userIdController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    final normalizedRoomId = _roomIdController.text.trim();
    if (normalizedRoomId.isEmpty) {
      setState(() {
        _formError = 'Vui lòng nhập mã phòng hoặc bấm tạo mã ngẫu nhiên.';
      });
      return;
    }
    setState(() => _formError = null);

    setState(() => _isLoading = true);

    try {
      final api = ref.read(meetApiServiceProvider);

      // 1. Check if room is active
      bool isRoomActive;
      try {
        isRoomActive = await api.isRoomActive(normalizedRoomId);
      } catch (e) {
        // Server-side /auth/room/isRoomActive can be flaky; don't block joining.
        // Degrade gracefully by attempting createRoom then getJoinToken.
        isRoomActive = false;
      }

      // 2. If not active, create room
      if (!isRoomActive) {
        await api.createRoom(normalizedRoomId);
        isRoomActive = true;
      }

      // 3. Get join token
      if (isRoomActive) {
        final token = await api.getJoinToken(
          roomId: normalizedRoomId,
          name: _nameController.text.trim(),
          userId: _userIdController.text.trim(),
          isAdmin: _userType == 'admin',
        );

        if (token != null && token.isNotEmpty && mounted) {
          widget.onLoginSuccess(token);
        } else if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Thiếu thông tin phòng từ server'),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi: ${e.toString()}'), // Assuming 'res.msg' is not available here, using original error message
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _resetRandomName() {
    setState(() {
      _formError = null;
      _userIdController.text = DateTime.now().millisecondsSinceEpoch.toString();
      _nameController.text = 'user-${Random().nextInt(100)}';
    });
  }

  void _regenerateRoomId() {
    setState(() {
      _roomIdController.text = generateMeetStyleRoomId();
      _formError = null;
    });
  }

  Future<void> _copyRoomId() async {
    await Clipboard.setData(ClipboardData(text: _roomIdController.text.trim()));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đã sao chép mã phòng')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.colorScheme.surface,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => _goHome(context),
        ),
        title: Text(
          'Tham gia cuộc họp',
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
                    gradient: LinearGradient(
                      colors: [
                        theme.colorScheme.primary,
                        theme.colorScheme.primary.withValues(alpha: 0.8),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: theme.colorScheme.primary.withValues(alpha: 0.22),
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
                          color: theme.colorScheme.onPrimary.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.video_chat_rounded,
                          color: theme.colorScheme.onPrimary,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Vào phòng họp Torii Meet',
                          style: theme.textTheme.titleSmall?.copyWith(
                                color: theme.colorScheme.onPrimary,
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
                        color: theme.colorScheme.primary.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(Icons.video_chat_rounded, color: theme.colorScheme.primary, size: 22),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tham gia cuộc họp',
                            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Nhập mã phòng hoặc tạo mã ngẫu nhiên; cùng mã thì vào cùng phòng.',
                            style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
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
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: theme.colorScheme.outlineVariant),
                    boxShadow: [
                      BoxShadow(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.04),
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
                          _buildFieldLabel(context, 'Mã phòng'),
                          Text(
                            'Nhập mã để vào hoặc tạo phòng mới; bấm làm mới để tạo mã kiểu Meet (vd: abc-defg-hij).',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                              height: 1.35,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _roomIdController,
                                  onChanged: (_) => setState(() => _formError = null),
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontFamily: 'monospace',
                                    letterSpacing: 0.6,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'vd: abc-defg-hij hoặc tên phòng của bạn',
                                    filled: true,
                                    fillColor: theme.colorScheme.onSurface.withValues(alpha: 0.05),
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                        color: theme.colorScheme.onSurface.withValues(alpha: 0.08),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                        color: theme.colorScheme.onSurface.withValues(alpha: 0.08),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(color: theme.colorScheme.primary, width: 2),
                                    ),
                                  ),
                                  autocorrect: false,
                                  enableSuggestions: false,
                                ),
                              ),
                              const SizedBox(width: 6),
                              IconButton(
                                onPressed: _isLoading ? null : _copyRoomId,
                                tooltip: 'Sao chép mã phòng',
                                icon: const Icon(Icons.copy_rounded),
                              ),
                              IconButton(
                                onPressed: _isLoading ? null : _regenerateRoomId,
                                tooltip: 'Tạo mã phòng ngẫu nhiên',
                                icon: const Icon(Icons.refresh_rounded),
                              ),
                            ],
                          ),
                          if (_formError != null) ...[
                            const SizedBox(height: 8),
                            Text(
                              _formError!,
                              style: TextStyle(
                                color: theme.colorScheme.error,
                                fontSize: 13,
                              ),
                            ),
                          ],
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
                                foregroundColor: theme.colorScheme.onPrimary,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: _isLoading
                                  ? SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 3,
                                        valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.onPrimary),
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
                            onPressed: _isLoading ? null : _resetRandomName,
                            child: Text(
                              'Tên ngẫu nhiên',
                              style: TextStyle(
                                color: theme.colorScheme.onSurfaceVariant,
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
                side: BorderSide(color: theme.colorScheme.outlineVariant),
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
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
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
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: theme.colorScheme.onSurface.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.onSurface.withValues(alpha: 0.08)),
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
    final theme = Theme.of(context);
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, size: 20, color: theme.colorScheme.primary.withValues(alpha: 0.5)),
        hintText: hint,
        filled: true,
        fillColor: theme.colorScheme.onSurface.withValues(alpha: 0.05),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.colorScheme.onSurface.withValues(alpha: 0.08)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.colorScheme.onSurface.withValues(alpha: 0.08)),
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
