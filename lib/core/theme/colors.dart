import 'package:flutter/material.dart';

const _seed = Color.fromARGB(255, 7, 119, 255);

final lightColorScheme = ColorScheme.fromSeed(
  seedColor: _seed,
  brightness: Brightness.light,
);

final darkColorScheme = ColorScheme.fromSeed(
  seedColor: _seed,
  brightness: Brightness.dark,
);