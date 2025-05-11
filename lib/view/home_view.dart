/// Este arquivo define a classe [HomeView], responsável por exibir a interface
/// principal da aplicação com base na lógica fornecida pela [HomeViewModel].
///
/// No padrão de arquitetura MVVM, a View (neste caso, `HomeView`) é responsável
/// por construir a interface com base nos dados e comportamentos expostos pela ViewModel.
/// Este widget escuta mudanças na [HomeViewModel] e reconstrói a interface automaticamente
/// usando `ListenableBuilder`.
library;

import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/core/theme/theme_context.dart';
import 'package:flutter_exemplo_temas/widgets/app_bar_widget.dart';
import 'package:flutter_exemplo_temas/widgets/floating_action_button_widget.dart';
import 'package:flutter_exemplo_temas/widgets/icon_button_widget.dart';
import 'package:flutter_exemplo_temas/widgets/scaffold_widget.dart';
import 'package:flutter_exemplo_temas/widgets/text_widget.dart';
import '../view_model/home_view_model.dart';

/// Tela principal da aplicação.
///
/// Esta view utiliza um [ListenableBuilder] para reagir a mudanças na [HomeViewModel].
/// O layout consiste em uma [AppBar] personalizada, um corpo central com texto e contador,
/// e um botão flutuante que incrementa esse contador.
class HomeView extends StatelessWidget {
  /// Construtor padrão.
  HomeView({super.key});

  /// Instância da ViewModel que gerencia o estado da interface.
  final HomeViewModel _viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      /// Escuta alterações na ViewModel e reconstrói a interface quando necessário.
      listenable: _viewModel,
      builder: (context, _) {
        return ScaffoldWidget(
          /// Barra superior com título e botão de navegação para seleção de tema.
          appBar: AppBarWidget(
            title: 'Flutter exemplo temas',
            actions: [
              IconButtonWidget(
                icon: Icons.settings,
                onPressed: () => _viewModel.navigateToThemeView(context),
              ),
            ],
          ),

          /// Corpo central com mensagens e valor atual do contador.
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  text: 'Você apertou o botão vezes: ${_viewModel.counter}',
                ),

                SizedBox(height: 16),

                /// Botão que navega para a tela de tema Selecionado.
                InkWell(
                  onTap: () => _viewModel.navigateToThemeSelectedView(context),
                  /// Exibe o emoji do tema selecionado.
                  child: TextWidget(text: context.theme.emoji, fontSize: 48),
                ),
                /// Exibe o nome do tema selecionado.
                TextWidget(text: context.theme.name, fontSize: 24),
              ],
            ),
          ),

          /// Botão flutuante que incrementa o contador ao ser pressionado.
          floatingActionButton: FloatingActionButtonWidget(
            onPressed: _viewModel.incrementCounter,
            child: IconButtonWidget(icon: Icons.add),
          ),
        );
      },
    );
  }
}
