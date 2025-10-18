import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF3E039C); //Se empieza por 0xFF
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.pink,
  Colors.white,
  Colors.yellow,
  Colors.red,
  Colors.orange,
];

class AppTheme {
  final int selectedColor;

  AppTheme({ 
    this.selectedColor = 0,
  })  : assert(selectedColor >= 0 && selectedColor<= _colorThemes.length-1 , 
  'Colors must be between 0 and ${_colorThemes.length}');
  ThemeData theme() {
    return ThemeData(useMaterial3: true, 
    colorSchemeSeed: _colorThemes[selectedColor]);
  }
}
