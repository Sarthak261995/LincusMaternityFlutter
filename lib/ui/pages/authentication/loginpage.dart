import 'package:flutter/material.dart';
import 'package:lincus_maternity/services/service_locator.dart';
import 'package:lincus_maternity/stores/authentication/login_store.dart';
import 'package:lincus_maternity/stores/locator.dart';

import '../base_page.dart';

class LoginPage extends BasePage {

  final String title;
  LoginPage({String this.title});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends BasePageState<LoginPage> {
  LoginStore model = AppLocator.login_store;

  @override
  void initState() {
    super.initState();
    //widget.store.loadInitialStories();
  }

  @override
  Widget build(BuildContext context) {
    final logo = Padding(
      padding: EdgeInsets.all(40.0),
      child: Image.asset('assets/actingweb-header-small.png'),
    );
    var welcomeText = 'Hello';
    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        welcomeText,
      ),
    );
    var body;
    if (1==2) {
      body = Column(
        children: [logo, welcome],
        mainAxisAlignment: MainAxisAlignment.center,
      );
    } else {
      body = Column(
        children: [logo, welcome],
        mainAxisAlignment: MainAxisAlignment.center,
      );
    }
    super.currentContext = context;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(28.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.grey, Theme.of(context).primaryColor]),
        ),
        child: body,
      ),
    );
  }
}