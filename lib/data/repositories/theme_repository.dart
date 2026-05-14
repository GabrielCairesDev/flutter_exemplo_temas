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
