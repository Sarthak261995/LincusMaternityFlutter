import 'package:flutter/material.dart';
import 'package:lincus_maternity/services/loader_service.dart';
import 'package:lincus_maternity/stores/home/home_tab_store.dart';
import 'package:lincus_maternity/stores/locator.dart';
import 'package:lincus_maternity/ui/pages/base_page.dart';
import 'package:lincus_maternity/ui/themes/styles.dart';
import 'package:lincus_maternity/ui/widgets/hometabs/home_tab_view.dart';
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
            if (_selectedIndex != index) _selectedIndex = index;
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

  @override
  Widget build(BuildContext context) {
    super.currentContext = context;
    LoaderService.instance.InitiateLoader(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        bottomNavigationBar: _createBottomNavigationBar(),
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: IndexedStack(
              index: _selectedIndex,
              children: <Widget>[
                HomeTabView(),
                Container(
                  alignment: Alignment.bottomLeft,
                  color: Colors.blue,
                  height: 300.0,
                  width: 300.0,
                ),
                Container(
                  color: Colors.pink,
                  height: 150.0,
                  width: 150.0,
                ),
                Container(
                  color: Colors.yellow,
                  height: 150.0,
                  width: 150.0,
                )
              ],
            )));
  }
}
