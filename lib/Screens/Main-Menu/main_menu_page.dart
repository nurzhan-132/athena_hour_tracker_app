import 'package:athena_hour_tracker_app/Screens/Calendar/calendar.dart';
import 'package:athena_hour_tracker_app/Screens/Main-Menu/Components/main_menu_body_widget.dart';
import 'package:athena_hour_tracker_app/Screens/Main-Menu/QR/qr.dart';
import 'package:athena_hour_tracker_app/Screens/Profile/profile.dart';
import 'package:athena_hour_tracker_app/bottom_nav_bar_widget.dart';
import 'package:athena_hour_tracker_app/constants.dart';
import 'package:flutter/material.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({ Key? key }) : super(key: key);

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  List<IconData> navigationIcons = [
    Icons.home,
    Icons.calendar_month,
    Icons.person,
  ];

  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  int currIndexOfNav = 0;

  @override
  Widget build(BuildContext context) {    
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[currIndexOfNav].currentState!.maybePop();

        print(
            'isFirstRouteInCurrentTab: ' + isFirstRouteInCurrentTab.toString());

        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            _buildOffstageNavigator(0),
            _buildOffstageNavigator(1),
            _buildOffstageNavigator(2),
          ],
        ),
        bottomNavigationBar: Container(
          height: 70,
          margin: const EdgeInsets.only(left: 12, right: 12, bottom: 24,),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/main_bottom.png"),
              fit: BoxFit.fill,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(2, 2),
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for(int i = 0; i < navigationIcons.length; i++)...<Expanded> {
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currIndexOfNav = i;
                        });
                      },
                      child: Center(
                        child: Icon(
                          navigationIcons[i],
                          color: i == currIndexOfNav ? kPrimaryColor: Colors.black26,
                          size: i == currIndexOfNav ? 30 : 26,
                        ),
                      ),
                    ),
                  ),
                }
              ],
            ),
          ),
        ),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          MainMenuBodyWidget(),
          Calendar(),
          Profile(),
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: currIndexOfNav != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context),
          );
        },
      ),
    );
  }
}

/*
* import 'package:athena_hour_tracker_app/Screens/Calendar/calendar.dart';
import 'package:athena_hour_tracker_app/Screens/Main-Menu/Components/main_menu_body_widget.dart';
import 'package:athena_hour_tracker_app/Screens/Main-Menu/QR/qr.dart';
import 'package:athena_hour_tracker_app/Screens/Profile/profile.dart';
import 'package:athena_hour_tracker_app/bottom_nav_bar_widget.dart';
import 'package:athena_hour_tracker_app/constants.dart';
import 'package:flutter/material.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({ Key? key }) : super(key: key);

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  List<IconData> navigationIcons = [
    Icons.home,
    Icons.calendar_month,
    Icons.person,
  ];

  int currIndexOfNav = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: currIndexOfNav,
        children: const [
          MainMenuBodyWidget(),
          Calendar(),
          Profile(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        margin: const EdgeInsets.only(left: 12, right: 12, bottom: 24,),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/main_bottom.png"),
            fit: BoxFit.fill,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(2, 2),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for(int i = 0; i < navigationIcons.length; i++)...<Expanded> {
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        currIndexOfNav = i;
                      });
                    },
                    child: Center(
                      child: Icon(
                        navigationIcons[i],
                        color: i == currIndexOfNav ? kPrimaryColor: Colors.black26,
                        size: i == currIndexOfNav ? 30 : 26,
                      ),
                    ),
                  ),
                ),
              }
            ],
          ),
        ),
      ),
    );
  }
}
* */