import 'package:flutter/material.dart';
import 'package:lezhuan/user/login.dart';
import 'package:lezhuan/user/register.dart';

import 'constants.dart';
import 'welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
//          brightness: Brightness.dark,
//          primaryColor: hPrimaryColor,
//          scaffoldBackgroundColor: hBackgroundColor,
//          textTheme: TextTheme(
//              display1: TextStyle(
//                color: Colors.white,
//                fontWeight: FontWeight.bold,
//              ),
//              button: TextStyle(
//                color: hPrimaryColor,
//              ),
//              headline: TextStyle(
//                color: Colors.white,
//                fontWeight: FontWeight.normal,
//              ))
      ),
      home: WelcomeScreen(),
    );
  }
}


