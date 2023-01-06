import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static SharedPreferences? storage;

// Load the saved string from Shared Preferences
  _loadSavedString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

// Save the string to Shared Preferences
  _saveAString(String key, String str) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, str.trim());
  }

  _clearPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  _deletePreference(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
