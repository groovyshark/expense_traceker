
import 'package:flutter/material.dart';

import 'colors.dart';
import 'components.dart';
import 'typography.dart';

class AppTheme {
  static ThemeData light() {
    final scheme = lightColorScheme;
    return ThemeData(
      appBarTheme: buildAppBarTheme(scheme),
      cardTheme: buildCardTheme(scheme),
      elevatedButtonTheme: buildElevatedButtonTheme(scheme),
      textButtonTheme: buildTextButtonTheme(scheme),
      textTheme: buildTextTheme(scheme.brightness),
      colorScheme: scheme,
    );
  }

  static ThemeData dark() {
    final scheme = darkColorScheme;
    return ThemeData(
      appBarTheme: buildAppBarTheme(scheme),
      cardTheme: buildCardTheme(scheme),
      elevatedButtonTheme: buildElevatedButtonTheme(scheme),
      textButtonTheme: buildTextButtonTheme(scheme),
      textTheme: buildTextTheme(scheme.brightness),
      colorScheme: scheme,
    );
  }
}