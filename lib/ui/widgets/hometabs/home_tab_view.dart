import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_progress/gradient_progress.dart';
import 'package:lincus_maternity/models/wellbeing/response/get_wellbeing_score_response.dart';
import 'package:lincus_maternity/stores/home/home_tab_store.dart';
import 'package:lincus_maternity/stores/locator.dart';
import 'package:lincus_maternity/ui/themes/styles.dart';
import 'package:mobx/mobx.dart';

class HomeTabView extends StatefulWidget {
  @override
  _HomeTabViewState createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  bool _wellBeingVisible = true;
  HomeTabStore model = AppLocator.home_tab_store;
  @override
  Widget build(BuildContext context) {
    Widget buildMoreButton() {
      return Container(
        height: 40.0,
        child: RaisedButton(
          onPressed: () {
            setState(() {
              _wellBeingVisible = false;
            });
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
              constraints: BoxConstraints(maxWidth: 150.0, minHeight: 40.0),
              alignment: Alignment.center,
              child: Text(
                "More",
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

    Widget buildCreateBirthPlanButton() {
      return Container(
        height: 40.0,
        child: RaisedButton(
          onPressed: () {
            setState(() {
              _wellBeingVisible = true;
            });
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
                "Create a birthplan",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize22,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ),
      );
    }

    Widget buildUpdateButton() {
      return Container(
        height: 40.0,
        child: RaisedButton(
          elevation: 5,
          onPressed: () async {
            FocusScope.of(context).unfocus();
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
          padding: EdgeInsets.all(0.0),
          child: Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [appGreenColor, appLightGreenColor],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.1, 0.6]),
                borderRadius: BorderRadius.circular(30.0)),
            child: Container(
              constraints: BoxConstraints(maxWidth: 120.0, minHeight: 40.0),
              alignment: Alignment.center,
              child: Text(
                "Update",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: appBodyTextBlackColor,
                    fontSize: fontSize22,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ),
      );
    }

    Widget buildWellbeingView() {
      return Column(
        key: UniqueKey(),
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            'Wellbeing',
            style: TextStyle(
                fontFamily: 'WorkSans',
                color: Colors.white,
                fontSize: fontSize24),
          ),
          SizedBox(
            height: 20,
          ),
          Observer(builder: (_) {
            if (model.getWellbeingScoreFuture == null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(appLightGreenColor)),
                  ),
                  SizedBox(height: 10),
                  Text('Fetching data...',
                      style: TextStyle(
                          color: Colors.white, fontSize: fontSizeLarge)),
                ],
              );
            } else {
              switch (model.getWellbeingScoreFuture.status) {
                case FutureStatus.pending:
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                appLightGreenColor)),
                      ),
                      SizedBox(height: 10),
                      Text('Fetching data...',
                          style: TextStyle(
                              color: Colors.white, fontSize: fontSizeLarge)),
                    ],
                  );
                case FutureStatus.rejected:
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Failed to load data.',
                        style: TextStyle(
                            color: Colors.red, fontSize: fontSizeExtraLarge),
                      ),
                      RaisedButton(
                        color: appGreenColor,
                        child: Text('Retry',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: fontSizeExtraLarge)),
                        onPressed: model.initialiseWellbeingScore,
                      )
                    ],
                  );

                case FutureStatus.fulfilled:
                  GetWellbeingScoreResponse response =
                      model.getWellbeingScoreFuture.result;
                  if (response == null || response.data == null) {
                    return Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'No wellbeing data available',
                        style: TextStyle(
                            fontFamily: 'WorkSans',
                            color: Colors.white,
                            fontSize: fontSize24),
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: 200,
                      width: 200,
                      child: Container(
                          child: Stack(
                        children: <Widget>[
                          Center(
                            child: GradientCircularProgressIndicator(
                                gradientColors: [
                                  appGreenColor,
                                  appLightGreenColor,
                                  appGreenColor,
                                  appLightGreenColor
                                ],
                                radius: 100,
                                strokeWidth: 7,
                                strokeRound: true,
                                backgroundColor: Colors.grey,
                                value: model.wellbeingProgress),
                          ),
                          Center(
                            child: GradientCircularProgressIndicator(
                                gradientColors: [
                                  appGreenColor,
                                  appLightGreenColor,
                                  appGreenColor,
                                  appLightGreenColor
                                ],
                                radius: 80,
                                strokeWidth: 7,
                                strokeRound: true,
                                backgroundColor: Colors.grey,
                                value: model.wellbeingProgress),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  model.wellbeingScore,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w900),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Last updated',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: fontSizeLarge,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  model.lastUpdateDateWellbeingScore,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: fontSizeLarge,
                                      fontWeight: FontWeight.normal),
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                    );
                  }
                  break;
                default:
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                appLightGreenColor)),
                      ),
                      SizedBox(height: 10),
                      Text('Fetching data...',
                          style: TextStyle(
                              color: Colors.white, fontSize: fontSizeLarge)),
                    ],
                  );
              }
            }
          }),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: Container(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 300,
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 3.0,
                            spreadRadius: 2),
                      ]),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/Avacado.png',
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Week 16',
                            style: TextStyle(
                                color: appPurpleColor,
                                fontWeight: FontWeight.bold,
                                fontSize: fontSize24),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Your baby is about the size of',
                            maxLines: 1,
                            style: TextStyle(
                                color: appBodyTextBlackColor,
                                fontWeight: FontWeight.w400,
                                fontSize: fontSizeLarge),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          buildMoreButton(),
                        ],
                      ),
                    ),
                  )),
            ),
          ))
        ],
      );
    }

    Widget buildWellbeingDetailedView() {
      return Column(
        key: UniqueKey(),
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 3.0,
                          spreadRadius: 2),
                    ]),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment(0.8, 0.5),
                        child: IconButton(
                          iconSize: 40.0,
                          icon: Icon(
                            Icons.close_outlined,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _wellBeingVisible = true;
                            });
                          },
                        ),
                      ),
                      Image.asset(
                        'assets/images/Avacado.png',
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Week 16',
                        style: TextStyle(
                            color: appPurpleColor,
                            fontWeight: FontWeight.bold,
                            fontSize: fontSize24),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: Text(
                          'Your baby is about the size of avocado it weigh aproximately 140 grams and is 13cm in length',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: appBodyTextBlackColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'WorkSans',
                              fontSize: fontSizeLarge),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('assets/images/datepurple.png',
                              fit: BoxFit.contain, height: 25, width: 25),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: RichText(
                                text: TextSpan(
                                    text: 'Due date: ',
                                    style: TextStyle(
                                      color: appPurpleColor,
                                      fontSize: fontSizeLarge,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: '01 October',
                                      style: TextStyle(
                                          color: appBodyTextBlackColor,
                                          fontSize: fontSizeLarge,
                                          fontWeight: FontWeight.normal))
                                ])),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('assets/images/watch.png',
                              fit: BoxFit.contain, height: 25, width: 25),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: RichText(
                                text: TextSpan(
                                    text: 'Trimster: ',
                                    style: TextStyle(
                                      color: appPurpleColor,
                                      fontSize: fontSizeLarge,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: '2',
                                      style: TextStyle(
                                          color: appBodyTextBlackColor,
                                          fontSize: fontSizeLarge,
                                          fontWeight: FontWeight.normal))
                                ])),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('assets/images/gender.png',
                              fit: BoxFit.contain, height: 25, width: 25),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: RichText(
                                text: TextSpan(
                                    text: 'Gender: ',
                                    style: TextStyle(
                                      color: appPurpleColor,
                                      fontSize: fontSizeLarge,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: 'N/A',
                                      style: TextStyle(
                                          color: appBodyTextBlackColor,
                                          fontSize: fontSizeLarge,
                                          fontWeight: FontWeight.normal))
                                ])),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      buildUpdateButton(),
                      SizedBox(
                        height: 20,
                      ),
                      buildCreateBirthPlanButton(),
                    ],
                  ),
                )),
          )
        ],
      );
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: appBlueColor,
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
            padding: EdgeInsets.only(top: 60),
            child: Column(
              children: <Widget>[
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
                        child: Text(
                          'Week 16',
                          style: TextStyle(
                              color: appPurpleColor,
                              fontWeight: FontWeight.bold,
                              fontSize: fontSize24),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: _wellBeingVisible
                        ? buildWellbeingView()
                        : buildWellbeingDetailedView(),
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
