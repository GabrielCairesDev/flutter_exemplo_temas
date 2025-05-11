/// Este arquivo define a classe [HomeViewModel], responsável por conter
/// e gerenciar a lógica de estado da tela inicial (`HomePage`) da aplicação.
///
/// Dentro da arquitetura MVVM, a ViewModel atua como uma ponte entre a interface
/// (View) e os dados/lógica da aplicação. Neste caso, ela controla um contador
/// simples que pode ser incrementado, notificando automaticamente a interface
/// sobre as mudanças por meio do `ChangeNotifier`.
library;

import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/view/theme_selected_view.dart';
import 'package:flutter_exemplo_temas/view/theme_view.dart';

/// ViewModel da tela inicial (Home).
///
/// Gerencia o estado do contador e notifica os widgets que dependem dele.
class HomeViewModel extends ChangeNotifier {
  /// Estado interno do contador.
  int _counter = 0;

  /// Getter público para o valor atual do contador.
  int get counter => _counter;

  /// Incrementa o valor do contador e notifica os ouvintes (widgets) para atualização.
  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  /// Navega para a tela de seleção de tema.
  void navigateToThemeView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ThemeView()),
    );
  }

  /// Navega para a tela de bandeira.
  void navigateToThemeSelectedView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ThemeSelectedView()),
    );
  }
}
