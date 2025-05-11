/// Este arquivo define a classe [ThemeModel], que representa um modelo de tema personalizado.
/// A responsabilidade da classe é encapsular as principais cores usadas na aplicação,
/// permitindo a criação de múltiplos temas com nomes distintos.
///
/// Essa abordagem é útil para aplicar temas dinâmicos ou alternar entre diferentes paletas
/// de cores na interface do aplicativo, mantendo o código mais organizado e reutilizável.
library;

import 'package:flutter/material.dart';

/// Modelo de dados para representar um tema personalizado da aplicação.
class ThemeModel {
  /// Nome identificador do tema. Pode ser usado para seleção ou exibição.
  final String name;

  /// Cor primária do tema. Geralmente usada como cor principal da UI.
  final Color primary;

  /// Cor secundária do tema. Pode ser usada para botões, destaques ou outros elementos de suporte.
  final Color secondary;

  /// Cor terciária do tema. Utilizada como cor complementar ou decorativa.
  final Color tertiary;

  /// Cor de texto do tema. Geralmente usada para textos e elementos de interface.
  final Color text;

  /// Emoji associado ao tema. Pode ser usado para representar visualmente o tema.
  final String emoji;

  /// Construtor constante que permite a criação de um tema com nome e cores definidas.
  const ThemeModel({
    required this.name,
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.text,
    required this.emoji,
  });
}
