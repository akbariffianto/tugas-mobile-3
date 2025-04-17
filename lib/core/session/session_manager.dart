import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static const _keyLogin = 'isLoggedIn';
  static String? _username;

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyLogin) ?? false;
  }

  static Future<void> login() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyLogin, true);
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyLogin);
  }

  static void setUsername(String username) {
    _username = username;
  }

  static String? getUsername() {
    return _username;
  }
}
