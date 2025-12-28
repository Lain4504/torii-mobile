import 'package:flutter/material.dart';
import '../core/routing/app_router.dart';
import '../core/theme/app_theme.dart';

class ToriiApp extends StatelessWidget {
  const ToriiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Torii',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: AppRouter.config,
      debugShowCheckedModeBanner: false,
    );
  }
}

