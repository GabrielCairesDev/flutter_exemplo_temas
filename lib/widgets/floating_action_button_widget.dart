/// Este arquivo define o widget [FloatingActionButtonWidget], uma versão
/// personalizada do [FloatingActionButton] do Flutter, estilizada com base
/// no tema atual da aplicação.
///
/// O botão utiliza a cor secundária do tema ([secondaryColor]) para seu
/// `backgroundColor`, garantindo consistência visual com o restante da interface.
///
/// Pode ser reutilizado em diferentes partes da aplicação, aceitando qualquer
/// widget como filho (ex: ícone) e uma função para tratar o evento de clique.
library;

import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/core/theme/theme_context.dart';

/// Botão flutuante personalizado com suporte a tema dinâmico.
///
/// Este widget é estilizado com a `secondaryColor` do tema atual e pode ser usado
/// para executar ações rápidas na interface, como incremento de um contador.
class FloatingActionButtonWidget extends StatelessWidget {
  /// Construtor do botão flutuante.
  ///
  /// [onPressed] define a ação a ser executada ao pressionar o botão.
  /// [child] representa o conteúdo visual dentro do botão, geralmente um ícone.
  const FloatingActionButtonWidget({super.key, this.onPressed, this.child});

  /// Callback acionado ao pressionar o botão.
  final void Function()? onPressed;

  /// Widget filho que será exibido dentro do botão (ex: [Icon]).
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      // Define a ação ao pressionar o botão.
      onPressed: onPressed,

      // Define a cor de fundo com base no tema atual.
      backgroundColor: context.theme.secondaryColor,

      // Conteúdo visual do botão.
      child: child,
    );
  }
}
