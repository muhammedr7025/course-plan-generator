import 'package:automated_course_plan_generator/constants.dart';
import 'package:flutter/material.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

import 'staff/saved.dart';
import 'staff/settings.dart';
import 'staff/staffhomescreen.dart';

class BtmNav extends StatefulWidget {
  const BtmNav({Key? key}) : super(key: key);

  @override
  State<BtmNav> createState() => _BtmNavState();
}

class _BtmNavState extends State<BtmNav> {
  int _selectedIndex = 0;
  final _pages = [
    StaffHomeScreen(),
    SavedClass(),
    SettingsStaff(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      // body: Center(child: Text('haiiii')),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: GNav(
            gap: 8,
            padding: const EdgeInsets.all(16),
            backgroundColor: kPrimaryLightColor,
            activeColor: Colors.white,
            color: Colors.black,
            tabBackgroundColor: kPrimaryColor,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.favorite,
                text: 'Saved',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
