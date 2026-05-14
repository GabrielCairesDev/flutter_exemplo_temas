import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/ui/home/widgets/home_screen.dart';
import 'package:flutter_exemplo_temas/ui/theme/widgets/theme_screen.dart';

abstract final class AppRoutes {
  AppRoutes._();

  static const String home = '/';
  static const String theme = '/theme';

  static Map<String, WidgetBuilder> get materialRoutes => {
    home: (_) => const HomeScreen(),
    theme: (_) => const ThemeScreen(),
  };
}
