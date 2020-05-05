import 'package:flutter/material.dart';

class Register extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: '手机号'
            ),
          )
        ],
      ),
    );
  }

}