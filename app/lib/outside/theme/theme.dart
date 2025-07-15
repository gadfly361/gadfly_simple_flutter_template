import 'dart:ui';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'tokens/icon_size.dart';
part 'tokens/extensions.dart';
part 'tokens/radius.dart';
part 'tokens/spacing.dart';

class OutsideThemes {
  static ThemeData get lightTheme => _materialThemeData_light;
  static ThemeData get darkTheme => _materialThemeData_dark;
}

final _materialThemeData_light = ThemeData(
  useMaterial3: true,
  extensions: const [_tokenExtensions],
  colorScheme: const ColorScheme.light(),
);

final _materialThemeData_dark = ThemeData(
  useMaterial3: true,
  extensions: const [_tokenExtensions],
  colorScheme: const ColorScheme.dark(),
);
