/// Este arquivo define o widget [ThemeListTileWidget], utilizado para representar
/// cada item da lista de temas disponíveis na tela de seleção de tema.
///
/// O widget exibe o nome do tema (usando [TextWidget]) e, caso esteja selecionado,
/// um ícone de confirmação (via [IconWidget]) à direita.
///
/// É um componente visual reutilizável que responde ao toque do usuário e
/// permite selecionar dinamicamente o tema da aplicação.
library;

import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/widgets/icon_widget.dart';
import 'package:flutter_exemplo_temas/widgets/text_widget.dart';

/// Item da lista de temas com suporte a seleção visual.
///
/// Utilizado em [ThemeView] para listar os temas disponíveis com indicação
/// clara de qual está ativo, por meio de um ícone de "check".
class ThemeListTileWidget extends StatelessWidget {
  /// Construtor do [ThemeListTileWidget].
  ///
  /// [label] define o nome do tema exibido.
  /// [selected] indica se este item representa o tema ativo.
  /// [onTap] é a ação executada ao tocar no item.
  const ThemeListTileWidget({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  /// Nome do tema exibido.
  final String label;

  /// Indica se este tema está atualmente selecionado.
  final bool selected;

  /// Ação executada ao tocar no item.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // Texto exibido como título do item.
      title: TextWidget(text: label),

      // Ícone de seleção exibido apenas se o tema estiver ativo.
      trailing: selected ? IconWidget(icon: Icons.check) : null,

      // Ação de toque no item.
      onTap: onTap,
    );
  }
}
