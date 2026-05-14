import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/routing/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Exemplo Temas',
      initialRoute: AppRoutes.home,
      routes: AppRoutes.materialRoutes,
    );
  }
}
