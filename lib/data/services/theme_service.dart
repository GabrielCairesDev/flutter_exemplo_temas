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
