import 'package:flutter/material.dart';
import 'package:flutter_application_2/calendar_screen.dart';
import 'package:flutter_application_2/login_screen.dart';
import 'package:flutter_application_2/signup_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final bool loggedIn = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        initialRoute: (loggedIn) ? '/mainapp' : '/signup',
        routes: {
          '/login': (context) => LoginScreen(),
          '/signup': (context) => SignUpScreen(),
          '/mainapp': (context) => HomeScreen(),
        });
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> screens = [
    CalendarScreen(),
    Text("Schedule"),
    Text("Notes"),
  ];

  List<PersistentBottomNavBarItem> items = [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.calendar_today),
      title: ("Calendar"),
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.schedule),
      title: ("Schedule"),
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.notes),
      title: ("Notes"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: screens,
      items: items,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}
