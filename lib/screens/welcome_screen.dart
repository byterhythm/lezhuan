import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lezhuan/screens/home_srceen.dart';
import 'package:lezhuan/screens/lezhuan_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(
      seconds: 2
    ),()=>{
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return LeZhuan();
      }))
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.teal
            ),
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
                      valueColor:new AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text('我们一起来赚钱',style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      ),),
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
