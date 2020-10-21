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

  @override
  void dispose() {
    super.dispose();
  }

  showSnackBar({String text, GlobalKey<ScaffoldState> scaffoldKey}) {
    final snackBar = SnackBar(
      content: Text(text, style: Theme.of(context).textTheme.bodyText1),
      duration: Duration(seconds: 2),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  Future<void> showAlert(String title, String message, BuildContext context,
      {String acknowledgeText = 'Ok'}) async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(acknowledgeText),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
