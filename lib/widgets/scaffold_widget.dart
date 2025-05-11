/// Este arquivo define o widget [ScaffoldWidget], uma versão personalizada do
/// [Scaffold] do Flutter, adaptada para aplicar dinamicamente o tema da aplicação.
///
/// A cor de fundo do `Scaffold` é ajustada com base no `primaryColor` do tema atual,
/// fornecido via [ThemeContext]. Esse widget serve como estrutura básica para
/// telas da aplicação, permitindo inclusão de `AppBar`, corpo (`body`) e
/// botão flutuante (`floatingActionButton`).
library;

import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/core/theme/theme_context.dart';

/// Estrutura base de tela com suporte a tema dinâmico.
///
/// Este widget encapsula o [Scaffold] padrão do Flutter e aplica a
/// `primaryColor` do tema atual como cor de fundo da tela.
class ScaffoldWidget extends StatelessWidget {
  /// Construtor do [ScaffoldWidget].
  ///
  /// Permite configurar um [appBar], o [body] da tela e um botão flutuante [floatingActionButton].
  const ScaffoldWidget({
    super.key,
    this.appBar,
    this.body,
    this.floatingActionButton,
  });

  /// Barra superior da aplicação (opcional).
  final PreferredSizeWidget? appBar;

  /// Conteúdo principal da tela.
  final Widget? body;

  /// Botão flutuante exibido sobre a tela (opcional).
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Aplica a cor de fundo conforme o tema atual.
      backgroundColor: context.theme.primaryColor,

      // AppBar opcional.
      appBar: appBar,

      // Corpo principal da tela.
      body: body,

      // Botão flutuante opcional.
      floatingActionButton: floatingActionButton,
    );
  }
}
