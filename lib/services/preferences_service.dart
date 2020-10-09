import 'dart:convert';
import 'package:lincus_maternity/models/authentication/access_token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static final String _useDarkModeKey = 'useDarkMode';
  static final String _favouritesKey = 'favourites';
  static final String _accessTokenKey = 'accessTokenKey';

  SharedPreferences _sharedPreferences;

  PreferencesService(this._sharedPreferences);

  Future<void> initialise() async {
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

  Future<void> saveToPreferences(String key, String value) async {
    //final prefs = await SharedPreferences.getInstance();
    _sharedPreferences.setString(key, value);
  }

  Future<String> getStringFromPreferences(String key) async {
    //final prefs = await SharedPreferences.getInstance();
    return Future<String>.value(_sharedPreferences.getString(key) ?? '');
  }

  Future<void> saveAccessToken(AccessToken token) {
    if (token != null && !IsNullOrEmpty(token.accessToken)) {
      String serialiserToken = jsonEncode(token);
      _sharedPreferences.setString(_accessTokenKey, serialiserToken);
    }
  }

  Future<AccessToken> getAccessToken() {
    AccessToken accessToken;
    if (_sharedPreferences.containsKey(_accessTokenKey)) {}
    {
      String tokenString = _sharedPreferences.getString(_accessTokenKey) ?? '';
      if (!IsNullOrEmpty(tokenString)) {}
      {
        Map<String, dynamic> json = jsonDecode(tokenString);
        if (json != null) {
          accessToken = AccessToken.fromJson(json);
        }
      }
    }
    return Future<AccessToken>.value(accessToken);
  }

  bool get isUserLoggedIn => checkIfUserLoggedIn ?? false;

  bool IsNullOrEmpty(String value) {
    bool result = false;
    if (value == null || value.isEmpty)
      result = true;
    return result;
  }

  Future<bool> checkIfUserLoggedIn() {
    bool result = false;
    if (_sharedPreferences.containsKey(_accessTokenKey)) {}
    {
      String tokenString = _sharedPreferences.getString(_accessTokenKey) ?? '';
      if (!IsNullOrEmpty(tokenString)) {}
      {
        Map<String, dynamic> json = jsonDecode(tokenString);
        if (json != null) {
          AccessToken accessToken = AccessToken.fromJson(json);
          if(accessToken != null && !IsNullOrEmpty(accessToken.accessToken))
            result = true;
        }
      }
    }
    return Future<bool>.value(result);
  }
}