import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/datasources/meet_api_service.dart';

/// Meet Login Screen
/// 1:1 clone of apps/meet/src/components/extra-pages/Login.tsx
/// Form: Room ID, User Type, Name, User ID → isRoomActive → createRoom (if needed) → getJoinToken
/// API Key & API Secret: lấy từ AppConfig, mặc định gửi kèm mọi auth request (isRoomActive, createRoom, getJoinToken).
class MeetLoginScreen extends ConsumerStatefulWidget {
  final void Function(String token) onLoginSuccess;

  const MeetLoginScreen({super.key, required this.onLoginSuccess});

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
    _userIdController = TextEditingController(
      text: DateTime.now().millisecondsSinceEpoch.toString(),
    );
    _nameController = TextEditingController(
      text: 'user-${DateTime.now().millisecondsSinceEpoch % 100}',
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
      bool isRoomActive = await api.isRoomActive(_roomId);

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
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi: ${e.toString()}'),
            backgroundColor: Colors.red,
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
      _nameController.text = 'user-${DateTime.now().millisecondsSinceEpoch % 100}';
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 500),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: theme.colorScheme.outline.withOpacity(0.2),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Chào mừng trở lại',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),

                      // Room
                      Text('Phòng', style: theme.textTheme.labelLarge),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: _roomId,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        items: List.generate(
                          15,
                          (i) => DropdownMenuItem(
                            value: 'room${(i + 1).toString().padLeft(2, '0')}',
                            child: Text('Phòng ${i + 1}'),
                          ),
                        ),
                        onChanged: (v) => setState(() => _roomId = v ?? _roomId),
                      ),
                      const SizedBox(height: 16),

                      // User Type
                      Text('Loại người dùng', style: theme.textTheme.labelLarge),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: _userType,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        items: const [
                          DropdownMenuItem(value: 'admin', child: Text('Admin')),
                          DropdownMenuItem(
                            value: 'participant',
                            child: Text('Người tham gia'),
                          ),
                        ],
                        onChanged: (v) =>
                            setState(() => _userType = v ?? _userType),
                      ),
                      const SizedBox(height: 16),

                      // Name
                      Text('Tên', style: theme.textTheme.labelLarge),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: 'Nhập tên của bạn',
                        ),
                        validator: (v) =>
                            (v == null || v.trim().isEmpty) ? 'Nhập tên' : null,
                      ),
                      const SizedBox(height: 16),

                      // User ID
                      Text('User ID', style: theme.textTheme.labelLarge),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _userIdController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: 'User ID',
                        ),
                        validator: (v) =>
                            (v == null || v.trim().isEmpty) ? 'Nhập User ID' : null,
                      ),
                      const SizedBox(height: 24),

                      // Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: _isLoading ? null : _resetForm,
                            child: const Text('Đặt lại'),
                          ),
                          const SizedBox(width: 12),
                          FilledButton(
                            onPressed: _isLoading ? null : _handleLogin,
                            child: _isLoading
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text('Đăng nhập'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
