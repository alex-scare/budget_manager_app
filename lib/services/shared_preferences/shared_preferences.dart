import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  // singleton boilerplate
  static final SharedPreferencesService _singleton =
      SharedPreferencesService._internal();
  factory SharedPreferencesService() => _singleton;

  SharedPreferencesService._internal() {
    _instance = SharedPreferences.getInstance();
  }
  // end singleton boilerplate

  late Future<SharedPreferences> _instance;

  Future<bool> get isLoggerEnabled async {
    final prefs = await _instance;
    return prefs.getBool(_SharedPreferencesKey.isLoggerEnabled.name) ?? true;
  }

  Future<void> setLoggerEnabled(bool value) async {
    final prefs = await _instance;
    prefs.setBool(_SharedPreferencesKey.isLoggerEnabled.name, value);
  }
}

enum _SharedPreferencesKey {
  isLoggerEnabled,
  ;
}
