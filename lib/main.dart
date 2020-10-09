import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lincus_maternity/services/service_locator.dart';
import 'package:lincus_maternity/stores/locator.dart';
import 'package:lincus_maternity/ui/pages/authentication/loginpage.dart';
import 'package:lincus_maternity/ui/themes/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

  Future<void> main() async{
    WidgetsFlutterBinding.ensureInitialized();
    var sharedPreferences = await SharedPreferences.getInstance();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark// transparent status bar
    ));
    setupServiceLocator(sharedPreferences);
    Widget _defaultHome = new LoginPage();

    // Get result of the login function.
    bool _result = AppLocator.preferences_service.isUserLoggedIn;
    if (_result) {
      _defaultHome = new LoginPage();
    }
    runApp(App(_defaultHome));
}

class App extends StatelessWidget {
    final Widget _defaultHome;
    const App(this._defaultHome);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Lincus Maternity',
        theme: appTheme,
        home: _defaultHome,
    );
  }
}