import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService  {
  static final String _useDarkModeKey = 'useDarkMode';
  static final String _favouritesKey = 'favourites';

   SharedPreferences _sharedPreferences;
  PreferencesService(SharedPreferences this._sharedPreferences);

  Future<void> Initialise() async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  set useDarkMode(bool useDarkMode) {
    _sharedPreferences.setBool(_useDarkModeKey, useDarkMode);
  }

  bool get useDarkMode => _sharedPreferences.getBool(_useDarkModeKey) ?? false;

  List<String> get favourites =>
      _sharedPreferences.getStringList(_favouritesKey) ?? List<String>();

  set favourites(List<String> favourites) {
    _sharedPreferences.setStringList(_favouritesKey, favourites);
  }

  Future<void> _saveToPreferences(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String> _getStringFromPreferences(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return Future<String>.value(prefs.getString(key) ?? '');
  }

}