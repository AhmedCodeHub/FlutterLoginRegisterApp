import 'package:flutter/material.dart';
import 'package:loginapptask/screens/tabs/history_tab.dart';
import 'package:loginapptask/screens/tabs/notifications_tab.dart';
import 'package:loginapptask/screens/tabs/profile_tab.dart';
import 'package:loginapptask/screens/tabs/statistic_tab.dart';

import 'tabs/home_tab.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    final List<Widget> _children = [
      const HomeTab(),
      const HistoryTab(),
      const ProfileTab(),
      const StatisticTab(),
      const NotificationsTab()
    ];

    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex, // this will be set when a new tab is tapped
        onTap: onTabTapped,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home, color: Colors.grey, size: 35,),
            activeIcon: Container(
              alignment: Alignment.center,
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 6,
                    color: Colors.deepOrange,
                  ),
                  const Icon(Icons.home, color: Colors.red, size: 30,)
                ],
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.history, color: Colors.grey, size: 35,),
            activeIcon: Container(
              alignment: Alignment.center,
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 6,
                    color: Colors.deepOrange,
                  ),
                  const Icon(Icons.history, color: Colors.red, size: 30,)
                ],
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person, color: Colors.grey, size: 35,),
            activeIcon: Container(
              alignment: Alignment.center,
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 6,
                    color: Colors.deepOrange,
                  ),
                  const Icon(Icons.person, color: Colors.red, size: 30,)
                ],
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.bar_chart_outlined, color: Colors.grey, size: 35,),
            activeIcon: Container(
              alignment: Alignment.center,
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 6,
                    color: Colors.deepOrange,
                  ),
                  const Icon(Icons.bar_chart_outlined, color: Colors.red, size: 30,)
                ],
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications, color: Colors.grey, size: 35,),
            activeIcon: Container(
              alignment: Alignment.center,
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 6,
                    color: Colors.deepOrange,
                  ),
                  const Icon(Icons.notifications, color: Colors.red, size: 30,)
                ],
              ),
            ),
            label: "",
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
