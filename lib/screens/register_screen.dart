import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lezhuan/store.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nickNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  String errorMessage = "";
  StreamSubscription userSubscription;

  TextField get phoneField => TextField(
        controller: phoneController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            hintText: "请输入手机号",
            hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
      );

  TextField get nickNameField => TextField(
        keyboardType: TextInputType.text,
        controller: nickNameController,
        decoration: InputDecoration(
            hintText: "请输入昵称（选填）",
            hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
      );

  TextField get passwordField => TextField(
        obscureText: true,
        controller: passwordController,
        decoration: InputDecoration(
            hintText: "请输入密码",
            hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
      );

  TextField get rePasswordField => TextField(
        obscureText: true,
        controller: rePasswordController,
        decoration: InputDecoration(
            hintText: "请再次输入密码",
            hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
      );

  @override
  void initState() {
    super.initState();
    userSubscription = Store.instance.userController.listen((user) {
      if (mounted && user != null) {
        Fluttertoast.showToast(
            msg: "注册成功",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.black45,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Navigator.of(context).pop();
      }
    }, onError: (Object err) {
      setState(() {
        errorMessage = err.toString();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    userSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(fit: StackFit.expand, children: <Widget>[
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
                      Material(
                        color: Colors.transparent,
                        child: Ink(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: 30,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0.0, 15.0),
                              blurRadius: 15.0),
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0.0, -10.0),
                              blurRadius: 10.0),
                        ]),
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("创建账户",
                              style: TextStyle(
                                  fontSize: 28,
                                  fontFamily: "Poppins-Bold",
                                  letterSpacing: .6)),
                          SizedBox(
                            height: 12,
                          ),
                          Text("账号",
                              style: TextStyle(
                                  fontFamily: "Poppins-Medium", fontSize: 16)),
                          phoneField,
                          SizedBox(
                            height: 18,
                          ),
                          Text("昵称",
                              style: TextStyle(
                                  fontFamily: "Poppins-Medium", fontSize: 16)),
                          nickNameField,
                          SizedBox(
                            height: 18,
                          ),
                          Visibility(
                            visible: true,
                            child: Text("密码",
                                style: TextStyle(
                                    fontFamily: "Poppins-Medium",
                                    fontSize: 16)),
                          ),
                          Visibility(
                            visible: true,
                            child: passwordField,
                          ),
                          Visibility(
                            visible: true,
                            child: SizedBox(
                              height: 18,
                            ),
                          ),
                          Visibility(
                            visible: true,
                            child: Text("确认密码",
                                style: TextStyle(
                                    fontFamily: "Poppins-Medium",
                                    fontSize: 16)),
                          ),
                          Visibility(
                            visible: true,
                            child: rePasswordField,
                          ),
                          SizedBox(
                            height: 25,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Visibility(
                    visible: true,
                    child: Row(
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
                                onTap: register,
                                child: Center(
                                  child: Text("创 建",
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
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          )
        ]));
  }

  void showAlert(String text, BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
                title: new Text("提示"),
                content: new Text(text),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ]));
  }

  void register() {
    if (phoneController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        rePasswordController.text.isNotEmpty) {
      if (passwordController.text != rePasswordController.text) {
          errorMessage = "两次密码输入不一致.";
          Fluttertoast.showToast(
              msg: errorMessage,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.black45,
              textColor: Colors.white,
              fontSize: 16.0
          );
      } else {
        Store.instance.userController
            .register(phoneController.text,nickNameController.text, passwordController.text);
      }
    } else {
        errorMessage = "缺失用户名或者密码.";
        Fluttertoast.showToast(
            msg: errorMessage,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.black45,
            textColor: Colors.white,
            fontSize: 16.0
        );
    }
  }
}
