import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/auth_providers.dart';
import '../../models/auth_state_sealed.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  ConsumerState<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
  final _emailController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _fullNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() async {
    final email = _emailController.text.trim();
    final fullName = _fullNameController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || fullName.isEmpty || password.isEmpty) return;

    final success = await ref.read(authStateProvider.notifier).register(email, fullName, password);

    if (success && mounted) {
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateProvider);
    final isLoading = authState is AuthLoading;
    String? errorMessage;

    if (authState is AuthError) {
      errorMessage = authState.message;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _fullNameController,
          decoration: const InputDecoration(labelText: 'Full Name'),
        ),
        
        const SizedBox(height: 16),
        
        TextField(
          controller: _emailController,
          decoration: const InputDecoration(labelText: 'Email'),
          keyboardType: TextInputType.emailAddress,
        ),
        
        const SizedBox(height: 16),
        
        TextField(
          controller: _passwordController,
          decoration: const InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        
        const SizedBox(height: 8),
        
        if (errorMessage != null)
          Text(
            errorMessage,
            style: const TextStyle(color: Colors.red),
          ),
        
        const SizedBox(height: 24),
        
        ElevatedButton(
          onPressed: isLoading ? null : _register,
          child: isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Register'),
        ),
        
        const SizedBox(height: 16),
        
        Center(
          child: TextButton(
            onPressed: () => context.go('/login'),
            child: const Text('Already have an account? Login'),
          ),
        ),
      ],
    );
  }
}
