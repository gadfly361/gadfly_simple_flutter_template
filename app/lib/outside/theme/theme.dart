import 'dart:ui';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'tokens/icon_size.dart';
part 'tokens/extensions.dart';
part 'tokens/radius.dart';
part 'tokens/spacing.dart';

class OutsideTheme {
  OutsideTheme({
    required this.materialThemeData,
  });

  final ThemeData materialThemeData;
}

class OutsideThemes {
  static OutsideTheme get lightTheme => OutsideTheme(
    materialThemeData: _materialThemeData_light,
  );
  static OutsideTheme get darkTheme => OutsideTheme(
    materialThemeData: _materialThemeData_dark,
  );
}

final _materialThemeData_light = ThemeData(
  useMaterial3: true,
  extensions: const [_tokenExtensions],
);

final _materialThemeData_dark = _materialThemeData_light.copyWith(
  brightness: Brightness.dark,
);
