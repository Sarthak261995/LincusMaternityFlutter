import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
  @override
  Widget build(BuildContext context) {
    super.currentContext = context;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body:  GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white ,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -13,
              right: -13,
              child: Image.asset('assets/images/image1.png',height: 80,width: MediaQuery.of(context).size.width * 0.4, fit: BoxFit.fill,),
            ),
            Positioned(
              bottom: -10,
              child: Image.asset('assets/images/footer.png',height: 150,width: MediaQuery.of(context).size.width, fit: BoxFit.fill,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 60,right: 30),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center ,
                    children: <Widget>[
                      Image.asset('assets/images/image8.png', fit: BoxFit.contain, height: 60, width: 60 ),
                      RichText(
                          text:TextSpan(text: 'LincUs',style: TextStyle(
                            color: Colors.black,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                              children: <TextSpan>[
                                TextSpan(text: '  Maternity', style: TextStyle(color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.normal))
                              ]
                          )
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(top: 60),
                    padding: EdgeInsets.all(30.0),
                    decoration: BoxDecoration(shape: BoxShape.rectangle, color: Colors.white,borderRadius: BorderRadius.circular(10.0),boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                          spreadRadius: 5
                      ),
                    ]),
                    child: Column(
                      children: <Widget>[
                        Observer(
                            builder: (_) => TextField(
                              style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w600),
                              //onChanged: (value) => store.name = value,
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  floatingLabelBehavior: FloatingLabelBehavior.never  ,
                                  hintStyle: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w600),
                                  labelStyle:TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w600),
                                  prefixStyle: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w600),
                                  errorText: '',
                                  disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.withOpacity(0.9))),
                                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.withOpacity(0.9))),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)
                                  )
                              ),
                            )
                        ),
                        SizedBox(height: 10.0),
                        Observer(
                            builder: (_) => TextField(
                              style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w600),
                              //onChanged: (value) => store.name = value,
                              decoration: InputDecoration(
                                  hintText: 'Password',
                                  floatingLabelBehavior: FloatingLabelBehavior.never  ,
                                  hintStyle: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w600),
                                  labelStyle:TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w600),
                                  prefixStyle: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w600),
                                  errorText: '',
                                  disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.withOpacity(0.9))),
                                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.withOpacity(0.9))),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)
                                  )
                              ),
                            )
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 50.0,
                          child: RaisedButton(
                            elevation: 5,
                            onPressed: () {},
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [Colors.lightGreen, Colors.green],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0)
                              ),
                              child: Container(
                                constraints: BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
                                alignment: Alignment.center,
                                child: Text(
                                  "Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w800
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {},
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [Colors.blue, Colors.pink],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30.0)
                        ),
                        child: Container(
                          constraints: BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: Text(
                            "Register",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w800
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      )
    );
  }
}