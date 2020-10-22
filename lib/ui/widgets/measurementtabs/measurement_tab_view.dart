import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lincus_maternity/models/app_constants.dart';
import 'package:lincus_maternity/models/measurement/measurement_model.dart';
import 'package:lincus_maternity/models/measurement/response/get_latest_measurement_response.dart';
import 'package:lincus_maternity/stores/home/measurement_tab_store.dart';
import 'package:lincus_maternity/stores/locator.dart';
import 'package:lincus_maternity/ui/pages/measurement/add_measurement_page.dart';
import 'package:lincus_maternity/ui/pages/measurement/update_measurement_page.dart';
import 'package:lincus_maternity/ui/themes/styles.dart';
import 'package:mobx/mobx.dart';

class MeasurementTabView extends StatefulWidget {
  final Function(bool) openCloseDrawer;
  MeasurementTabView({@required this.openCloseDrawer});
  @override
  _MeasurementTabViewState createState() => _MeasurementTabViewState();
}

class _MeasurementTabViewState extends State<MeasurementTabView> {
  MeasurementTabStore model = AppLocator.measurement_tab_store;
  @override
  Widget build(BuildContext context) {
    Widget addMeasurementButton() {
      return Container(
        height: 40.0,
        child: RaisedButton(
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AddMeasurementPage(title: 'AddMeasurementPage')),
            );
          },
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
          padding: EdgeInsets.all(0.0),
          child: Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [appBlueColor, appPinkColor],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.1, 0.6]),
                borderRadius: BorderRadius.circular(30.0)),
            child: Container(
              constraints: BoxConstraints(maxWidth: 250.0, minHeight: 40.0),
              alignment: Alignment.center,
              child: Text(
                "Add measurement",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize22,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      );
    }

    Widget buildLatestMeasurementBody(BuildContext cntxt, int index) {
      MeasurementModel itm = model.latestMeasurementList.elementAt(index);
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
                    '${itm.value} ${itm.units} ${itm.type}',
                    style: TextStyle(
                        color: appBodyTextBlackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: fontSize22),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 40.0,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateMeasurementPage(
                                  title: 'UpdateMeasurementPage',
                                  measurementModel: itm)),
                        );
                      },
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  appBlueColor.withOpacity(0.9),
                                  appBlueColor
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                stops: [0.1, 0.6]),
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 150.0, minHeight: 40.0),
                          alignment: Alignment.center,
                          child: Text(
                            "Update",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: fontSize22,
                                fontWeight: FontWeight.w600),
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
      ]);
    }

    Widget buildGoalsListBody(BuildContext cntxt, int index) {
      MeasurementModel itm = model.goalsList.elementAt(index);
      String imageUrl =
          AppConstants.measurementIcon.replaceFirst('{icon_name}', itm.icon);
      return ListTile(
        leading: SizedBox(
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
        title: Text(
          '${itm.value} ${itm.units} ${itm.type}',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: fontSize22),
        ),
      );
    }

    int getItemMeasurementItemCount() {
      int count = 0;
      if (model?.latestMeasurementList?.length > 0 ?? false)
        count = model?.latestMeasurementList?.length;
      return count;
    }

    int getGoalsItemCount() {
      int count = 0;
      if (model?.goalsList?.length > 0 ?? false)
        count = model?.goalsList?.length;
      return count;
    }

    return Container(
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
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20),
                  width: double.infinity,
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    iconSize: 35,
                    color: Colors.white,
                    onPressed: () {
                      widget.openCloseDrawer(true);
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
                            offset: Offset(0.0, 1.0), //(x,y)
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
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.zero,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                "Measurement",
                                style: TextStyle(
                                    color: appBodyTextBlackColor,
                                    fontSize: fontSize28,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                "Last reading",
                                style: TextStyle(
                                    color: appSkyShadeColor3,
                                    fontSize: fontSizeExtraLarge,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Observer(builder: (_) {
                              if (model.getLatestMeasurementFuture == null) {
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
                                    model.getLatestMeasurementFuture.status) {
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
                                                .initialiseGetLatestMeasurements,
                                          )
                                        ],
                                      ),
                                    );

                                  case FutureStatus.fulfilled:
                                    GetLatestMeasurementResponse response =
                                        model.getLatestMeasurementFuture.result;
                                    if (response == null ||
                                        response?.data == null ||
                                        response?.data?.length == 0) {
                                      return Center(
                                        child: Text(
                                          'No measurement submitted yet.',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'WorkSans',
                                              color: appBodyTextBlackColor,
                                              fontSize: fontSize24),
                                        ),
                                      );
                                    } else {
                                      return ListView.builder(
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount:
                                              getItemMeasurementItemCount(),
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
                            Center(
                              child: addMeasurementButton(),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Stack(
                              children: <Widget>[
                                Image.asset('assets/images/greenbg.png'),
                                Padding(
                                  padding: const EdgeInsets.only(top: 100.0),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 30,
                                        ),
                                        child: Text(
                                          "Goals",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: fontSize28,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Observer(builder: (_) {
                                        if (model.getLatestMeasurementFuture ==
                                            null) {
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
                                                        AlwaysStoppedAnimation<
                                                                Color>(
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
                                          switch (model
                                              .getLatestMeasurementFuture
                                              .status) {
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
                                                            AlwaysStoppedAnimation<
                                                                    Color>(
                                                                appLightGreenColor)),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text('Fetching data...',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize:
                                                              fontSizeLarge)),
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
                                                          fontSize:
                                                              fontSizeExtraLarge),
                                                    ),
                                                    RaisedButton(
                                                      color: appGreenColor,
                                                      child: Text('Retry',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize:
                                                                  fontSizeExtraLarge)),
                                                      onPressed: model
                                                          .initialiseGetLatestMeasurements,
                                                    )
                                                  ],
                                                ),
                                              );

                                            case FutureStatus.fulfilled:
                                              GetLatestMeasurementResponse
                                                  response = model
                                                      .getLatestMeasurementFuture
                                                      .result;
                                              if (response == null ||
                                                  response?.data == null ||
                                                  response?.data?.length == 0 ||
                                                  model.goalsList.length == 0) {
                                                return Center(
                                                  child: Text(
                                                    'No goals added yet.',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontFamily: 'WorkSans',
                                                        color:
                                                            appBodyTextBlackColor,
                                                        fontSize: fontSize24),
                                                  ),
                                                );
                                              } else {
                                                return ListView.builder(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 30),
                                                    shrinkWrap: true,
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    itemCount:
                                                        getGoalsItemCount(),
                                                    itemBuilder:
                                                        (BuildContext ctxt,
                                                                int index) =>
                                                            buildGoalsListBody(
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
                                                            AlwaysStoppedAnimation<
                                                                    Color>(
                                                                appLightGreenColor)),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text('Fetching data...',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize:
                                                              fontSizeLarge)),
                                                ],
                                              ));
                                          }
                                        }
                                      })
                                    ],
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
