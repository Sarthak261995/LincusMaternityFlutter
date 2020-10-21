import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lincus_maternity/controls/my_text_field_datepicker.dart';
import 'package:lincus_maternity/controls/my_text_field_timepicker.dart';
import 'package:lincus_maternity/models/app_constants.dart';
import 'package:lincus_maternity/models/measurement/measurement_model.dart';
import 'package:lincus_maternity/services/loader_service.dart';
import 'package:lincus_maternity/stores/locator.dart';
import 'package:lincus_maternity/stores/measurement/update_measurement_store.dart';
import 'package:lincus_maternity/ui/themes/styles.dart';
import 'package:mobx/mobx.dart';
import '../base_page.dart';
import 'package:intl/intl.dart';

class UpdateMeasurementPage extends BasePage {
  final String title;
  final MeasurementModel measurementModel;
  UpdateMeasurementPage({this.title, this.measurementModel}) {
    AppLocator.update_measurement_store.measurementModel = measurementModel;
  }

  @override
  _UpdateMeasurementPageState createState() => _UpdateMeasurementPageState();
}

class _UpdateMeasurementPageState extends BasePageState<UpdateMeasurementPage> {
  UpdateMeasurementStore model = AppLocator.update_measurement_store;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    model.clear_data();
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
                              EdgeInsets.only(top: 30, left: 30, right: 30),
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
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: Card(
                                          elevation: 3,
                                          shadowColor: Colors.grey,
                                          child: Center(
                                            child: SvgPicture.network(
                                              AppConstants.measurementIcon
                                                  .replaceFirst(
                                                      '{icon_name}',
                                                      widget.measurementModel
                                                          .icon),
                                              height: 30,
                                              width: 30,
                                              color: appBlueColor,
                                              fit: BoxFit.cover,
                                              placeholderBuilder:
                                                  (BuildContext context) =>
                                                      Image.asset(
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              '${widget.measurementModel.type}',
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
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                  border:
                                                      defaultTextFieldUnderlineBorder),
                                              onChanged: (value) {
                                                model.value = value;
                                              },
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Container(
                                              height: 40.0,
                                              child: RaisedButton(
                                                onPressed: () async {
                                                  if (model
                                                      .validateValueUpdate()) {
                                                    await LoaderService.instance
                                                        .ShowLoader(
                                                            message:
                                                                "Updating");
                                                    bool result = await model
                                                        .tryUpdateValue();
                                                    await LoaderService.instance
                                                        .HideLoader();
                                                    if (result) {
                                                      showAlert(
                                                          'Sucess',
                                                          'Measurement updated sucessfully',
                                                          _scaffoldKey
                                                              .currentContext);
                                                      AppLocator
                                                          .measurement_tab_store
                                                          .initialiseGetLatestMeasurements();
                                                    }
                                                  }
                                                },
                                                elevation: 5,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            80.0)),
                                                padding: EdgeInsets.all(0.0),
                                                child: Ink(
                                                  decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                          colors: [
                                                            appBlueColor
                                                                .withOpacity(
                                                                    0.9),
                                                            appBlueColor
                                                          ],
                                                          begin: Alignment
                                                              .centerLeft,
                                                          end: Alignment
                                                              .centerRight,
                                                          stops: [0.1, 0.6]),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0)),
                                                  child: Container(
                                                    constraints: BoxConstraints(
                                                        maxWidth: 150.0,
                                                        minHeight: 40.0),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Update",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: fontSize22,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ]),
                            SizedBox(
                              height: 50,
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: Card(
                                          elevation: 3,
                                          shadowColor: Colors.grey,
                                          child: Center(
                                            child: Icon(
                                              Icons.calendar_today_outlined,
                                              size: 30,
                                              color: appBlueColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Date/time',
                                              style: TextStyle(
                                                  color: appBodyTextBlackColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: fontSize22),
                                            ),
                                            SizedBox(
                                              height: 1,
                                            ),
                                            MyTextFieldDatePicker(
                                              labelText: null,
                                              prefixIcon: null,
                                              suffixIcon: null,
                                              dateFormat:
                                                  DateFormat("dd/MM/yyyy"),
                                              lastDate: DateTime.now()
                                                  .add(Duration(days: 366)),
                                              firstDate: DateTime.now(),
                                              initialDate: DateTime.now(),
                                              onDateChanged: (selectedDate) {
                                                model.date = selectedDate;
                                              },
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ]),
                            SizedBox(
                              height: 30,
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: Card(
                                          elevation: 3,
                                          shadowColor: Colors.grey,
                                          child: Center(
                                            child: Icon(
                                              Icons.timer,
                                              size: 30,
                                              color: appBlueColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            MyTextFieldTimePicker(
                                                labelText: null,
                                                prefixIcon: null,
                                                suffixIcon: null,
                                                initialTime: TimeOfDay.now(),
                                                timeFormat:
                                                    TimeOfDayFormat.HH_dot_mm,
                                                onTimeChanged: (selectedTime) {
                                                  model.time = selectedTime;
                                                }),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Container(
                                              height: 40.0,
                                              child: RaisedButton(
                                                onPressed: () async {
                                                  if (model
                                                      .validateValueUpdate()) {
                                                    await LoaderService.instance
                                                        .ShowLoader(
                                                            message:
                                                                "Updating");
                                                    bool result = await model
                                                        .tryUpdateValue();
                                                    await LoaderService.instance
                                                        .HideLoader();
                                                    if (result) {
                                                      showAlert(
                                                          'Sucess',
                                                          'Measurement updated sucessfully',
                                                          _scaffoldKey
                                                              .currentContext);
                                                      AppLocator
                                                          .measurement_tab_store
                                                          .initialiseGetLatestMeasurements();
                                                    }
                                                  }
                                                },
                                                elevation: 5,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            80.0)),
                                                padding: EdgeInsets.all(0.0),
                                                child: Ink(
                                                  decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                          colors: [
                                                            appBlueColor
                                                                .withOpacity(
                                                                    0.9),
                                                            appBlueColor
                                                          ],
                                                          begin: Alignment
                                                              .centerLeft,
                                                          end: Alignment
                                                              .centerRight,
                                                          stops: [0.1, 0.6]),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0)),
                                                  child: Container(
                                                    constraints: BoxConstraints(
                                                        maxWidth: 150.0,
                                                        minHeight: 40.0),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Save",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: fontSize22,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ]),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              alignment: Alignment.center,
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
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
                                  Center(
                                    child: buildGredientButton('Add', () async {
                                      if (model.validateCommentUpdate()) {
                                        await LoaderService.instance
                                            .ShowLoader(message: "Updating");
                                        bool result =
                                            await model.tryUpdateComment();
                                        await LoaderService.instance
                                            .HideLoader();
                                        if (result) {
                                          showAlert(
                                              'Sucess',
                                              'Measurement updated sucessfully',
                                              _scaffoldKey.currentContext);
                                          //AppLocator.measurement_tab_store
                                          //.initialiseGetLatestMeasurements();
                                        }
                                      }
                                    },
                                        200.0,
                                        [appGreenColor, appLightGreenColor],
                                        appBodyTextBlackColor),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 100,
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
