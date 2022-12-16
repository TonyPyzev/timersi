import 'package:flutter/material.dart';
import 'package:timersi/application/widgets/header.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Header(title: 'Settings'),
      ],
    );
  }
}
