/// Este arquivo define a classe [ThemeViewModel], responsável por gerenciar a lógica
/// relacionada à seleção de temas dentro da aplicação.
///
/// No padrão de arquitetura MVVM, esta ViewModel atua como intermediária entre a
/// [ThemeView] (interface) e o [ThemeController] (lógica de aplicação).
///
/// Ela expõe o tema atual, a lista de temas disponíveis, e oferece um método para
/// alterar o tema, notificando automaticamente os widgets que escutam essa ViewModel.
library;

import 'package:flutter/material.dart';
import '../../core/theme/theme_controller.dart';
import '../../core/theme/theme_type.dart';

/// ViewModel da tela de seleção de tema.
///
/// Esta classe gerencia o estado do tema da aplicação, utilizando o [ThemeController]
/// como fonte de verdade e notificando os ouvintes quando há mudança de tema.
class ThemeViewModel extends ChangeNotifier {
  /// Controlador central que gerencia os temas da aplicação.
  final ThemeController _themeController;

  /// Construtor que recebe o [ThemeController] como dependência.
  ThemeViewModel(this._themeController);

  /// Retorna o tema atualmente ativo na aplicação.
  ThemeType get currentTheme => _themeController.currentType;

  /// Retorna todos os temas disponíveis como um mapa de [ThemeType] para `String` (nome legível).
  Map<ThemeType, String> get availableThemes =>
      _themeController.themes.map((key, value) => MapEntry(key, value.name));

  /// Altera o tema atual da aplicação e notifica os ouvintes para reconstrução da interface.
  void changeTheme(ThemeType type) {
    _themeController.setTheme(type);
    notifyListeners();
  }
}
