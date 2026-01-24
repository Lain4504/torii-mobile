import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/features/meet/presentation/providers/meet_provider.dart';

class JoinMeetForm extends ConsumerStatefulWidget {
  const JoinMeetForm({super.key});

  @override
  ConsumerState<JoinMeetForm> createState() => _JoinMeetFormState();
}

class _JoinMeetFormState extends ConsumerState<JoinMeetForm> {
  final _roomController = TextEditingController(text: 'room01');
  final _nameController = TextEditingController();
  bool _isAdmin = false;

  @override
  void initState() {
    super.initState();
    _nameController.text = 'User-${DateTime.now().millisecondsSinceEpoch % 1000}';
  }

  @override
  void dispose() {
    _roomController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _handleJoin() {
    final roomId = _roomController.text.trim();
    final name = _nameController.text.trim();
    if (roomId.isEmpty || name.isEmpty) return;

    ref.read(meetControllerProvider.notifier).joinRoomById(
      roomId: roomId,
      name: name,
      isAdmin: _isAdmin,
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(meetControllerProvider);
    final isLoading = state.status != MeetStatus.initial && state.status != MeetStatus.error;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E2C).withOpacity(0.7),
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: Colors.white.withOpacity(0.1), width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 24,
                    offset: const Offset(0, 12),
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo / Icon
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF3F51B5), Color(0xFF5C6BC0)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF3F51B5).withOpacity(0.4),
                          blurRadius: 16,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: const Icon(Icons.videocam_rounded, color: Colors.white, size: 40),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Walearn Meet',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Enter details to join the session',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Room ID Input
                  _buildTextField(
                    controller: _roomController,
                    label: 'ROOM ID',
                    icon: Icons.meeting_room_outlined,
                    enabled: !isLoading,
                  ),
                  const SizedBox(height: 20),

                  // Name Input
                  _buildTextField(
                    controller: _nameController,
                    label: 'YOUR NAME',
                    icon: Icons.person_outline,
                    enabled: !isLoading,
                  ),
                  const SizedBox(height: 20),

                  // Admin Toggle (Glassy)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.03),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white.withOpacity(0.05)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Row(
                           children: [
                             Icon(Icons.admin_panel_settings_outlined, 
                               color: _isAdmin ? Colors.blueAccent : Colors.white24, size: 20),
                             const SizedBox(width: 12),
                             const Text('JOIN AS ADMIN', 
                               style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w600)),
                           ],
                         ),
                        Switch(
                          value: _isAdmin,
                          onChanged: isLoading ? null : (v) => setState(() => _isAdmin = v),
                          activeColor: Colors.blueAccent,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Join Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : _handleJoin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3F51B5),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                        elevation: 8,
                        shadowColor: const Color(0xFF3F51B5).withOpacity(0.5),
                      ),
                      child: isLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                          )
                        : const Text(
                            'JOIN SESSION',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2),
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool enabled = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            label,
            style: const TextStyle(color: Colors.white38, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5),
          ),
        ),
        TextField(
          controller: controller,
          enabled: enabled,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.white24, size: 20),
            filled: true,
            fillColor: Colors.black.withOpacity(0.2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Color(0xFF3F51B5), width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ),
      ],
    );
  }
}
