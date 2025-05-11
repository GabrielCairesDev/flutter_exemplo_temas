/// Este arquivo define uma extensão sobre [BuildContext] chamada [ThemeContext].
///
/// A responsabilidade da extensão é facilitar o acesso ao [ThemeController] por meio
/// do contexto do Flutter, utilizando o pacote `provider`.
///
/// Ela fornece dois métodos de acesso: um reativo (`watch`) e um estático (`read`),
/// permitindo ao desenvolvedor escolher entre escutar mudanças no tema ou apenas
/// acessar o valor atual, sem escutar atualizações.
///
/// Isso torna o código mais limpo, legível e reduz a repetição ao lidar com temas dinâmicos.
library;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_controller.dart';

/// Extensão em [BuildContext] que facilita o acesso ao [ThemeController].
extension ThemeContext on BuildContext {
  /// Acesso reativo ao [ThemeController], atualiza o widget ao detectar mudanças.
  ThemeController get theme => watch<ThemeController>();

  /// Acesso não reativo ao [ThemeController], útil quando não é necessário escutar mudanças.
  ThemeController get themeStatic => read<ThemeController>();
}
