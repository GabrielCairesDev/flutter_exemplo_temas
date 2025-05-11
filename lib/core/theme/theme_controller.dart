/// Este arquivo define a classe [ThemeController], responsável pelo gerenciamento
/// dinâmico de temas da aplicação, incluindo a seleção, persistência e notificação de mudanças.
///
/// Ele usa o padrão de gerenciamento de estado com `ChangeNotifier`
/// e persiste a seleção de tema com `SharedPreferences`, garantindo que o tema
/// escolhido pelo usuário seja mantido entre sessões da aplicação.
library;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'theme_model.dart';
import 'theme_type.dart';
import 'theme_presets.dart';

/// Controlador de temas da aplicação.
///
/// Responsável por:
/// - Gerenciar o tema atual selecionado.
/// - Persistir a escolha do usuário.
/// - Notificar widgets sobre mudanças de tema.
class ThemeController with ChangeNotifier {
  /// Instância atual do tema em uso.
  late ThemeModel _colors;

  /// Tipo do tema atualmente selecionado.
  ThemeType _currentType = ThemeType.brazil;

  /// Chave usada para armazenar a seleção do tema localmente.
  static const _storageKey = 'app_theme_type';

  /// Mapa contendo todos os temas disponíveis.
  final Map<ThemeType, ThemeModel> _themes = ThemePresets.all;

  /// Inicializa o controlador, carregando o tema salvo no armazenamento local.
  /// Caso não haja valor salvo, define o tema padrão como o do Brasil.
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString(_storageKey);

    final type = ThemeType.values.firstWhere(
      (e) => e.name == stored,
      orElse: () => ThemeType.brazil,
    );

    // Garante que o tema existe no mapa antes de usar
    if (_themes.containsKey(type)) {
      _colors = _themes[type]!;
    } else {
      _colors = _themes[ThemeType.brazil]!;
    }

    _currentType = type;
    notifyListeners(); // Notifica a UI para reagir à alteração
  }

  // Getters para expor as propriedades do tema atual
  Color get primaryColor => _colors.primary;
  Color get secondaryColor => _colors.secondary;
  Color get tertiaryColor => _colors.tertiary;
  Color get textColor => _colors.text;
  String get name => _colors.name;
  String get emoji => _colors.emoji;
  ThemeType get currentType => _currentType;

  /// Getter auxiliar para inspeção dos temas disponíveis (útil para testes ou seletores de UI)
  Map<ThemeType, ThemeModel> get themes => _themes;

  /// Define um novo tema e persiste a escolha do usuário localmente.
  void setTheme(ThemeType type) async {
    if (_themes.containsKey(type)) {
      _currentType = type;
      _colors = _themes[type]!;
      notifyListeners(); // Notifica a UI para atualizar com o novo tema
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_storageKey, type.name);
    }
  }
}
