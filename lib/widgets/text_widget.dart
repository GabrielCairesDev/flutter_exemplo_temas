/// Este arquivo define o widget [TextWidget], uma versão personalizada do
/// [Text] do Flutter que aplica dinamicamente a cor do texto com base no
/// tema atual da aplicação.
///
/// Este widget é útil para garantir consistência visual em telas que dependem
/// da troca dinâmica de temas, utilizando o [ThemeContext] para aplicar a `textColor`.
library;

import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/core/theme/theme_context.dart';

/// Widget de texto reutilizável com suporte a tema dinâmico.
///
/// Renderiza uma string com a cor do texto definida pelo tema atual.
class TextWidget extends StatelessWidget {
  /// Construtor do [TextWidget].
  ///
  /// [text] é obrigatório e representa o conteúdo textual exibido.
  /// [fontSize] é opicional e define o tamanho da fonte.
  const TextWidget({super.key, required this.text, this.fontSize});

  /// Conteúdo textual a ser exibido.
  final String text;

  /// Tamanho da fonte.
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,

      // Aplica a cor do texto com base no tema atual.
      style: TextStyle(color: context.theme.textColor, fontSize: fontSize),
    );
  }
}
