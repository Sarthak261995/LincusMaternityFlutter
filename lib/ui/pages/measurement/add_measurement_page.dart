import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lincus_maternity/models/app_constants.dart';
import 'package:lincus_maternity/models/measurement/measurement_option_model.dart';
import 'package:lincus_maternity/models/measurement/response/get_measurement_option_response.dart';
import 'package:lincus_maternity/services/loader_service.dart';
import 'package:lincus_maternity/stores/locator.dart';
import 'package:lincus_maternity/stores/measurement/add_measurement_store.dart';
import 'package:lincus_maternity/ui/themes/styles.dart';
import 'package:mobx/mobx.dart';
import '../base_page.dart';

class AddMeasurementPage extends BasePage {
  final String title;
  AddMeasurementPage({this.title});

  @override
  _AddMeasurementPageState createState() => _AddMeasurementPageState();
}

class _AddMeasurementPageState extends BasePageState<AddMeasurementPage> {
  AddMeasurementStore model = AppLocator.add_measurement_store;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    model.clear_data();
    model.initialiseGetMeasurementOption();
    addReactions();
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

  int getMeasurementOptionItemCount() {
    int count = 0;
    if (model?.measurementOptionList?.length > 0 ?? false)
      count = model?.measurementOptionList?.length;
    return count;
  }

  Widget buildLatestMeasurementBody(BuildContext cntxt, int index) {
    MeasurementOptionModel itm = model.measurementOptionList.elementAt(index);
    String imageUrl =
        AppConstants.measurementIcon.replaceFirst('{icon_name}', itm.icon);
    return Column(children: <Widget>[
      SizedBox(height: 40),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 50,
            width: 50,
            child: Card(
              elevation: 3,
              shadowColor: Colors.grey,
              child: Center(
                child: SvgPicture.network(
                  imageUrl,
                  height: 30,
                  width: 30,
                  color: appBlueColor,
                  fit: BoxFit.cover,
                  placeholderBuilder: (BuildContext context) => Image.asset(
                    'assets/images/image8.png',
                    height: 30,
                    width: 30,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${itm.name}',
                  style: TextStyle(
                      color: appBodyTextBlackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: fontSize22),
                ),
                SizedBox(
                  height: 1,
                ),
                TextField(
                  style: defaultTextFieldTextStyle,
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(border: defaultTextFieldUnderlineBorder),
                  onChanged: (value) {
                    itm.value = value;
                  },
                ),
              ],
            ),
          )
        ],
      ),
    ]);
  }

  void addReactions() {}

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
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(left: 60),
                        alignment: Alignment.centerRight,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                topLeft: Radius.circular(30)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  offset: Offset(0.0, 1.0),
                                  blurRadius: 3.0,
                                  spreadRadius: 2),
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Observer(
                                  builder: (context) => Text(
                                    model.userName,
                                    style: TextStyle(
                                        color: appBodyTextBlackColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: fontSizeLarge),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Observer(
                                builder: (context) => Text(
                                  model.weekNumber,
                                  style: TextStyle(
                                      color: appPurpleColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: fontSize24),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          padding:
                              EdgeInsets.only(top: 30, left: 30, right: 60),
                          children: <Widget>[
                            Text(
                              "Record Measurement",
                              style: TextStyle(
                                  color: appBodyTextBlackColor,
                                  fontSize: fontSize28,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Fill in any measurement you whish to record",
                              style: TextStyle(
                                  color: appSkyShadeColor3,
                                  fontSize: fontSizeExtraLarge,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Observer(builder: (_) {
                              if (model.getMeasurementOptionFuture == null) {
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
                                    model.getMeasurementOptionFuture.status) {
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
                                                .initialiseGetMeasurementOption,
                                          )
                                        ],
                                      ),
                                    );

                                  case FutureStatus.fulfilled:
                                    GetMeasurementOptionResponse response =
                                        model.getMeasurementOptionFuture.result;
                                    if (response == null ||
                                        response?.data == null ||
                                        response?.data?.length == 0) {
                                      return Center(
                                        child: Text(
                                          'No measurement options found.',
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
                                              getMeasurementOptionItemCount(),
                                          itemBuilder:
                                              (BuildContext ctxt, int index) =>
                                                  buildLatestMeasurementBody(
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
                              height: 40,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(20.0),
                              height: 250,
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
                                  model.note = value;
                                },
                                style: defaultTextFieldTextStyle,
                                decoration: new InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintStyle: defaultTextFieldTextStyle,
                                    hintText: 'Notes'),
                              ),
                            ),
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
                                        'Measurement updated sucessfully',
                                        _scaffoldKey.currentContext);
                                    AppLocator.measurement_tab_store
                                        .initialiseGetLatestMeasurements();
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
