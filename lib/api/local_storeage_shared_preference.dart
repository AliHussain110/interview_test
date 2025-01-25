import 'package:shared_preferences/shared_preferences.dart';

// i am using shared_preference to store token
// in this scanrio cuz of mock api we dont have token
// so i am using a bool if user has selected remember me then
// user wont have to login again
class SharedPreferencesService {
  static const String _rememberMeKey = 'rememberMe';

  Future<void> setRememberMe(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_rememberMeKey, value);
  }

  // Get the "Remember Me" value
  Future<bool> getRememberMe() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_rememberMeKey) ??
        false; // Default to false if not set
  }
}
