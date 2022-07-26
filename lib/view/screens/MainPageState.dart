import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:weather_app/view/screens/HomeScreen.dart';
import 'package:weather_app/view/screens/SearchScreen.dart';
import 'package:weather_app/view/screens/SettingScreen.dart';

class PageState extends StatefulWidget {
  const PageState({Key? key}) : super(key: key);

  @override
  State<PageState> createState() => _PageStateState();
}

class _PageStateState extends State<PageState> {
  int _selectedIndex = 0;
  List pageScreens = [HomeScreen(), SearchScreen(), SettingScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          child: pageScreens[_selectedIndex],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            width: 300,
            child: GNav(
                tabActiveBorder: Border.all(),
                padding: EdgeInsets.all(10),
                duration: Duration(milliseconds: 300),
                tabBorderRadius: 30,
                backgroundColor: Colors.transparent,
                tabs: [
                  GButton(
                    icon: Icons.home,
                    text: 'سەرەکی',
                  ),
                  GButton(
                    icon: Icons.search,
                    text: 'گەڕان',
                  ),
                  GButton(
                    icon: Icons.settings,
                    text: 'ڕێکخستنەکان',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ],
    ));
  }
}
