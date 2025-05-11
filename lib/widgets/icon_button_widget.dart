/// Este arquivo define o widget [IconButtonWidget], uma versão personalizada
/// do [IconButton] do Flutter que utiliza o sistema de temas dinâmicos da aplicação.
///
/// O ícone exibido é renderizado por meio do widget customizado [IconWidget],
/// e a cor do botão é definida pela `secondaryColor` do tema atual, permitindo
/// consistência visual com a identidade da aplicação.
library;

import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/core/theme/theme_context.dart';
import 'package:flutter_exemplo_temas/widgets/icon_widget.dart';

/// Botão de ícone personalizado com suporte a tema dinâmico.
///
/// Este widget encapsula um [IconButton] que utiliza o [IconWidget] como ícone
/// e aplica a `secondaryColor` do tema para o ícone.
class IconButtonWidget extends StatelessWidget {
  /// Construtor do botão de ícone.
  ///
  /// [icon] é obrigatório e representa o ícone que será exibido.
  /// [onPressed] é a função executada ao pressionar o botão (opcional).
  const IconButtonWidget({super.key, required this.icon, this.onPressed});

  /// Ícone a ser exibido no botão.
  final IconData icon;

  /// Callback opcional acionado ao pressionar o botão.
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      // Ícone renderizado usando o widget personalizado.
      icon: IconWidget(icon: icon),

      // Ação a ser executada ao pressionar o botão.
      onPressed: onPressed,

      // Cor do ícone definida pelo tema atual.
      color: context.theme.secondaryColor,
    );
  }
}
