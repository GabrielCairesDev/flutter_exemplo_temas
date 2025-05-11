/// Este arquivo define o widget [AppInitializer], responsável por inicializar
/// as configurações essenciais da aplicação antes de exibir a interface principal.
///
/// Ele cuida da carga assíncrona do [ThemeController], garantindo que o tema salvo
/// pelo usuário (persistido localmente) seja carregado corretamente antes da renderização
/// da aplicação. Após a inicialização, o controller e sua ViewModel são injetados
/// globalmente usando `MultiProvider`.

library;

import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/view_model/theme_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_exemplo_temas/my_app.dart';
import 'package:flutter_exemplo_temas/core/theme/theme_controller.dart';

/// Widget responsável por carregar configurações iniciais da aplicação, como o tema.
class AppInitializer extends StatelessWidget {
  const AppInitializer({super.key});

  /// Carrega e inicializa o [ThemeController], buscando o tema salvo no armazenamento local.
  Future<ThemeController> _loadTheme() async {
    final controller = ThemeController();
    await controller.init();
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ThemeController>(
      future: _loadTheme(),
      builder: (context, snapshot) {
        // Enquanto o tema ainda está sendo carregado, exibe um indicador de progresso.
        if (!snapshot.hasData) return const CircularProgressIndicator();

        final themeController = snapshot.data!;

        // Injeta o ThemeController e a ThemeViewModel globalmente com MultiProvider.
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<ThemeController>.value(
              value: themeController,
            ),
            ChangeNotifierProvider<ThemeViewModel>(
              create: (_) => ThemeViewModel(themeController),
            ),
          ],
          child: const MyApp(),
        );
      },
    );
  }
}
