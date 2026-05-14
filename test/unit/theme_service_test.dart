import 'package:flutter_exemplo_temas/core/theme/theme_type.dart';
import 'package:flutter_exemplo_temas/data/services/theme_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('retorna padrão quando vazio', () async {
    final prefs = await SharedPreferences.getInstance();
    final service = ThemeService(prefs);
    expect(service.load(), ThemeType.brazil);
  });

  test('salva e carrega corretamente', () async {
    final prefs = await SharedPreferences.getInstance();
    final service = ThemeService(prefs);
    await service.save(ThemeType.india);
    expect(service.load(), ThemeType.india);
  });

  test('serializa ThemeType pelo nome', () async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('app_theme_type', ThemeType.unitedStates.name);
    final service = ThemeService(prefs);
    expect(service.load(), ThemeType.unitedStates);
  });
}
