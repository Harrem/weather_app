import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:weather_app/view/screens/home_screen.dart';
import 'package:weather_app/view/screens/search_screen.dart';
import 'package:weather_app/view/screens/setting_screen.dart';
import 'package:flutter/cupertino.dart';

class PageState extends StatefulWidget {
  const PageState({Key? key}) : super(key: key);

  @override
  State<PageState> createState() => _PageStateState();
}

class _PageStateState extends State<PageState> {
  int _selectedIndex = 0;
  List pageScreens = [
    const HomeScreen(),
    const SearchScreen(),
    const SettingScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              child: pageScreens[_selectedIndex],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                width: 300,
                child: GNav(
                    tabBackgroundColor: Color.fromARGB(255, 234, 234, 247),
                    activeColor: Color.fromARGB(255, 100, 110, 150),
                    color: Colors.grey[700],
                    padding: const EdgeInsets.all(10),
                    duration: const Duration(milliseconds: 200),
                    tabBorderRadius: 15,
                    backgroundColor: Colors.transparent,
                    tabs: const [
                      GButton(
                        gap: 10,
                        icon: Iconsax.home5,
                        text: 'Home',
                      ),
                      GButton(
                        gap: 15,
                        icon: Iconsax.search_normal5,
                        text: 'Search',
                      ),
                      GButton(
                        gap: 10,
                        icon: Iconsax.setting1,
                        text: 'Settings',
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
