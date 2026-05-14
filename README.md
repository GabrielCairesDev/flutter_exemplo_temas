# Flutter: um app, vários temas personalizados

> Exemplo completo de temas reativos com persistência, seguindo a arquitetura oficial do Flutter (MVVM em camadas).

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-^3.7.2-0175C2?logo=dart)](https://dart.dev)

![Preview do app com múltiplos temas](https://miro.medium.com/v2/resize:fit:4800/format:webp/1*oevSok8Jh0vFFlb5F8OkeQ.png)

---

## Problema resolvido

`Theme.of(context)` resolve paletas estáticas. Mas quando você precisa de:

- **Cores semânticas próprias** (além do `ColorScheme` do Material)
- **Troca de tema em tempo real** sem restart
- **Persistência da escolha** entre sessões

…o Flutter não entrega isso out-of-the-box. Este projeto mostra o fluxo completo.

---

## Arquitetura

Segue a **arquitetura em camadas + MVVM** da [documentação oficial do Flutter](https://docs.flutter.dev/app-architecture):

```
Dados → Repositório → ViewModel → UI
```

| Camada | Localização | Responsabilidade |
|---|---|---|
| **Domínio** | `lib/core/theme/` | `ThemeModel` (imutável), `ThemeType` (enum), `ThemePresets.all` (mapa de presets) |
| **Dados** | `lib/data/` | `ThemeService` (SharedPreferences), `ThemeRepository` (fonte da verdade) |
| **UI** | `lib/ui/home/`, `lib/ui/theme/`, `lib/ui/core/widgets/` | `HomeViewModel` / `ThemeViewModel` (`ChangeNotifier`), `HomeScreen` / `ThemeScreen`, widgets reutilizáveis |
| **Navegação** | `lib/routing/app_routes.dart` | Rotas nomeadas (`/`, `/theme`) |

**Fluxo de dados unidirecional:**

```
SharedPreferences
      ↓
  ThemeService
      ↓
ThemeRepository (tipo atual + persistência via ThemeService)
      ↓
ThemeViewModel (ChangeNotifier)
      ↓
  Widgets (context.watch / extension theme)
```

**Nota:** o `MaterialApp` em `my_app.dart` **não** define `theme`/`darkTheme` ligados ao `ThemeViewModel`. As cores do preset aplicam-se onde o código usa `context.theme` (por exemplo `ScaffoldWidget`, `AppBarWidget`, `FloatingActionButtonWidget`, `IconButtonWidget`, `IconWidget`, `ThemeListTileWidget`). `Theme.of(context).colorScheme` continua o Material padrão.

---

## Funcionalidades

- 3 temas ilustrativos: **Brasil 🇧🇷**, **Estados Unidos 🇺🇸** e **Índia 🇮🇳** (`ThemeType.brazil`, `unitedStates`, `india`)
- Troca de tema em tempo real com rebuild reativo
- Persistência da escolha via `SharedPreferences`
- Contador local na home (`HomeViewModel`)
- Widgets de layout reutilizáveis que leem cores e textos do `ThemeViewModel` via `context.theme`
- Lista de temas: `ThemePickerListWidget` só recebe `themeLabels`, `selectedType` e `onThemeSelected`; `ThemeScreen` lê o VM e injeta os parâmetros
- Navegação entre home e tela de escolha de tema

---

## Estrutura do projeto

```
lib/
├── core/theme/
│   ├── theme_context.dart        # extension: theme (watch ThemeViewModel)
│   ├── theme_model.dart          # modelo imutável (nome, cores, emoji)
│   ├── theme_presets.dart        # ThemePresets.all — mapa ThemeType → ThemeModel
│   └── theme_type.dart           # enum das variantes de tema
├── data/
│   ├── repositories/
│   │   └── theme_repository.dart       # tipo atual + ThemeService (prefs)
│   └── services/
│       └── theme_service.dart          # acesso ao SharedPreferences
├── routing/
│   └── app_routes.dart             # constantes de rota + materialRoutes
├── ui/
│   ├── core/widgets/
│   │   ├── app_bar_widget.dart
│   │   ├── floating_action_button_widget.dart
│   │   ├── icon_button_widget.dart
│   │   ├── icon_widget.dart
│   │   ├── scaffold_widget.dart
│   │   └── theme_list_widget.dart      # ThemeListTileWidget
│   ├── home/
│   │   ├── view_models/home_view_model.dart
│   │   └── widgets/home_screen.dart
│   └── theme/
│       ├── view_models/theme_view_model.dart
│       └── widgets/
│           ├── theme_picker_list_widget.dart  # lista: parâmetros + callback
│           └── theme_screen.dart
├── main.dart                     # SharedPreferences, MultiProvider (repo, VMs)
└── my_app.dart                   # MaterialApp (sem ThemeData do preset), rotas via AppRoutes
test/
├── unit/
│   ├── home_view_model_test.dart
│   ├── theme_repository_test.dart
│   ├── theme_service_test.dart
│   └── theme_view_model_test.dart
└── widget_test.dart              # HomeScreen (contador), ThemeScreen (lista), MyApp (smoke + rotas)
```

---

## Dependências

| Pacote | Versão | Uso |
|---|---|---|
| `provider` | ^6.1.5+1 | Injeção de dependências e estado reativo |
| `shared_preferences` | ^2.5.3 | Persistência da escolha de tema |
| `cupertino_icons` | ^1.0.8 | Template Flutter (ícones Cupertino) |
| `flutter_lints` | ^5.0.0 | Lints recomendados (dev) |

---

## Como executar

```bash
flutter pub get
flutter test
flutter run
```

---

## Guia: levar para seu projeto

Os blocos abaixo reproduzem o código deste repositório (equivalentes aos ficheiros indicados; espaçamento pode coincidir ou não com o formatter).

### 1. Modelar o domínio

`lib/core/theme/theme_type.dart`:

```dart
enum ThemeType {
  brazil,
  unitedStates,
  india,
}
```

`lib/core/theme/theme_model.dart`:

```dart
import 'package:flutter/material.dart';

class ThemeModel {
  final String name;
  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color text;
  final String emoji;

  const ThemeModel({
    required this.name,
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.text,
    required this.emoji,
  });
}
```

### 2. Centralizar paletas

`lib/core/theme/theme_presets.dart`:

```dart
import 'package:flutter/material.dart';
import 'theme_model.dart';
import 'theme_type.dart';

class ThemePresets {
  static final Map<ThemeType, ThemeModel> all = {
    ThemeType.brazil: const ThemeModel(
      name: 'Brasil',
      primary: Color(0xFF009739),
      secondary: Color(0xFFFFCC29),
      tertiary: Color(0xFF002776),
      text: Color(0xFFFFFFFF),
      emoji: '🇧🇷',
    ),
    ThemeType.unitedStates: const ThemeModel(
      name: 'Estados Unidos',
      primary: Color(0xFF3C3B6E),
      secondary: Color(0xFFFFFFFF),
      tertiary: Color(0xFFB22234),
      text: Color(0xFF000000),
      emoji: '🇺🇸',
    ),
    ThemeType.india: const ThemeModel(
      name: 'Índia',
      primary: Color(0xFFFF9933),
      secondary: Color(0xFFFFFFFF),
      tertiary: Color(0xFF138808),
      text: Color(0xFF000000),
      emoji: '🇮🇳',
    ),
  };
}
```

### 3. Isolar persistência

`lib/data/services/theme_service.dart`:

```dart
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/theme/theme_type.dart';

class ThemeService {
  ThemeService(this._prefs);

  final SharedPreferences _prefs;

  static const String _storageKey = 'app_theme_type';

  ThemeType load() {
    try {
      final stored = _prefs.getString(_storageKey);
      if (stored == null) return ThemeType.brazil;
      return ThemeType.values.firstWhere(
        (e) => e.name == stored,
        orElse: () => ThemeType.brazil,
      );
    } catch (_) {
      return ThemeType.brazil;
    }
  }

  Future<void> save(ThemeType type) async {
    final saved = await _prefs.setString(_storageKey, type.name);
    if (!saved) {
      throw StateError('Não foi possível salvar o tema.');
    }
  }
}
```

### 4. Repositório como fonte da verdade

`lib/data/repositories/theme_repository.dart`:

```dart
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/theme/theme_model.dart';
import '../../core/theme/theme_presets.dart';
import '../../core/theme/theme_type.dart';
import '../services/theme_service.dart';

class ThemeRepository {
  factory ThemeRepository(SharedPreferences prefs) =>
      ThemeRepository.fromService(ThemeService(prefs));

  ThemeRepository.fromService(ThemeService service)
    : _service = service,
      _currentType = service.load();

  final ThemeService _service;
  ThemeType _currentType;

  ThemeType get currentType => _currentType;

  ThemeModel get currentTheme => ThemePresets.all[_currentType]!;

  Future<void> setTheme(ThemeType type) async {
    if (type == _currentType) return;
    try {
      await _service.save(type);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
    _currentType = type;
  }
}
```

Nos testes: `ThemeRepository.fromService` com fake de `ThemeService`, ou classe de teste que `implements ThemeRepository` (ver `test/unit/theme_view_model_test.dart`).

### 5. ViewModel

Sem estado de loading/erro na UI: `setTheme` falha em silêncio no `catch` e chama `notifyListeners()` no fim.

`lib/ui/theme/view_models/theme_view_model.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/core/theme/theme_presets.dart';
import 'package:flutter_exemplo_temas/core/theme/theme_type.dart';
import 'package:flutter_exemplo_temas/data/repositories/theme_repository.dart';

class ThemeViewModel extends ChangeNotifier {
  ThemeViewModel(this._repository);

  final ThemeRepository _repository;

  Color get primaryColor => _repository.currentTheme.primary;
  Color get secondaryColor => _repository.currentTheme.secondary;
  Color get tertiaryColor => _repository.currentTheme.tertiary;
  Color get textColor => _repository.currentTheme.text;
  String get name => _repository.currentTheme.name;
  String get emoji => _repository.currentTheme.emoji;
  ThemeType get currentType => _repository.currentType;

  Map<ThemeType, String> get themes =>
      ThemePresets.all.map((k, v) => MapEntry(k, v.name));

  Future<void> setTheme(ThemeType type) async {
    if (type == currentType) return;
    try {
      await _repository.setTheme(type);
    } catch (_) {}
    notifyListeners();
  }
}
```

### 6. Injeção na raiz

`lib/main.dart`:

```dart
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
```

### 7. Ergonomia na UI

`lib/core/theme/theme_context.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/ui/theme/view_models/theme_view_model.dart';
import 'package:provider/provider.dart';

extension ThemeContext on BuildContext {
  ThemeViewModel get theme => watch<ThemeViewModel>();
}
```

Exemplo de uso (trecho de `lib/ui/home/widgets/home_screen.dart`):

```dart
Text(
  'Você apertou o botão vezes: ${homeVm.counter}',
  style: TextStyle(color: context.theme.textColor),
)
```

Na `HomeScreen`, o contador vem de `context.watch<HomeViewModel>()`; o ícone de definições usa `Navigator.pushNamed(context, AppRoutes.theme)` (sem método auxiliar). O FAB: `FloatingActionButtonWidget(onPressed: homeVm.incrementCounter, child: const IconButtonWidget(icon: Icons.add))` — o toque é do `FloatingActionButton`; o `IconButtonWidget` filho vai **sem** `onPressed` (só ícone com cor do tema).

Use `context.theme` no build para reagir à troca de tema (`watch`). Para leitura pontual em callback, use `context.read<ThemeViewModel>()`.

### 8. Tela e lista de temas

A `ThemeScreen` usa `context.theme` e instancia o `ThemePickerListWidget` com `themeLabels: viewModel.themes`, `selectedType: viewModel.currentType` e `onThemeSelected: viewModel.setTheme`. O filho não usa `Provider` — só recebe dados e callback.

`lib/ui/theme/widgets/theme_screen.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/core/theme/theme_context.dart';
import 'package:flutter_exemplo_temas/ui/core/widgets/app_bar_widget.dart';
import 'package:flutter_exemplo_temas/ui/core/widgets/scaffold_widget.dart';
import 'package:flutter_exemplo_temas/ui/theme/widgets/theme_picker_list_widget.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.theme;

    return ScaffoldWidget(
      appBar: AppBarWidget(title: 'Selecionar Tema'),
      body: ThemePickerListWidget(
        themeLabels: viewModel.themes,
        selectedType: viewModel.currentType,
        onThemeSelected: viewModel.setTheme,
      ),
    );
  }
}
```

`lib/ui/theme/widgets/theme_picker_list_widget.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/core/theme/theme_type.dart';
import 'package:flutter_exemplo_temas/ui/core/widgets/theme_list_widget.dart';

class ThemePickerListWidget extends StatelessWidget {
  const ThemePickerListWidget({
    super.key,
    required this.themeLabels,
    required this.selectedType,
    required this.onThemeSelected,
  });

  final Map<ThemeType, String> themeLabels;
  final ThemeType selectedType;
  final Future<void> Function(ThemeType) onThemeSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: themeLabels.length,
      itemBuilder: (context, index) {
        final entry = themeLabels.entries.elementAt(index);
        final isSelected = entry.key == selectedType;

        return ThemeListTileWidget(
          label: entry.value,
          selected: isSelected,
          onTap: () => onThemeSelected(entry.key),
        );
      },
    );
  }
}
```

### 9. Testes

O ficheiro `test/unit/theme_view_model_test.dart` no repositório é a referência. Conteúdo atual:

```dart
import 'package:flutter_exemplo_temas/core/theme/theme_model.dart';
import 'package:flutter_exemplo_temas/core/theme/theme_presets.dart';
import 'package:flutter_exemplo_temas/core/theme/theme_type.dart';
import 'package:flutter_exemplo_temas/data/repositories/theme_repository.dart';
import 'package:flutter_exemplo_temas/ui/theme/view_models/theme_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeThemeRepository implements ThemeRepository {
  FakeThemeRepository({ThemeType initial = ThemeType.brazil}) : _type = initial;

  ThemeType _type;

  @override
  ThemeType get currentType => _type;

  @override
  ThemeModel get currentTheme => ThemePresets.all[_type]!;

  @override
  Future<void> setTheme(ThemeType type) async {
    _type = type;
  }
}

void main() {
  test('getters refletem o repositório', () {
    final repo = FakeThemeRepository(initial: ThemeType.india);
    final vm = ThemeViewModel(repo);
    expect(vm.currentType, ThemeType.india);
    expect(vm.primaryColor, ThemePresets.all[ThemeType.india]!.primary);
    vm.dispose();
  });

  test('setTheme delega ao repositório e notifica', () async {
    final repo = FakeThemeRepository();
    final vm = ThemeViewModel(repo);
    var notifications = 0;
    vm.addListener(() => notifications++);
    await vm.setTheme(ThemeType.india);
    expect(repo.currentType, ThemeType.india);
    expect(notifications, greaterThan(0));
    vm.dispose();
  });
}
```

---

## Leitura recomendada

- [Arquitetura Flutter — visão geral](https://docs.flutter.dev/app-architecture)
- [Guia de arquitetura](https://docs.flutter.dev/app-architecture/guide) — camadas UI vs dados, repositórios, ViewModels
- [Recomendações de arquitetura](https://docs.flutter.dev/app-architecture/recommendations) — MVVM, Provider, fluxo unidirecional

---

## Artigo

Explicação detalhada de cada decisão: [Ler no Medium](https://medium.com/@gabriel.araujo.caires/flutter-um-app-v%C3%A1rios-temas-d521333c95dd)
