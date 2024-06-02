import 'package:ayush_hospitals/view/home/my_map.dart';
import 'package:flutter/material.dart';
import 'package:ayush_hospitals/view/home/SettingsScreen.dart';
import 'package:ayush_hospitals/view/home/ProfileScreen.dart';
import 'package:ayush_hospitals/view/home/NotifyScreen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class CustomizedBottomNavigationbar extends StatefulWidget {
  const CustomizedBottomNavigationbar({Key? key}) : super(key: key);

  @override
  _CustomizedBottomNavigationbarState createState() =>
      _CustomizedBottomNavigationbarState();
}

class _CustomizedBottomNavigationbarState
    extends State<CustomizedBottomNavigationbar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.transparent, // Set background color to transparent
    body: Stack(
      children: [
      bodySection(),
      Positioned(
        top: 25.0,
        left: 2.0,
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              index = 0;
            });
          },
          child: Icon(
            Icons.home,
            color: Colors.green, // Set the icon color to green
          ),
          backgroundColor: Colors.transparent, // Set background color to transparent
          elevation: 0, // Remove shadow effects
        ),
      ),
    ],
    ),
    bottomNavigationBar: customBottomNavigationBar(),
  );
}


  // Body Section Components
  Widget bodySection() {
    switch (index) {
      case 0:
        return MyMap();
      case 1:
        return const NotifyScreen();
      case 2:
        return const ProfileScreen();
      case 3:
        return const SettingScreen();
      default:
        return const MyMap(); // Default to HomeScreen if index is not recognized
    }
  }

  // BottomNavigationBar Section Components
  Widget customBottomNavigationBar() {
    return BottomNavyBar(
      selectedIndex: index,
      items: [
        BottomNavyBarItem(
          icon: const Icon(Icons.apps),
          title: const Text('Home'),
          activeColor: Colors.green,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.message),
          title: const Text('Notify'),
          activeColor: Colors.green,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.people),
          title: const Text('profile'),
          activeColor: Colors.green,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.settings),
          title: const Text('Settings'),
          activeColor: Colors.green,
          textAlign: TextAlign.center,
        ),
      ],
      onItemSelected: (index) => setState(() => this.index = index),
    );
  }
}
