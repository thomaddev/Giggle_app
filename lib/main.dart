import 'package:flutter/material.dart';
import 'package:giggle_app/screens/bar_screen.dart';
import 'package:giggle_app/screens/home.dart';
import 'package:giggle_app/widgets/bases/bottom_navigator.dart';
import 'package:giggle_app/widgets/bases/main_top_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  static const _pages = <Widget>[
    Home(),
    BarScreen(),
    BarScreen(),
    BarScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
          appBar: const MainTopBar(),
          body: Center(
            child: _pages.elementAt(_selectedIndex),
          ),
          bottomNavigationBar:
              BottomNavigator(onChangeScreen: (int c) => _onItemTapped(c), currentIndex: _selectedIndex,)),
    );
  }
}
