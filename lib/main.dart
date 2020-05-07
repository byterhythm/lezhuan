import 'package:flutter/material.dart';
import 'package:lezhuan/screens/login_screen.dart';
import 'package:lezhuan/screens/register.dart';
import 'package:lezhuan/widgets/bottom_nav_bar.dart';

import 'common/constants.dart';
import 'screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: WelcomeScreen(),
    );
  }
}


