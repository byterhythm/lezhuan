import 'package:flutter/material.dart';
import 'package:lezhuan/screens/home_srceen.dart';
import 'package:lezhuan/screens/publish_screen.dart';
import 'package:lezhuan/screens/login_screen.dart';
import 'package:lezhuan/screens/register.dart';
import 'package:lezhuan/screens/user_screen.dart';

import '../common/constants.dart';

enum BottomCell { home, publish, user }

class BottomNavBar extends StatelessWidget {
  String pageName;

  BottomNavBar({this.pageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 68,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BottomNavItem(
            title: '首页',
            icon: Icons.home,
            isActive: "home" == pageName,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          BottomNavItem(
            title: "发布",
            icon: Icons.border_color,
            isActive: "publish" == pageName,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PublishScreen()),
              );
            },
          ),
          BottomNavItem(
            title: "用户",
            icon: Icons.account_circle,
            isActive: "user" == pageName,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function press;
  final bool isActive;

  const BottomNavItem({
    Key key,
    this.icon,
    this.title,
    this.press,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            icon,
            color: isActive ? kActiveIconColor : kTextColor,
          ),
          Text(
            title,
            style: TextStyle(color: isActive ? kActiveIconColor : kTextColor),
          ),
        ],
      ),
    );
  }
}
