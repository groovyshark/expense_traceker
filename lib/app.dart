import 'package:flutter/material.dart';

import 'package:expense_tracker/screens/expenses_screen.dart';
import 'package:expense_tracker/core/theme/app_theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  final ThemeMode _mode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      home: ExpencesScreen(),
      themeMode: _mode,
    );
  }
}