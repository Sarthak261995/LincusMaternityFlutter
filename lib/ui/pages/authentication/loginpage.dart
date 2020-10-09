import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lincus_maternity/services/loader_service.dart';
import 'package:lincus_maternity/services/service_locator.dart';
import 'package:lincus_maternity/stores/authentication/login_store.dart';
import 'package:lincus_maternity/stores/locator.dart';
import 'package:lincus_maternity/ui/themes/styles.dart';
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
    model.setupValidations();
  }

  final List<ReactionDisposer> _disposers = [];

  @override
  void dispose() {
    model.dispose();
    _disposers.forEach((disposer) => disposer());
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposers.add(reaction(
      (_) => model.showError,
      (_) {
        if (model.showError == true) {
          showSnackBar(text: model.errorText, scaffoldKey: _scaffoldKey);
          //_showMyDialog();
          model.resetShowError();
        }
      },
    ));
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

  Widget _buildEmailField() {
    return Observer(
        builder: (_) => TextField(
              style: defaultTextFieldTextStyle,
              onChanged: (value) => model.username = value,
              decoration: InputDecoration(
                hintText: 'Email',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                hintStyle: defaultTextFieldTextStyle,
                labelStyle: defaultTextFieldTextStyle,
                prefixStyle: defaultTextFieldTextStyle,
                errorStyle: defaultErrorTextStyle,
                errorText: model.error.username,
                disabledBorder: defaultTextFieldUnderlineBorder,
                enabledBorder: defaultTextFieldUnderlineBorder,
                focusedBorder: defaultTextFieldUnderlineBorder,
                errorBorder: defaultErrorTextFieldUnderlineBorder,
              ),
            ));
  }

  Widget _buildPasswordField() {
    return Observer(
        builder: (_) => TextField(
            obscureText: true,
            style: defaultTextFieldTextStyle,
            onChanged: (value) => model.password = value,
            decoration: InputDecoration(
              hintText: 'Password',
              floatingLabelBehavior: FloatingLabelBehavior.never,
              hintStyle: defaultTextFieldTextStyle,
              labelStyle: defaultTextFieldTextStyle,
              prefixStyle: defaultTextFieldTextStyle,
              errorStyle: defaultErrorTextStyle,
              errorText: model.error.password,
              disabledBorder: defaultTextFieldUnderlineBorder,
              enabledBorder: defaultTextFieldUnderlineBorder,
              focusedBorder: defaultTextFieldUnderlineBorder,
              errorBorder: defaultErrorTextFieldUnderlineBorder,
            )));
  }

  Widget _buildLoginButton() {
    return Container(
      height: 50.0,
      child: RaisedButton(
        elevation: 5,
        onPressed: () async {
          FocusScope.of(context).unfocus();
          model.validateAll();
          if(model.canLogin) {
              LoaderService.instance.ShowLoader();
              bool result = await model.try_login();
              LoaderService.instance.HideLoader();
          }
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0XFFB6EFB0), Colors.lightGreen[400]],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.1, 0.6]),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize24,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterButton() {
    return Container(
      height: 50.0,
      child: RaisedButton(
        onPressed: () {},
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0XFF787DED),
                    Color(0XFFE68CE8).withOpacity(0.7)
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.1, 0.6]),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              "Register",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize24,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginFrame() {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: 60),
      padding: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
                spreadRadius: 5),
          ]),
      child: Column(
        children: <Widget>[
          _buildEmailField(),
          SizedBox(height: 10.0),
          _buildPasswordField(),
          SizedBox(height: 30.0),
          _buildLoginButton(),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.currentContext = context;
    LoaderService.instance.InitiateLoader(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: -13,
                  right: -13,
                  child: Image.asset(
                    'assets/images/image1.png',
                    height: 80,
                    width: MediaQuery.of(context).size.width * 0.4,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: -10,
                  child: Image.asset(
                    'assets/images/footer.png',
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 60, right: 30),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('assets/images/image8.png',
                              fit: BoxFit.contain, height: 60, width: 60),
                          RichText(
                              text: TextSpan(
                                  text: 'LincUs',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: fontSize28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: <TextSpan>[
                                TextSpan(
                                    text: ' Maternity',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: fontSize28,
                                        fontWeight: FontWeight.normal))
                              ]))
                        ],
                      ),
                      _buildLoginFrame(),
                      SizedBox(height: 30),
                      _buildRegisterButton()
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
