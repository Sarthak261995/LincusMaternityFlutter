import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lincus_maternity/controls/gradient-progress.dart';
import 'package:lincus_maternity/models/app_constants.dart';
import 'package:lincus_maternity/models/pregnancy/response/get_pregnancy_detail_response.dart';
import 'package:lincus_maternity/models/wellbeing/response/get_wellbeing_score_response.dart';
import 'package:lincus_maternity/stores/home/home_tab_store.dart';
import 'package:lincus_maternity/stores/locator.dart';
import 'package:lincus_maternity/ui/themes/styles.dart';
import 'package:mobx/mobx.dart';

class HomeTabView extends StatefulWidget {
  final Function(bool) openCloseDrawer;
  HomeTabView({@required this.openCloseDrawer});
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
                  child: Observer(builder: (_) {
                    if (model.getPregnancyDetailResponseFuture == null) {
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
                                  color: Colors.black,
                                  fontSize: fontSizeLarge)),
                        ],
                      );
                    } else {
                      switch (model.getPregnancyDetailResponseFuture.status) {
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
                                      color: Colors.black,
                                      fontSize: fontSizeLarge)),
                            ],
                          );
                        case FutureStatus.rejected:
                          return Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                          fontSize: fontSizeExtraLarge)),
                                  onPressed: model.initialisePregnancyDetails,
                                )
                              ],
                            ),
                          );

                        case FutureStatus.fulfilled:
                          GetPregnancyDetailResponse response =
                              model.getPregnancyDetailResponseFuture.result;
                          if (response == null ||
                              response?.data == null ||
                              response?.data?.additionalInfo == null ||
                              response?.data?.additionalInfo?.weekDevelopment ==
                                  null) {
                            return Center(
                              child: Text(
                                'No pregnancy data available',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'WorkSans',
                                    color: Colors.black,
                                    fontSize: fontSize24),
                              ),
                            );
                          } else {
                            return SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: <Widget>[
                                  Observer(
                                    builder: (context) {
                                      if (response?.data?.additionalInfo
                                                  ?.weekDevelopment !=
                                              null ??
                                          false) {
                                        String imageUrl = AppConstants
                                            .weekDevelopmentIcon
                                            .replaceFirst(
                                                '{icon_name}',
                                                response
                                                        ?.data
                                                        ?.additionalInfo
                                                        ?.weekDevelopment
                                                        ?.sizeImage ??
                                                    '');
                                        return SvgPicture.network(
                                          imageUrl,
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.cover,
                                          placeholderBuilder:
                                              (BuildContext context) =>
                                                  Image.asset(
                                            'assets/images/Avacado.png',
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.contain,
                                          ),
                                        );
                                      }
                                      return SizedBox.shrink();
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    model.weekNumber,
                                    style: TextStyle(
                                        color: appPurpleColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: fontSize24),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    model.sizeText,
                                    textAlign: TextAlign.center,
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
                                      color: Colors.black,
                                      fontSize: fontSizeLarge)),
                            ],
                          );
                      }
                    }
                  }),
                ),
              ),
            ),
          )
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
                      Observer(
                        builder: (context) {
                          if (model?.getPregnancyDetailResult?.additionalInfo
                                      ?.weekDevelopment !=
                                  null ??
                              false) {
                            String imageUrl = AppConstants.weekDevelopmentIcon
                                .replaceFirst(
                                    '{icon_name}',
                                    model
                                            ?.getPregnancyDetailResult
                                            ?.additionalInfo
                                            ?.weekDevelopment
                                            ?.sizeImage ??
                                        '');
                            return SvgPicture.network(
                              imageUrl,
                              height: 100,
                              width: 100,
                              fit: BoxFit.contain,
                              placeholderBuilder: (BuildContext context) =>
                                  Image.asset(
                                'assets/images/Avacado.png',
                                height: 100,
                                width: 100,
                                fit: BoxFit.contain,
                              ),
                            );
                          }
                          return SizedBox.shrink();
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Observer(
                          builder: (_) => Text(
                                model.weekNumber,
                                style: TextStyle(
                                    color: appPurpleColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: fontSize24),
                              )),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: Observer(
                          builder: (context) => Text(
                            model.sizeText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: appBodyTextBlackColor,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'WorkSans',
                                fontSize: fontSizeLarge),
                          ),
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
                            child: Observer(
                              builder: (context) => RichText(
                                  text: TextSpan(
                                      text: 'Due date: ',
                                      style: TextStyle(
                                        color: appPurpleColor,
                                        fontSize: fontSizeLarge,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      children: <TextSpan>[
                                    TextSpan(
                                        text: model.dueDate,
                                        style: TextStyle(
                                            color: appBodyTextBlackColor,
                                            fontSize: fontSizeLarge,
                                            fontWeight: FontWeight.normal))
                                  ])),
                            ),
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
                            child: Observer(
                              builder: (context) => RichText(
                                  text: TextSpan(
                                      text: 'Trimster: ',
                                      style: TextStyle(
                                        color: appPurpleColor,
                                        fontSize: fontSizeLarge,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      children: <TextSpan>[
                                    TextSpan(
                                        text: model.trimester,
                                        style: TextStyle(
                                            color: appBodyTextBlackColor,
                                            fontSize: fontSizeLarge,
                                            fontWeight: FontWeight.normal))
                                  ])),
                            ),
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
                            child: Observer(
                              builder: (context) => RichText(
                                  text: TextSpan(
                                      text: 'Gender: ',
                                      style: TextStyle(
                                        color: appPurpleColor,
                                        fontSize: fontSizeLarge,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      children: <TextSpan>[
                                    TextSpan(
                                        text: model.gender,
                                        style: TextStyle(
                                            color: appBodyTextBlackColor,
                                            fontSize: fontSizeLarge,
                                            fontWeight: FontWeight.normal))
                                  ])),
                            ),
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
