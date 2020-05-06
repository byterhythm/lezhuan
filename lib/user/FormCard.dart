import 'package:flutter/material.dart';

class FormCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 1),
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
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("登录",
                style: TextStyle(
                    fontSize: 28,
                    fontFamily: "Poppins-Bold",
                    letterSpacing: .6)),
            SizedBox(
              height: 12,
            ),
            Text("账号",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: 16)),
            TextField(
              decoration: InputDecoration(
                  hintText: "请输入手机号",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            SizedBox(
              height: 18,
            ),
            Text("密码",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: 16)),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "请输入密码",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "忘记密码?",
                  style: TextStyle(
                      color: Colors.teal[400],
                      fontFamily: "Poppins-Medium",
                      fontSize: 15),
                )
              ],
            ),
            SizedBox(height: 18,)
          ],
        ),
      ),
    );
  }
}
