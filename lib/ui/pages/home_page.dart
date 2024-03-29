import 'package:flutter/material.dart';
import 'package:lincus_maternity/services/loader_service.dart';
import 'package:lincus_maternity/stores/home/home_tab_store.dart';
import 'package:lincus_maternity/stores/locator.dart';
import 'package:lincus_maternity/ui/pages/base_page.dart';
import 'package:lincus_maternity/ui/themes/styles.dart';
import 'package:lincus_maternity/ui/widgets/hometabs/home_tab_view.dart';
import 'package:lincus_maternity/ui/widgets/measurementtabs/measurement_tab_view.dart';
import 'package:lincus_maternity/ui/widgets/surveytabs/survey_tab_view.dart';
import 'package:mobx/mobx.dart';

class HomePage extends BasePage {
  final String title;

  HomePage({this.title});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage> {
  HomeTabStore model = AppLocator.home_tab_store;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    model.initialiseWellbeingScore();
    model.initialisePregnancyDetails();
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
  }

  Widget _createBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [appGreenColor, appLightGreenColor.withOpacity(0.9)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.1, 0.6],
          tileMode: TileMode.clamp,
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            if (_selectedIndex != index) {
              _selectedIndex = index;
              if (index == 1) {
                if (!AppLocator.measurement_tab_store.isInitialised) {
                  AppLocator.measurement_tab_store
                      .initialiseGetLatestMeasurements();
                }
              } else if (index == 2) {
                if (!AppLocator.survey_tab_store.isInitialised) {
                  AppLocator.survey_tab_store.initialiseGetAvailableSurvey();
                }
              }
            }
          });
        },
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        elevation: 1,
        items: [
          BottomNavigationBarItem(
              activeIcon: Image.asset(
                'assets/images/homepurple.png',
                height: 30,
                width: 30,
                fit: BoxFit.contain,
              ),
              icon: Image.asset(
                'assets/images/home.png',
                height: 30,
                width: 30,
                fit: BoxFit.contain,
              ),
              title: Container(height: 0.0)),
          BottomNavigationBarItem(
              activeIcon: Image.asset(
                'assets/images/userpurple.png',
                height: 30,
                width: 30,
                fit: BoxFit.contain,
              ),
              icon: Image.asset(
                'assets/images/user.png',
                height: 30,
                width: 30,
                fit: BoxFit.contain,
              ),
              title: Container(height: 0.0)),
          BottomNavigationBarItem(
              activeIcon: Image.asset(
                'assets/images/surveypurple.png',
                height: 30,
                width: 30,
                fit: BoxFit.contain,
              ),
              icon: Image.asset(
                'assets/images/survey.png',
                height: 30,
                width: 30,
                fit: BoxFit.contain,
              ),
              title: Container(height: 0.0)),
          BottomNavigationBarItem(
              activeIcon: Image.asset(
                'assets/images/datepurple.png',
                height: 30,
                width: 30,
                fit: BoxFit.contain,
              ),
              icon: Image.asset(
                'assets/images/date.png',
                height: 30,
                width: 30,
                fit: BoxFit.contain,
              ),
              title: Container(height: 0.0)),
        ],
      ),
    );
  }

  void openCloseDrawer(bool param) {
    if (param) {
      _scaffoldKey.currentState.openEndDrawer();
    } else {
      if (_scaffoldKey.currentState.isDrawerOpen) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.currentContext = context;
    LoaderService.instance.InitiateLoader(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        bottomNavigationBar: _createBottomNavigationBar(),
        endDrawer: Drawer(
            child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [appLightGreenColor, appGreenColor],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.1, 0.6],
              tileMode: TileMode.clamp,
            ),
          ),
          padding: EdgeInsets.only(top: 100),
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                leading: Image.asset(
                  'assets/images/user.png',
                  height: 35,
                  width: 35,
                  fit: BoxFit.contain,
                ),
                title: Text(
                  "Profile",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: fontSize24,
                      fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Image.asset(
                  'assets/images/logout.png',
                  height: 35,
                  width: 35,
                  fit: BoxFit.contain,
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: fontSize24,
                      fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        )),
        endDrawerEnableOpenDragGesture: true,
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: IndexedStack(
              index: _selectedIndex,
              children: <Widget>[
                HomeTabView(
                  openCloseDrawer: openCloseDrawer,
                ),
                MeasurementTabView(openCloseDrawer: openCloseDrawer),
                SurveyTabView(openCloseDrawer: openCloseDrawer),
                Container(
                  color: Colors.yellow,
                )
              ],
            )));
  }
}
