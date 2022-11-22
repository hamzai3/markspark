import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markshark_mvc/screens/leaderBoard.dart';
import 'package:markshark_mvc/screens/profileScreen.dart';
import 'package:markshark_mvc/screens/selectSubject.dart';
import 'package:markshark_mvc/screens/queAnsScreen.dart';

import '../constants/expo_all_const.dart';

class BottomNavWidget extends StatelessWidget {
  final int currentIndex;
  BottomNavWidget({Key key, this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Leader Board',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Profile',
          ),
        ],
        currentIndex: currentIndex,
        selectedItemColor: blue_color,
        onTap: (index) {
          print("Bottom nav index $index");
          switch (index) {
            case 0:
              Get.to(SelectSubject(),
                  // transition: Transition.rightToLeft,
                  duration: Duration(milliseconds: 100));
              break;
            case 1:
              Get.to(LeaderBoard(),
                  // transition: Transition.rightToLeft,
                  duration: Duration(milliseconds: 100));

              break;
            case 2:
              Get.to(ProfileScreen(),
                  // transition: Transition.rightToLeft,
                  duration: Duration(milliseconds: 100));
              break;
          }
          // setState(() {
          //   _index = index;
          // });
          // onTap: _onItemTapped,
        });
  }
}
