# Flutter: Um APP, Vários Temas 🌎

Este é um projeto Flutter que demonstra como implementar múltiplos temas dinâmicos usando MVVM e Provider.

## ✨ Funcionalidades

- Alternância entre temas personalizados (Brasil 🇧🇷, EUA 🇺🇸, Índia 🇮🇳)
- Persistência do tema escolhido com SharedPreferences
- Acesso reativo ao tema usando extensões no BuildContext
- Arquitetura organizada (MVVM)

## 📂 Estrutura do Projeto

```
/bootstrap
  └── app_initializer.dart
/core
  └── theme/
      ├── theme_controller.dart
      ├── theme_context.dart
      ├── theme_model.dart
      ├── theme_presets.dart
      └── theme_type.dart
/view
  └── home_view.dart
/view_model
  └── theme_view_model.dart
main.dart
my_app.dart
```

## 🚀 Como Executar

```bash
flutter pub get
flutter run
```

## 🔗 Medium

[Ler no Medium](https://medium.com/@gabriel.araujo.caires/flutter-um-app-v%C3%A1rios-temas-d521333c95dd)

![Preview do app com múltiplos temas](https://miro.medium.com/v2/resize:fit:4800/format:webp/1*oevSok8Jh0vFFlb5F8OkeQ.png)
