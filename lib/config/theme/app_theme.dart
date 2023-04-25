


import 'package:flutter/material.dart';


const Color _customColor = Color(0xFF49149f);

const List<Color> _colorThemes =[

  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.pink,
  Colors.orange
];

class AppTheme {

  final int selectedColor;

  AppTheme({ 
    this.selectedColor = 0
  });

    ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor]
      );
  }
}