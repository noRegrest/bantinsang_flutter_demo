import 'package:shared_preferences/shared_preferences.dart';

void initState() {
  super.initState();
  _loadSavedString("Email");
}

// Load the saved string from Shared Preferences
_loadSavedString(String key) async {
  final prefs = await SharedPreferences.getInstance();
  setState(() {
    _savedString = prefs.getString(key) ?? '';
  });
}

// Save the string to Shared Preferences
_saveString(String key, String str) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(key, str.trim());
}

_clearPreference() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
  _showAllPreferences();
}

Future<void> _deletePreference(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(key);
}
