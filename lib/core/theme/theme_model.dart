import 'package:flutter/material.dart';

class ThemeModel {
  final String name;
  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color text;
  final String emoji;

  const ThemeModel({
    required this.name,
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.text,
    required this.emoji,
  });
}
