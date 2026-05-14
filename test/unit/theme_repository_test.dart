import 'package:flutter_exemplo_temas/core/theme/theme_type.dart';
import 'package:flutter_exemplo_temas/data/repositories/theme_repository.dart';
import 'package:flutter_exemplo_temas/data/services/theme_service.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeThemeService implements ThemeService {
  FakeThemeService({ThemeType initial = ThemeType.brazil}) : _current = initial;

  ThemeType _current;
  int saveCallCount = 0;

  @override
  ThemeType load() => _current;

  @override
  Future<void> save(ThemeType type) async {
    saveCallCount++;
    _current = type;
  }
}

void main() {
  test('carrega tipo inicial do service', () {
    final fake = FakeThemeService(initial: ThemeType.india);
    final repo = ThemeRepository.fromService(fake);
    expect(repo.currentType, ThemeType.india);
  });

  test('setTheme atualiza tipo após save', () async {
    final fake = FakeThemeService();
    final repo = ThemeRepository.fromService(fake);
    await repo.setTheme(ThemeType.india);
    expect(repo.currentType, ThemeType.india);
  });

  test('setTheme ignora chamada com mesmo valor', () async {
    final fake = FakeThemeService(initial: ThemeType.brazil);
    final repo = ThemeRepository.fromService(fake);
    await repo.setTheme(ThemeType.brazil);
    expect(fake.saveCallCount, 0);
    expect(repo.currentType, ThemeType.brazil);
  });
}
