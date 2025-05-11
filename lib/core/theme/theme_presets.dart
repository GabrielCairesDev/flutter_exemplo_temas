/// Este arquivo define a classe [ThemePresets], responsável por armazenar os temas
/// predefinidos da aplicação.
///
/// Cada tema está associado a um valor da enum [ThemeType] e implementado como um
/// [ThemeModel], contendo cores específicas inspiradas em diferentes países.
///
/// A estrutura permite acessar rapidamente os temas disponíveis de forma organizada e segura,
/// promovendo reutilização e centralização da configuração de temas.
library;

import 'package:flutter/material.dart';
import 'theme_model.dart';
import 'theme_type.dart';

/// Classe utilitária que agrupa os temas predefinidos da aplicação.
class ThemePresets {
  /// Mapa contendo todos os temas disponíveis, associados ao respectivo [ThemeType].
  ///
  /// Essa estrutura facilita a seleção de temas com base em uma chave clara e semântica.
  static final Map<ThemeType, ThemeModel> all = {
    /// Tema do Brasil: verde, amarelo e azul.
    ThemeType.brazil: const ThemeModel(
      name: 'Brasil',
      primary: Color(0xFF009739),
      secondary: Color(0xFFFFCC29),
      tertiary: Color(0xFF002776),
      text: Color(0xFFFFFFFF),
      emoji: '🇧🇷',
    ),

    /// Tema dos Estados Unidos: azul escuro, branco e vermelho.
    ThemeType.unitedStates: const ThemeModel(
      name: 'Estados Unidos',
      primary: Color(0xFF3C3B6E),
      secondary: Color(0xFFFFFFFF),
      tertiary: Color(0xFFB22234),
      text: Color(0xFF000000),
      emoji: '🇺🇸',
    ),

    /// Tema da Índia: laranja, branco e verde.
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
