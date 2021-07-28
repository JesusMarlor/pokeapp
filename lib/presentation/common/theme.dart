
import 'package:flutter/material.dart' show Color, ThemeData;

class PokeAppColors{

  static final yellow  = Color(0xffffff2b);
  static final blue    = Color(0xff2ae6f7);
  static final orange  = Color(0xfff7a82a);
  static final green   = Color(0xff2af771);

  static final ligthOrange  = Color(0xfff7a82a).withOpacity(0.5);
  static final ligthBlue    = Color(0xff2ae6f7).withOpacity(0.5);

  static final iconGrey     = Color(0xffd8cdcd);
  static final buttonGreen  = Color(0xff52b268);

}

final pokeGradients = [
  PokeAppColors.blue,
  PokeAppColors.ligthBlue
];

final lightTheme = ThemeData();