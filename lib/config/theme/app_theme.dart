import 'package:flutter/material.dart';

const Color _primaryColor = Colors.yellow;

class AppTheme {
  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: _primaryColor,
    );
  }
}
