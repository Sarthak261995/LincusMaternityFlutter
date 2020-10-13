import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  final String pageName;
  BasePage({this.pageName, Key key}) : super(key: key);
  @override
  BasePageState createState() => BasePageState();
}

class BasePageState<T extends BasePage> extends State<T> {
  BuildContext currentContext;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  showSnackBar({String text, GlobalKey<ScaffoldState> scaffoldKey}) {
    final snackBar = SnackBar(
      content: Text(text, style: Theme.of(context).textTheme.bodyText1),
      duration: Duration(seconds: 2),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
