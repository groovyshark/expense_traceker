import 'package:flutter/material.dart';

AppBarTheme buildAppBarTheme(ColorScheme s) => AppBarTheme(
  backgroundColor: s.primaryContainer,
  foregroundColor: s.onPrimaryContainer,
  elevation: 2,
  centerTitle: true,
);

CardThemeData buildCardTheme(ColorScheme s) => CardThemeData(
  color: s.secondaryContainer,
  margin: const EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 8.0
  ),
);

ElevatedButtonThemeData buildElevatedButtonTheme(ColorScheme s) => ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: s.primaryContainer,
    foregroundColor: s.onPrimaryContainer,
  ),
);

TextButtonThemeData buildTextButtonTheme(ColorScheme s) => TextButtonThemeData(
  style: TextButton.styleFrom(
    // backgroundColor: s.secondary,
    foregroundColor: s.onPrimaryContainer,
  )
);