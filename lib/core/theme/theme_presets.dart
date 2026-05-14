import 'package:flutter/material.dart';
import 'theme_model.dart';
import 'theme_type.dart';

class ThemePresets {
  static final Map<ThemeType, ThemeModel> all = {
    ThemeType.brazil: const ThemeModel(
      name: 'Brasil',
      primary: Color(0xFF009739),
      secondary: Color(0xFFFFCC29),
      tertiary: Color(0xFF002776),
      text: Color(0xFFFFFFFF),
      emoji: '🇧🇷',
    ),
    ThemeType.unitedStates: const ThemeModel(
      name: 'Estados Unidos',
      primary: Color(0xFF3C3B6E),
      secondary: Color(0xFFFFFFFF),
      tertiary: Color(0xFFB22234),
      text: Color(0xFF000000),
      emoji: '🇺🇸',
    ),
    ThemeType.india: const ThemeModel(
      name: 'Índia',
      primary: Color(0xFFFF9933),
      secondary: Color(0xFFFFFFFF),
      tertiary: Color(0xFF138808),
      text: Color(0xFF000000),
      emoji: '🇮🇳',
    ),
  };
}
