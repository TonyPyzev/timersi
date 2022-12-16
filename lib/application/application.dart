import 'package:flutter/material.dart';
import 'package:timersi/application/navigation/navigation.dart';
import 'package:timersi/application/theme/app_theme.dart';

class Application extends StatelessWidget {
  final String _title = 'Timersi';

  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      initialRoute: Navigation.initialRoute,
      routes: Navigation.routes,
    );
  }
}
