/// Este arquivo define o widget [MyApp], que representa a raiz da árvore de widgets
/// da aplicação após a fase de inicialização.
///
/// A responsabilidade do [MyApp] é configurar o `MaterialApp`, definindo o título
/// da aplicação e a tela inicial a ser exibida.
///
/// Este widget pode ser estendido para configurar temas dinâmicos e rotas nominais
/// no futuro, tornando-o um ponto central para configurações globais da interface.

library;

import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/view/home_view.dart';

/// Widget principal da aplicação que configura o `MaterialApp`.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// Desativa o banner de modo de depuração.
      debugShowCheckedModeBanner: false,

      /// Define o título da aplicação.
      title: 'Flutter Exemplo Temas',

      /// Página inicial exibida ao iniciar o app.
      home: HomeView(),
    );
  }
}
