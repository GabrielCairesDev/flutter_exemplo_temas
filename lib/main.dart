import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/data/repositories/theme_repository.dart';
import 'package:flutter_exemplo_temas/my_app.dart';
import 'package:flutter_exemplo_temas/ui/home/view_models/home_view_model.dart';
import 'package:flutter_exemplo_temas/ui/theme/view_models/theme_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final themeRepository = ThemeRepository(prefs);

  runApp(
    MultiProvider(
      providers: [
        Provider<ThemeRepository>.value(value: themeRepository),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(
          create: (context) => ThemeViewModel(context.read<ThemeRepository>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
