import 'package:flutter/material.dart';
import 'package:learning_flutter/screen/home.dart';

import '../screen/profile.dart';
import '../screen/test.dart';

class BottomNaviButtons extends StatefulWidget {
  const BottomNaviButtons({super.key});

  @override
  State<BottomNaviButtons> createState() => _BottomNaviButtonsState();
}

class _BottomNaviButtonsState extends State<BottomNaviButtons> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
        // _selectedIndex = 1;
      });
    }
  }

  final List<Widget> _children = [
    const Test(),
    const HomePageWidget(),
    const HomePageWidget(),
    const UserSetting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _children),
      bottomNavigationBar: SizedBox(
        height: 78,
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/home_inactive.png'),
              activeIcon: Image.asset('assets/images/home_inactive.png',
                  color: const Color(0xffFFA700)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/compass_inactive.png'),
              activeIcon: Image.asset('assets/images/compass_inactive.png',
                  color: const Color(0xffFFA700)),
              label: 'Chuyên mục',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/bookmark_inactive.png'),
              activeIcon: Image.asset('assets/images/bookmark_inactive.png',
                  color: const Color(0xffFFA700)),
              label: 'Quan tâm',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/profile_inactive.png'),
              activeIcon: Image.asset('assets/images/profile_inactive.png',
                  color: const Color(0xffFFA700)),
              label: 'Cá nhân',
            ),
          ],
          selectedItemColor: const Color(0xffFFA700),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
        ),
      ),
    );
  }
}
