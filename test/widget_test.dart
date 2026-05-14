import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/data/repositories/theme_repository.dart';
import 'package:flutter_exemplo_temas/my_app.dart';
import 'package:flutter_exemplo_temas/ui/home/view_models/home_view_model.dart';
import 'package:flutter_exemplo_temas/ui/home/widgets/home_screen.dart';
import 'package:flutter_exemplo_temas/ui/theme/view_models/theme_view_model.dart';
import 'package:flutter_exemplo_temas/ui/theme/widgets/theme_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<ThemeRepository> _repository() async {
  SharedPreferences.setMockInitialValues({});
  final prefs = await SharedPreferences.getInstance();
  return ThemeRepository(prefs);
}

void main() {
  group('HomeScreen', () {
    testWidgets('incrementa contador', (WidgetTester tester) async {
      TestWidgetsFlutterBinding.ensureInitialized();
      final repository = await _repository();
      final vm = ThemeViewModel(repository);

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            Provider<ThemeRepository>.value(value: repository),
            ChangeNotifierProvider(create: (_) => HomeViewModel()),
            ChangeNotifierProvider<ThemeViewModel>.value(value: vm),
          ],
          child: const MaterialApp(home: HomeScreen()),
        ),
      );

      expect(find.textContaining('vezes: 0'), findsOneWidget);
      expect(find.textContaining('vezes: 1'), findsNothing);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      expect(find.textContaining('vezes: 0'), findsNothing);
      expect(find.textContaining('vezes: 1'), findsOneWidget);
    });
  });

  group('ThemeScreen', () {
    testWidgets('lista temas e título', (WidgetTester tester) async {
      TestWidgetsFlutterBinding.ensureInitialized();
      final repository = await _repository();
      final vm = ThemeViewModel(repository);

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            Provider<ThemeRepository>.value(value: repository),
            ChangeNotifierProvider<ThemeViewModel>.value(value: vm),
          ],
          child: const MaterialApp(home: ThemeScreen()),
        ),
      );

      expect(find.text('Selecionar Tema'), findsOneWidget);
      expect(find.text('Brasil'), findsOneWidget);
      expect(find.text('Estados Unidos'), findsOneWidget);
      expect(find.text('Índia'), findsOneWidget);
    });
  });

  group('MyApp', () {
    testWidgets('smoke com rotas nomeadas', (WidgetTester tester) async {
      TestWidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();
      final repository = ThemeRepository(prefs);
      final vm = ThemeViewModel(repository);

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            Provider<ThemeRepository>.value(value: repository),
            ChangeNotifierProvider(create: (_) => HomeViewModel()),
            ChangeNotifierProvider<ThemeViewModel>.value(value: vm),
          ],
          child: const MyApp(),
        ),
      );

      expect(find.textContaining('vezes: 0'), findsOneWidget);
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(find.textContaining('vezes: 1'), findsOneWidget);
    });
  });
}
