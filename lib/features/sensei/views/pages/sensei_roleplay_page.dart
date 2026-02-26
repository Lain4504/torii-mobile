import 'package:flutter/material.dart';
import 'package:torri_mobile/core/widgets/app_scaffold.dart';

class SenseiRoleplayPage extends StatefulWidget {
  const SenseiRoleplayPage({super.key});

  @override
  State<SenseiRoleplayPage> createState() => _SenseiRoleplayPageState();
}

class _SenseiRoleplayPageState extends State<SenseiRoleplayPage> {
  // TODO: Implement Roleplay logic with Riverpod
  // - State for topic, message history
  // - Provider to handle sending messages and playing audio

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'AI Roleplay',
      body: Center(
        child: Text(
          'Chức năng Hội thoại Tình huống (Roleplay) đang được phát triển.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
