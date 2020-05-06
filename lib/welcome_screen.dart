import 'package:flutter/material.dart';

import 'constants.dart';
import 'user/login.dart';
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 3,
              child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/image_welcome.png'),
                      )))),
          Expanded(
              child: Column(
                children: <Widget>[
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "今日乐赚\n",
                            style: Theme.of(context).textTheme.display1),
                        TextSpan(
                            text: "流行的赚钱方式",
                            style: Theme.of(context).textTheme.display2)
                      ])),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 26, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: hPrimaryColor),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Login();
                        }));
                      },
                      child: Text("开启",style: TextStyle(
                          color: Colors.white
                      ),),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}