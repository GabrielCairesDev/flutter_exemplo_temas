/// Este arquivo define o widget [ThemeView], responsável por exibir a lista de temas
/// disponíveis para o usuário selecionar.
///
/// Ele atua como a **View** no padrão MVVM e se comunica com o [ThemeViewModel],
/// que fornece os temas disponíveis e o tema atualmente ativo.
///
/// Ao tocar em um item da lista, o tema da aplicação é alterado dinamicamente via [ThemeController],
/// refletindo imediatamente em toda a interface da aplicação.
///
/// Esta tela utiliza um [ListView] com [ListTile] para apresentar as opções de forma clara,
/// e marca com um ícone verde o tema atualmente selecionado.
library;

import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/widgets/app_bar_widget.dart';
import 'package:flutter_exemplo_temas/widgets/scaffold_widget.dart';
import 'package:flutter_exemplo_temas/widgets/theme_list_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_exemplo_temas/view_model/theme_view_model.dart';

/// Tela de seleção de tema.
///
/// Este widget representa a interface que permite ao usuário escolher entre os temas disponíveis.
/// Ele observa a [ThemeViewModel] via `Provider` para obter os dados e reagir a mudanças no estado.
class ThemeView extends StatelessWidget {
  /// Construtor constante.
  const ThemeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtém a ViewModel usando o Provider, escutando mudanças automaticamente.
    final viewModel = context.watch<ThemeViewModel>();

    return ScaffoldWidget(
      // Barra superior com título da tela.
      appBar: AppBarWidget(title: 'Selecionar Tema'),

      // Lista de temas disponíveis, com destaque para o tema atualmente selecionado.
      body: ListView.builder(
        itemCount: viewModel.availableThemes.length,
        itemBuilder: (context, index) {
          // Extrai a entrada (chave e descrição) do tema na posição atual.
          final entry = viewModel.availableThemes.entries.elementAt(index);

          // Verifica se este é o tema atualmente selecionado.
          final isSelected = entry.key == viewModel.currentTheme;

          return ThemeListTileWidget(
            label: entry.value,
            selected: isSelected,
            // Ao tocar, altera o tema da aplicação.
            onTap: () => viewModel.changeTheme(entry.key),
          );
        },
      ),
    );
  }
}
