import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lincus_maternity/models/birthplan/birthplan_question.dart';
import 'package:lincus_maternity/models/birthplan/birthplan_question_details.dart';
import 'package:lincus_maternity/models/birthplan/response/get_birthplan_question_response.dart';
import 'package:lincus_maternity/services/loader_service.dart';
import 'package:lincus_maternity/stores/birthplan/create_birthplan_store.dart';
import 'package:lincus_maternity/stores/locator.dart';
import 'package:lincus_maternity/ui/themes/styles.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';
import '../base_page.dart';

class CreateBirthPlanPage extends BasePage {
  final String title;
  CreateBirthPlanPage({this.title});

  @override
  _CreateBirthPlanPageState createState() => _CreateBirthPlanPageState();
}

class _CreateBirthPlanPageState extends BasePageState<CreateBirthPlanPage> {
  CreateBirthplanStore model = AppLocator.create_birthplan_store;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    model.clear_data();
    model.initialiseGetBirthplanQuestion();
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
          model.resetShowError();
        }
      },
    ));
    _disposers.add(reaction(
      (_) => model.showAlert,
      (_) {
        if (model.showAlert == true) {
          showAlert(model.alertTitle, model.alertMessage,
              _scaffoldKey.currentContext);
          model.resetAlertData();
        }
      },
    ));
  }

  int getBirthplanQuestionItemCount() {
    int count = 0;
    if (model?.birthplanDetailsList?.length > 0 ?? false)
      count = model?.birthplanDetailsList?.length;
    return count;
  }

  Widget buildMainBirthplanQuestionBody(BuildContext cntxt, int index) {
    BirthplanQuestionDetails itm = model.birthplanDetailsList.elementAt(index);
    int selectedIndex = itm.selectedIndex;
    Widget getTextWidget(String text) {
      if (!isNull(itm.text) && itm.text.isNotEmpty) {
        return Text(
          itm.text,
          style: TextStyle(
              color: appBodyTextBlackColor,
              fontWeight: FontWeight.w500,
              fontSize: fontSize22),
        );
      }
      return SizedBox.shrink();
    }

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 30),
          Text(
            itm.question,
            style: TextStyle(
                color: appBodyTextBlackColor,
                fontWeight: FontWeight.bold,
                fontSize: fontSize22),
          ),
          SizedBox(
            height: 10,
          ),
          getTextWidget(itm.text),
          SizedBox(
            height: 10,
          ),
          StatefulBuilder(builder: (cntxt, innerSetState) {
            return ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: itm?.questions?.length ?? 0,
                itemBuilder: (BuildContext ctxt, int index) {
                  BirthplanQuestion question = itm.questions.elementAt(index);
                  return RadioListTile<int>(
                    dense: true,
                    key: ValueKey<int>(question.id),
                    title: Text(
                      question.question,
                      style: TextStyle(
                          color: appPurpleColor,
                          fontWeight: FontWeight.w500,
                          fontSize: fontSize22),
                    ),
                    value: question.id,
                    groupValue: selectedIndex,
                    activeColor: appPurpleColor,
                    onChanged: (int value) {
                      innerSetState(() {
                        selectedIndex = itm.selectedIndex = value;
                      });
                    },
                  );
                });
          }),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(20.0),
            height: 200,
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
            child: TextField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              onChanged: (value) {
                itm.comment = value;
              },
              style: defaultTextFieldTextStyle,
              decoration: new InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintStyle: defaultTextFieldTextStyle,
                  hintText: 'Comment'),
            ),
          ),
        ]);
  }

  Widget buildGredientButton(String text, Function tap, double width,
      List<Color> gredientColor, Color textColor) {
    return Container(
      height: 40.0,
      child: RaisedButton(
        elevation: 5,
        onPressed: tap,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: gredientColor,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.1, 0.6]),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: width, minHeight: 40.0),
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: textColor,
                  fontSize: fontSize22,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.currentContext = context;
    LoaderService.instance.InitiateLoader(context);
    return Scaffold(
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
                  left: -13,
                  top: -13,
                  child: SvgPicture.asset(
                    'assets/images/blob02.svg',
                    height: 100,
                    width: 100,
                    color: appPaleColor,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: -13,
                  right: -10,
                  child: SvgPicture.asset(
                    'assets/images/blob03.svg',
                    height: 100,
                    width: 100,
                    color: appGreenColor,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 10),
                        width: double.infinity,
                        child: IconButton(
                          icon: Image.asset('assets/images/arrowleft.png'),
                          iconSize: 35,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          padding:
                              EdgeInsets.only(top: 30, left: 30, right: 60),
                          children: <Widget>[
                            Text(
                              "Birthplan",
                              style: TextStyle(
                                  color: appPurpleColor,
                                  fontSize: fontSize28,
                                  fontWeight: FontWeight.w500),
                            ),
                            Observer(builder: (_) {
                              if (model.getBirthplanQuestionFuture == null) {
                                return Center(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  appLightGreenColor)),
                                    ),
                                    SizedBox(height: 10),
                                    Text('Fetching data...',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: fontSizeLarge)),
                                  ],
                                ));
                              } else {
                                switch (
                                    model.getBirthplanQuestionFuture.status) {
                                  case FutureStatus.pending:
                                    return Center(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      appLightGreenColor)),
                                        ),
                                        SizedBox(height: 10),
                                        Text('Fetching data...',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: fontSizeLarge)),
                                      ],
                                    ));
                                  case FutureStatus.rejected:
                                    return Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'Failed to load data...',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: fontSizeExtraLarge),
                                          ),
                                          RaisedButton(
                                            color: appGreenColor,
                                            child: Text('Retry',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        fontSizeExtraLarge)),
                                            onPressed: model
                                                .initialiseGetBirthplanQuestion,
                                          )
                                        ],
                                      ),
                                    );

                                  case FutureStatus.fulfilled:
                                    GetBirthplanQuestionResponse response =
                                        model.getBirthplanQuestionFuture.result;
                                    if (response == null ||
                                        response?.data == null ||
                                        response?.data?.length == 0) {
                                      return Center(
                                        child: Text(
                                          'No birthplan found.',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'WorkSans',
                                              color: appBodyTextBlackColor,
                                              fontSize: fontSize24),
                                        ),
                                      );
                                    } else {
                                      return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount:
                                              getBirthplanQuestionItemCount(),
                                          itemBuilder: (BuildContext ctxt,
                                                  int index) =>
                                              buildMainBirthplanQuestionBody(
                                                  ctxt, index));
                                    }
                                    break;
                                  default:
                                    return Center(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      appLightGreenColor)),
                                        ),
                                        SizedBox(height: 10),
                                        Text('Fetching data...',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: fontSizeLarge)),
                                      ],
                                    ));
                                }
                              }
                            }),
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: buildGredientButton('Save', () async {
                                if (model.validateValueUpdate()) {
                                  await LoaderService.instance
                                      .ShowLoader(message: "Updating");
                                  bool result = await model.tryUpdateValue();
                                  await LoaderService.instance.HideLoader();
                                  if (result) {
                                    showAlert(
                                        'Sucess',
                                        'birthplan updated sucessfully',
                                        _scaffoldKey.currentContext);
                                    //AppLocator.measurement_tab_store
                                    //.initialiseGetLatestMeasurements();
                                  } else {
                                    if (model.alertMessage.isNotEmpty) {
                                      showAlert('Error', model.alertMessage,
                                          _scaffoldKey.currentContext);
                                    }
                                  }
                                }
                              },
                                  200,
                                  [appBlueColor.withOpacity(0.7), appBlueColor],
                                  Colors.white),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
