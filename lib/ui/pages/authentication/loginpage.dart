import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lincus_maternity/services/service_locator.dart';
import 'package:lincus_maternity/stores/authentication/login_store.dart';
import 'package:lincus_maternity/stores/locator.dart';
import 'package:mobx/mobx.dart';
import '../base_page.dart';

class LoginPage extends BasePage {

  final String title;
  LoginPage({String this.title});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends BasePageState<LoginPage> {
  LoginStore model = AppLocator.login_store;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    //widget.store.loadInitialStories();
  }

  final List<ReactionDisposer> _disposers = [];

  @override
  void dispose(){
    _disposers.forEach((disposer) => disposer());
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposers.add(
      reaction(
            (_) => model.showError,
            (_)
            {
              if(model.showError == true)
              {
                  showSnackBar(text:model.errorText,scaffoldKey: _scaffoldKey);
                  _showMyDialog();
                  model.resetShowError();
              }
            },
      )
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  /*showSnackBar(String text)
  {
    final snackBar = SnackBar(
      content: Text(text,style: Theme.of(context).textTheme.bodyText1),
      duration: Duration(seconds: 2),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }*/

  @override
  Widget build(BuildContext context) {
    final logo = Padding(
      padding: EdgeInsets.all(40.0),
      child: SvgPicture.asset(
          'assets/images/avocado.svg',height: 30,width: 30,
      ) ,
    );
    var welcomeText = 'Hello';
    final welcome = GestureDetector( onTap: (){ model.errorText = "test exception"; model.showError = true;}, child:Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        welcomeText,
      ))
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
      key: _scaffoldKey,
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