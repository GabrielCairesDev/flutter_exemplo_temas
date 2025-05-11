/// Este arquivo define o widget [AppBarWidget], uma barra superior reutilizável
/// com título customizável e ações opcionais, estilizada com base no tema atual.
///
/// Ele acessa as cores do tema por meio do [ThemeContext], o que permite aplicar
/// dinamicamente o `primaryColor` e a `textColor` definidos pelo tema selecionado.
///
/// Esse widget implementa a interface [PreferredSizeWidget], permitindo ser usado
/// diretamente como `appBar` em um `Scaffold`.
library;

import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/core/theme/theme_context.dart';

/// AppBar reutilizável com título e ações opcionais.
///
/// Utiliza o tema atual da aplicação para definir cor de fundo e cor do texto/ícones.
/// Ideal para manter consistência visual em diferentes telas.
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  /// Construtor padrão da AppBar, recebe um [title] obrigatório e [actions] opcionais.
  const AppBarWidget({super.key, required this.title, this.actions});

  /// Título exibido no centro da AppBar.
  final String title;

  /// Lista de widgets opcionais exibidos à direita, como botões de ação.
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Cor de fundo definida pelo tema atual.
      backgroundColor: context.theme.primaryColor,

      // Cor dos ícones (ex: botão de voltar) definida pelo tema atual.
      iconTheme: IconThemeData(color: context.theme.textColor),

      // Título com estilo baseado na cor de texto do tema.
      title: Text(title, style: TextStyle(color: context.theme.textColor)),

      // Ações adicionais (ícones, menus etc.).
      actions: actions,
    );
  }

  /// Define o tamanho preferido da AppBar para uso pelo Scaffold.
  /// [kToolbarHeight] é a altura padrão da AppBar no Flutter.
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
