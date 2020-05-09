import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:lezhuan/common/constants.dart';
import 'package:lezhuan/model/tasks.dart';

import 'task_detail.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profile",
      home: ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatelessWidget {
  TextStyle _style() {
    return TextStyle(fontWeight: FontWeight.bold);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: hBackgroundColor,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 30),
                padding: EdgeInsets.only(bottom: 50),
                decoration: BoxDecoration(
                    color: hPrimaryColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black45.withOpacity(0.3),
                          offset: Offset(0, 8),
                          blurRadius: 20)
                    ]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 12),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 90,
                            height: 90,
                            margin: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: ExactAssetImage(
                                        'assets/images/toystory.jpg'))),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Milan Short",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "专享邀请ID:38603",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "V1会员",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                      ),
                    ),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceAround,
//                      children: <Widget>[
//                        Column(
//                          children: <Widget>[
//                            Text(
//                              "Schedule",
//                              style: TextStyle(color: Colors.white),
//                            ),
//                            Text(
//                              "8",
//                              style: TextStyle(fontSize: 26, color: Colors.white),
//                            )
//                          ],
//                        ),
//                        Column(
//                          children: <Widget>[
//                            Text(
//                              "Events",
//                              style: TextStyle(color: Colors.white),
//                            ),
//                            Text(
//                              "12",
//                              style: TextStyle(fontSize: 26, color: Colors.white),
//                            )
//                          ],
//                        ),
//                        Column(
//                          children: <Widget>[
//                            Text(
//                              "Routines",
//                              style: TextStyle(color: Colors.white),
//                            ),
//                            Text(
//                              "4",
//                              style: TextStyle(fontSize: 26, color: Colors.white),
//                            )
//                          ],
//                        ),
//                      ],
//                    ),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.end,
//                      children: <Widget>[
//                        Column(
//                          children: <Widget>[
//                            Text(
//                              "Savings",
//                              style: TextStyle(color: Colors.white),
//                            ),
//                            Text(
//                              "20K",
//                              style: TextStyle(color: Colors.white, fontSize: 24),
//                            )
//                          ],
//                        ),
//                        SizedBox(
//                          width: 32,
//                        ),
//                        Column(
//                          children: <Widget>[
//                            Text(
//                              "July Goals",
//                              style: TextStyle(color: Colors.white),
//                            ),
//                            Text("50K",
//                                style: TextStyle(color: Colors.white, fontSize: 24))
//                          ],
//                        ),
//                        SizedBox(
//                          width: 16,
//                        )
//                      ],
//                    ),
                  ],
                ),
              ),
              Positioned(
                top: 45,
                right: 20,
                child: Material(
                  color: Colors.transparent,
                  child: Ink(
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {
                        print("qian dao");
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 8, right: 8, top: 2, bottom: 2),
                        child: Text(
                          "签到",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                right: 25,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "持有收益(元)",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "+200.0",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),

                        ],
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "累计收益(元)",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "+1000.0",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 145,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    "任务管理",
                    style: TextStyle(
                        color: Color(0xFF262C32),
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(
                          Icons.show_chart,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '进行中',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(
                          Icons.table_chart,
                          color: Colors.orangeAccent,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '审核中',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(
                          Icons.code,
                          color: Colors.green,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '已审核',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(
                          Icons.markunread,
                          color: Colors.deepPurpleAccent,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '审核发布',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(
                          Icons.computer,
                          color: Colors.indigo,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '发布管理',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 135,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "会员俱乐部",
                        style: TextStyle(
                            color: Color(0xFF262C32),
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "V1会员",
                            style: TextStyle(
                                color: Color(0xFF262C32), fontSize: 16),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Color(0xFF7F7F7F),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xFFF4F4F4)),
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Align(
                    widthFactor: 2,
                    heightFactor: 2,
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                          text: '会员等级更新:',
                          style: TextStyle(
                              color: Color(0xFF262C32), fontSize: 13.0),
                          children: <TextSpan>[
                            TextSpan(
                                text: '本期会员等级已更新，查看我的特权 >>',
                                style: TextStyle(
                                    color: Color(0xFF7F7F7F), fontSize: 13.0)),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 240,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                  child: Text(
                    "我的服务",
                    style: TextStyle(
                        color: Color(0xFF262C32),
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.library_books,
                            size: 35,
                            color: Color(0xFF7EA3E2),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('新手教程',
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF262C32)))
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.people,
                            size: 35,
                            color: Color(0xFFEEB863),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('邀请好友',
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF262C32)))
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.share,
                            size: 35,
                            color: Color(0xFF7EA3E2),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('发朋友圈',
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF262C32)))
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.account_circle,
                            size: 35,
                            color: Color(0xFFEF8A6A),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('客服中心',
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF262C32)))
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.assignment,
                            size: 35,
                            color: Color(0xFFF7C781),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('用户协议',
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF262C32)))
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.security,
                            size: 35,
                            color: Color(0xFF66B7BD),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('隐私协议',
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF262C32)))
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.unarchive,
                            size: 35,
                            color: Color(0xFFCE7B84),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('退出登录',
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF262C32)))
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.business_center,
                            size: 35,
                            color: Colors.transparent,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('客服中心',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.transparent))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

final String url =
    "http://img5.imgtn.bdimg.com/it/u=3108524344,169602439&fm=26&gp=0.jpg";

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size(double.infinity, 300);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 48),
      decoration: BoxDecoration(
          color: hPrimaryColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black45.withOpacity(0.3),
                offset: Offset(0, 8),
                blurRadius: 20)
          ]),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                ExactAssetImage('assets/images/toystory.jpg'))),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Milan Short",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    "Schedule",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "8",
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    "Events",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "12",
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    "Routines",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "4",
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Savings",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "20K",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  )
                ],
              ),
              SizedBox(
                width: 32,
              ),
              Column(
                children: <Widget>[
                  Text(
                    "July Goals",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text("50K",
                      style: TextStyle(color: Colors.white, fontSize: 24))
                ],
              ),
              SizedBox(
                width: 16,
              )
            ],
          ),
        ],
      ),
    );
  }
}
