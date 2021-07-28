
import 'package:flutter/material.dart' show Color, ThemeData;

class PokeAppColors{

  static final yellow  = Color(0xffff2b);
  static final blue    = Color(0x2ae6f7);
  static final orange  = Color(0xf7a82a);
  static final green   = Color(0x2af771);

  static final ligthOrange  = Color(0xf7a82a).withOpacity(0.5);
  static final ligthBlue    = Color(0x2ae6f7).withOpacity(0.5);

  static final iconGrey     = Color(0xd8cdcd);
  static final buttonGreen  = Color(0x52b268);

}

final pokeGradients = [
  PokeAppColors.blue,
  PokeAppColors.ligthBlue
];

final lightTheme = ThemeData();