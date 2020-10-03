import 'package:flutter/material.dart';
import 'package:lincus_maternity/services/service_locator.dart';
import 'package:lincus_maternity/ui/pages/authentication/loginpage.dart';
import 'package:lincus_maternity/ui/themes/styles.dart';

  void main()  {
    setupServiceLocator();
    runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Lincus Maternity',
        theme: appTheme,
        home: LoginPage()
    );
  }
}