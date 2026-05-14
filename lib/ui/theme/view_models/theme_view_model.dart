import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/core/theme/theme_presets.dart';
import 'package:flutter_exemplo_temas/core/theme/theme_type.dart';
import 'package:flutter_exemplo_temas/data/repositories/theme_repository.dart';

class ThemeViewModel extends ChangeNotifier {
  ThemeViewModel(this._repository);

  final ThemeRepository _repository;

  Color get primaryColor => _repository.currentTheme.primary;
  Color get secondaryColor => _repository.currentTheme.secondary;
  Color get tertiaryColor => _repository.currentTheme.tertiary;
  Color get textColor => _repository.currentTheme.text;
  String get name => _repository.currentTheme.name;
  String get emoji => _repository.currentTheme.emoji;
  ThemeType get currentType => _repository.currentType;

  Map<ThemeType, String> get themes =>
      ThemePresets.all.map((k, v) => MapEntry(k, v.name));

  Future<void> setTheme(ThemeType type) async {
    if (type == currentType) return;
    try {
      await _repository.setTheme(type);
    } catch (_) {}
    notifyListeners();
  }
}
