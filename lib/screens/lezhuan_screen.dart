
import 'package:flutter/material.dart';
import 'package:lezhuan/screens/home_srceen.dart';
import 'package:lezhuan/screens/publish_screen.dart';
import 'package:lezhuan/screens/user_screen.dart';

class LeZhuan extends StatefulWidget {

  @override
  _LeZhuanState createState() => _LeZhuanState();
}

class _LeZhuanState extends State<LeZhuan> {
  int _currentIndex = 0;
  final List<Widget> children = [
    HomeScreen(),
    PublishScreen(),
    UserScreen()
  ];

  @override
  void initState() {
    super.initState();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.border_color),
            title: new Text('发布'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('用户')
          )
        ],
      ),
    );
  }


}

