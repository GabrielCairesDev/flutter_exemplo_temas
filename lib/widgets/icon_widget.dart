/// Este arquivo define o widget [IconWidget], responsável por renderizar
/// um ícone com a cor temática terciária da aplicação.
///
/// Ele é utilizado para compor outros widgets (como botões), garantindo
/// que os ícones sigam a identidade visual definida dinamicamente pelo tema.
///
/// A cor do ícone é definida por meio do [ThemeContext], acessando o `tertiaryColor`.
library;

import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/core/theme/theme_context.dart';

/// Ícone estilizado com a cor terciária do tema atual.
///
/// Este widget é útil para garantir consistência visual em ícones,
/// especialmente quando utilizados dentro de botões ou componentes customizados.
class IconWidget extends StatelessWidget {
  /// Construtor do [IconWidget].
  ///
  /// [icon] é o [IconData] que será exibido.
  const IconWidget({super.key, required this.icon});

  /// Ícone a ser renderizado.
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,

      // Aplica a cor terciária do tema para o ícone.
      color: context.theme.tertiaryColor,
    );
  }
}
