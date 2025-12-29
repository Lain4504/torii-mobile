import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/auth_providers.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) return;

    await ref.read(authStateProvider.notifier).login(email, password);

    final authState = ref.read(authStateProvider);
    if (authState.isAuthenticated && mounted) {
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
        
        if (authState.error != null)
          Text(
            authState.error!,
            style: const TextStyle(color: Colors.red),
          ),
        
        const SizedBox(height: 24),
        
        ElevatedButton(
          onPressed: authState.isLoading ? null : _login,
          child: authState.isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Login'),
        ),
        
        const SizedBox(height: 16),
        
        Center(
          child: TextButton(
            onPressed: () => context.go('/register'),
            child: const Text('Create account'),
          ),
        ),
      ],
    );
  }
}
