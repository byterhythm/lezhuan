import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lezhuan/common/le_util.dart';
import 'package:lezhuan/screens/lezhuan_screen.dart';
import 'package:lezhuan/screens/register_screen.dart';
import 'package:lezhuan/store.dart';
import 'package:lezhuan/widgets/FormCard.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  bool _isGoToRegisterPage = false;
  StreamSubscription userSubscription;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorMessage;

  @override
  void initState() {
    super.initState();
    userSubscription = Store.instance.userController.listen((user) {
      if (mounted && user != null) {
        //判断是否是从注册页面跳转回来的
        if(!_isGoToRegisterPage){
          Navigator.pushAndRemoveUntil(
              context, _createHomeRouter(), (router) => router == null);
        }
      }
    }, onError: (Object err) {
      setState(() {
        if (err is APIError) {
          errorMessage = err.toString();
          if (err.type != null && err.type == "login") {
            Utils().showToast(err.reason);
          }
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    userSubscription.cancel();
  }

  void login() {
    setState(() {
      _isGoToRegisterPage = false;
    });
    if (phoneController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      Store.instance.userController
          .login(phoneController.text, passwordController.text);
    } else {
      setState(() {
        errorMessage = "Missing username and/or password.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Image.asset("assets/images/image_01.png"),
              ),
              Expanded(
                child: Container(),
              ),
              Expanded(child: Image.asset("assets/images/image_02.png"))
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 28, top: 60, right: 28),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/logo.png',
                        width: 50,
                        height: 50,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  FormCard(phoneController, passwordController),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          width: 300,
                          height: 45,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xFF80CBC4),
                                Color(0xFF26A69A)
                              ]),
                              borderRadius: BorderRadius.circular(25.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF26A69A).withOpacity(.3),
                                    offset: Offset(0.0, 8.0),
                                    blurRadius: 8.0)
                              ]),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: login,
                              child: Center(
                                child: Text("进 入",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins-Bold",
                                        fontSize: 18,
                                        letterSpacing: 1.0)),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "还没有创建账户? ",
                        style: TextStyle(
                          fontFamily: "Poppins-Medium",
                          fontSize: 16,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isGoToRegisterPage = true;
                          });
                          Navigator.of(context)
                              .push(_createRegisterRouter());
                        },
                        child: Text("去创建",
                            style: TextStyle(
                                color: Color(0xFF26A69A),
                                fontSize: 16,
                                fontFamily: "Poppins-Bold")),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Route _createHomeRouter() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => LeZhuan(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

Route _createRegisterRouter() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Register(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

Widget radioButton(bool isSelected) => Container(
      width: 16.0,
      height: 16.0,
      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2.0, color: Colors.black)),
      child: isSelected
          ? Container(
              width: double.infinity,
              height: double.infinity,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.black),
            )
          : Container(),
    );

//String _host() {
//  if (Platform.isAndroid)
//    return "http://10.2.116.150:8888";
//  else
//    return "http://127.0.0.1:8888";
//}
//
//void loadUserInfo() async {
//  const clientID = "com.shr.lezhuan";
//  const body = "username=bob&password=password&grant_type=password";
//
//  // Note the trailing colon (:) after the clientID.
//// A client identifier secret would follow this, but there is no secret, so it is the empty string.
//  final String clientCredentials =
//      const Base64Encoder().convert("$clientID:".codeUnits);
//  final http.Response response = await http.post('${_host()}/auth/token',
//      headers: {
//        "Content-Type": "application/x-www-form-urlencoded",
//        "Authorization": "Basic $clientCredentials"
//      },
//      body: body);
//  print(response.body);
//}
