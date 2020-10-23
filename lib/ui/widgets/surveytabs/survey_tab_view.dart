import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lincus_maternity/models/app_constants.dart';
import 'package:lincus_maternity/models/survey/response/get_available_survey_response.dart';
import 'package:lincus_maternity/models/survey/survey_model.dart';
import 'package:lincus_maternity/stores/home/survey_tab_store.dart';
import 'package:lincus_maternity/stores/locator.dart';
import 'package:lincus_maternity/ui/pages/survey/take_survey_page.dart';
import 'package:lincus_maternity/ui/themes/styles.dart';
import 'package:mobx/mobx.dart';

class SurveyTabView extends StatefulWidget {
  final Function(bool) openCloseDrawer;
  SurveyTabView({@required this.openCloseDrawer});
  @override
  _SurveyTabViewState createState() => _SurveyTabViewState();
}

class _SurveyTabViewState extends State<SurveyTabView> {
  SurveyTabStore model = AppLocator.survey_tab_store;

  int getSurveysItemCount() {
    int count = 0;
    if (model?.availableSurveyList?.length > 0 ?? false)
      count = model?.availableSurveyList?.length;
    return count;
  }

  Widget buildSurveyItem(BuildContext cntxt, int index) {
    SurveyModel itm = model.availableSurveyList.elementAt(index);
    String imageUrl =
        AppConstants.surveyIcon.replaceFirst('{icon_name}', itm.icon);
    return Material(
      color: Colors.white.withOpacity(0.0),
      child: InkWell(
        splashColor: Colors.grey,
        onTap: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TakeSurveyPage(
                      title: 'AddMeasurementPage',
                      surveyModel: itm,
                    )),
          );
        },
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10),
              Container(
                width: 200,
                height: 200,
                child: Card(
                  color: Colors.white,
                  elevation: 3,
                  shadowColor: Colors.grey,
                  child: Center(
                    child: SvgPicture.network(
                      imageUrl,
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                      placeholderBuilder: (BuildContext context) => Image.asset(
                        'assets/images/image8.png',
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Text(
                  '${itm.name}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: appBodyTextBlackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: fontSize22),
                ),
              ),
            ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: -10,
            top: -10,
            child: SvgPicture.asset(
              'assets/images/blob02.svg',
              height: 120,
              width: 130,
              color: appPaleColor,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: -10,
            right: -10,
            child: SvgPicture.asset(
              'assets/images/blob03.svg',
              height: 120,
              width: 130,
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
                  child: Container(
                      padding: EdgeInsets.only(top: 100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'My Surveys',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: fontSize28,
                                fontWeight: FontWeight.w500),
                          ),
                          Observer(builder: (_) {
                            if (model.getAvailableSurveyFuture == null) {
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
                              switch (model.getAvailableSurveyFuture.status) {
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
                                              .initialiseGetAvailableSurvey,
                                        )
                                      ],
                                    ),
                                  );

                                case FutureStatus.fulfilled:
                                  GetAvailableSurveyResponse response =
                                      model.getAvailableSurveyFuture.result;
                                  if (response == null ||
                                      response?.data == null ||
                                      response?.data?.length == 0) {
                                    return Center(
                                      child: Text(
                                        'No surveys available.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'WorkSans',
                                            color: appBodyTextBlackColor,
                                            fontSize: fontSize24),
                                      ),
                                    );
                                  } else {
                                    return Expanded(
                                      child: GridView.builder(
                                        itemCount: getSurveysItemCount(),
                                        scrollDirection: Axis.horizontal,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 10.0,
                                        ),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return buildSurveyItem(
                                              context, index);
                                        },
                                      ),
                                    );
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
                        ],
                      ),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/images/green_servey_bg.png'),
                        fit: BoxFit.fill,
                      ))),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
