import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149F);

const List<Color> _colorThemes = [
  _customColor,
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
  Colors.teal,
  Colors.grey
];

class AppTheme {

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
  }) : assert (selectedColor >= 0 && selectedColor < _colorThemes.length,
  'el color debe ser entre 0 y ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor]
    );
  }
}