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
