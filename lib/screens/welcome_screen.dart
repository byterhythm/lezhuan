import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lezhuan/common/le_util.dart';
import 'package:lezhuan/screens/lezhuan_screen.dart';
import 'package:lezhuan/screens/login_screen.dart';
import 'package:lezhuan/store.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  StreamSubscription subscription;

  @override
  void initState() {
    super.initState();
    //test
//    Timer(
//        Duration(seconds: 2),
//        () => {
//              Navigator.pushAndRemoveUntil(context,
//                  MaterialPageRoute(builder: (context) {
//                return Login();
//              }), (route) => route == null)
//            });
    subscription = Store.instance.userController.listen((u) {
      if (u != null) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
          return LeZhuan();
        }), (route) => route == null);
      } else {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
          return Login();
        }), (route) => route == null);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.teal),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      child: Icon(
                        Icons.bubble_chart,
                        size: 60,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text('今日乐赚',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          Colors.orangeAccent),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        '我们一起来赚钱',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
