import 'package:flutter/cupertino.dart';

class BasePage extends StatefulWidget {
  final String pageName;
  BasePage({this.pageName,Key key}) : super(key: key);
  @override
  BasePageState createState() => BasePageState();
}

class BasePageState<T extends BasePage> extends State<T> {
  BuildContext currentContext;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}