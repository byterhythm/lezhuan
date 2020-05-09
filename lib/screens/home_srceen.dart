import 'dart:async';
import 'dart:math';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:lezhuan/common/constants.dart';
import 'package:lezhuan/screens/login_screen.dart';

import '../model/movies.dart';
import '../model/tasks.dart';
import '../widgets/content_scroll.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

List<String> _adPictures = [
  "assets/images/nutcracker.jpg",
  "assets/images/spiderman.jpg",
  "assets/images/toystory.jpg"
];

class _HomeScreenState extends State<HomeScreen> {
  var timer;
  var currentPage = 0;
  var _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 5), _handleTimeout);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _handleTimeout(Timer timer) {
    if (_pageController.hasClients) {
      if (_pageController.page.round() == _adPictures.length - 1) {
        _pageController.animateToPage(0,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
      } else {
        _pageController.nextPage(
            duration: Duration(milliseconds: 500), curve: Curves.ease);
      }
    }
  }

  _movieSelector(int index) {
    currentPage = index;
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        return widget;
      },
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Login(),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10.0, right: 10, top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Hero(
                tag: movies[index].imageUrl,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image(
                    image: AssetImage(movies[index].imageUrl),
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30.0,
              bottom: 10.0,
              child: Container(
                width: 250.0,
                child: Text(
                  movies[index].title.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: hBackgroundColor,
      body: ListView(
        children: <Widget>[
//          Stack(
//            children: <Widget>[
//              Container(
//                margin: EdgeInsets.only(top: 20),
//                child: SizedBox(
//                  width: size.width,
//                  height: size.height * .20,
//                  child: PageView(
//                    scrollDirection: Axis.horizontal,
//                    controller: _pageController,
//                    onPageChanged: (index) {
//                      currentPage = index;
//                      setState(() {});
//                    },
//                    children: <Widget>[
//                      Padding(
//                        padding: EdgeInsets.only(left: 12, right: 12),
//                        child: Container(
//                          decoration: BoxDecoration(
//                              color: Colors.grey,
//                              borderRadius: BorderRadius.circular(8)),
//                          child: ClipRRect(
//                            borderRadius: BorderRadius.circular(10.0),
//                            child: Image(
//                              image: AssetImage(_adPictures[currentPage]),
//                              fit: BoxFit.cover,
//                            ),
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//              Positioned(
//                bottom: 10,
//                left: 0,
//                right: 0,
//                child: Row(
//                  mainAxisSize: MainAxisSize.min,
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    for (int i = 0; i < _adPictures.length; i++)
//                      if (i == currentPage)
//                        circleBar(true)
//                      else
//                        circleBar(false)
//                  ],
//                ),
//              )
//            ],
//          ),
          Stack(
            children: <Widget>[
              Container(
                width: size.width,
                height: size.height * .20,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _movieSelector(index);
                  },
                ),
              ),
//              Positioned(
//                bottom: 10,
//                left: 0,
//                right: 0,
//                child: Row(
//                  mainAxisSize: MainAxisSize.min,
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    for (int i = 0; i < movies.length; i++)
//                      if (i == currentPage)
//                        circleBar(true)
//                      else
//                        circleBar(false)
//                  ],
//                ),
//              )
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: <Widget>[
                new Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: new Container(
                    height: 100.0,
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(5.0),
                        color: Color(0xFFFD7384)),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(
                          Icons.drive_eta,
                          color: Colors.white,
                        ),
                        new Text("官方推荐",
                            style: new TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                )),
                new Expanded(
                    child: new Container(
                  height: 100.0,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(bottom: 2.5, right: 2.5),
                          child: new Container(
                            decoration: new BoxDecoration(
                                color: Color(0XFF2BD093),
                                borderRadius: new BorderRadius.circular(5.0)),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: new Icon(
                                    Icons.local_offer,
                                    color: Colors.white,
                                  ),
                                ),
                                new Text('抖音悬赏',
                                    style: new TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 2.5, right: 2.5),
                          child: new Container(
                            decoration: new BoxDecoration(
                                color: Color(0XFFFC7B4D),
                                borderRadius: new BorderRadius.circular(5.0)),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: new Icon(
                                    Icons.beenhere,
                                    color: Colors.white,
                                  ),
                                ),
                                new Text('火山悬赏',
                                    style: new TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
                new Expanded(
                    child: new Container(
                  height: 100.0,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 2.5, bottom: 2.5),
                          child: new Container(
                            decoration: new BoxDecoration(
                                color: Color(0XFF53CEDB),
                                borderRadius: new BorderRadius.circular(5.0)),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: new Icon(
                                    Icons.account_balance,
                                    color: Colors.white,
                                  ),
                                ),
                                new Text('快手悬赏',
                                    style: new TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2.5, top: 2.5),
                          child: new Container(
                            decoration: new BoxDecoration(
                                color: Color(0XFFF1B069),
                                borderRadius: new BorderRadius.circular(5.0)),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: new Icon(
                                    Icons.art_track,
                                    color: Colors.white,
                                  ),
                                ),
                                new Text('微视悬赏',
                                    style: new TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          VerContentScroll(
            tasks: tasks,
            title: '推荐任务',
          ),
        ],
      ),
    );
  }
}

Widget circleBar(bool isActive) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 150),
    margin: EdgeInsets.symmetric(horizontal: 4),
    height: isActive ? 8 : 8,
    width: isActive ? 8 : 8,
    decoration: BoxDecoration(
        color: isActive ? hPrimaryColor : Color(0x80EEEEEE),
        borderRadius: BorderRadius.all(Radius.circular(12))),
  );
}

//class HomeScreen2 extends StatefulWidget {
//  @override
//  _HomeScreen2State createState() => _HomeScreen2State();
//}
//
//class _HomeScreen2State extends State<HomeScreen2> {
//  PageController _pageController;
//
//  @override
//  void initState() {
//    super.initState();
//    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
//  }
//
//  _movieSelector(int index) {
//    var size = MediaQuery.of(context).size;
//    return AnimatedBuilder(
//      animation: _pageController,
//      builder: (BuildContext context, Widget widget) {
//        double value = 1;
//        if (_pageController.position.haveDimensions) {
//          value = _pageController.page - index;
//          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
//        }
//        return Center(
//          child: SizedBox(
//            height: Curves.easeInOut.transform(value) * 270.0,
//            width: Curves.easeInOut.transform(value) * 400.0,
//            child: widget,
//          ),
//        );
//      },
//      child: GestureDetector(
//        onTap: () => Navigator.push(
//          context,
//          MaterialPageRoute(
//            builder: (_) => Login(),
//          ),
//        ),
//        child: Stack(
//          children: <Widget>[
//            Center(
//              child: Container(
//                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
//                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.circular(10.0),
//                  boxShadow: [
//                    BoxShadow(
//                      color: Colors.black54,
//                      offset: Offset(0.0, 4.0),
//                      blurRadius: 10.0,
//                    ),
//                  ],
//                ),
//                child: Center(
//                  child: Hero(
//                    tag: movies[index].imageUrl,
//                    child: ClipRRect(
//                      borderRadius: BorderRadius.circular(10.0),
//                      child: Image(
//                        image: AssetImage(movies[index].imageUrl),
//                        height: 220.0,
//                        fit: BoxFit.cover,
//                      ),
//                    ),
//                  ),
//                ),
//              ),
//            ),
//            Positioned(
//              left: 30.0,
//              bottom: 40.0,
//              child: Container(
//                width: 250.0,
//                child: Text(
//                  movies[index].title.toUpperCase(),
//                  style: TextStyle(
//                    color: Colors.white,
//                    fontSize: 20.0,
//                    fontWeight: FontWeight.bold,
//                  ),
//                ),
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    var size = MediaQuery.of(context).size;
//    return Scaffold(
//      backgroundColor: hBackgroundColor,
//      body: ListView(
//        children: <Widget>[
//          Container(
//            height: 280.0,
//            width: double.infinity,
//            child: PageView.builder(
//              controller: _pageController,
//              itemCount: movies.length,
//              itemBuilder: (BuildContext context, int index) {
//                return _movieSelector(index);
//              },
//            ),
//          ),
//
////          Column(
////            children: <Widget>[
////              Row(
////                mainAxisAlignment: MainAxisAlignment.spaceAround,
////                children: <Widget>[
////                  InkWell(
////                    onTap: (){
////                      print('点击了第一个');
////                    },
////                    child: Container(
////                      width: size.width * .30,
////                      height: 60,
////                      decoration: BoxDecoration(
////                        borderRadius: BorderRadius.circular(10.0),
////                        gradient: LinearGradient(
////                          begin: Alignment.topCenter,
////                          end: Alignment.bottomCenter,
////                          colors: [
////                            Color(0xFFD45253),
////                            Color(0xFF9E1F28),
////                          ],
////                        ),
////                        boxShadow: [
////                          BoxShadow(
////                            color: Color(0xFF9E1F28),
////                            offset: Offset(0.0, 2.0),
////                            blurRadius: 6.0,
////                          ),
////                        ],
////                      ),
////                      child: Center(
////                        child: Text(
////                          "抖音悬赏",
////                          style: TextStyle(
////                            color: Colors.white,
////                            fontSize: 16.0,
////                            fontWeight: FontWeight.bold,
////                            letterSpacing: 1.8,
////                          ),
////                        ),
////                      ),
////                    ),
////                  ),
////                  Container(
////                    width: size.width * .30,
////                    height: 60,
////                    decoration: BoxDecoration(
////                      borderRadius: BorderRadius.circular(10.0),
////                      gradient: LinearGradient(
////                        begin: Alignment.topCenter,
////                        end: Alignment.bottomCenter,
////                        colors: [
////                          Color(0xFFD45253),
////                          Color(0xFF9E1F28),
////                        ],
////                      ),
////                      boxShadow: [
////                        BoxShadow(
////                          color: Color(0xFF9E1F28),
////                          offset: Offset(0.0, 2.0),
////                          blurRadius: 6.0,
////                        ),
////                      ],
////                    ),
////                    child: Center(
////                      child: Text(
////                        "快手悬赏",
////                        style: TextStyle(
////                          color: Colors.white,
////                          fontSize: 16.0,
////                          fontWeight: FontWeight.bold,
////                          letterSpacing: 1.8,
////                        ),
////                      ),
////                    ),
////                  ),
////                  Container(
////                    width: size.width * .30,
////                    height: 60,
////                    decoration: BoxDecoration(
////                      borderRadius: BorderRadius.circular(10.0),
////                      gradient: LinearGradient(
////                        begin: Alignment.topCenter,
////                        end: Alignment.bottomCenter,
////                        colors: [
////                          Color(0xFFD45253),
////                          Color(0xFF9E1F28),
////                        ],
////                      ),
////                      boxShadow: [
////                        BoxShadow(
////                          color: Color(0xFF9E1F28),
////                          offset: Offset(0.0, 2.0),
////                          blurRadius: 6.0,
////                        ),
////                      ],
////                    ),
////                    child: Center(
////                      child: Text(
////                        "火山悬赏",
////                        style: TextStyle(
////                          color: Colors.white,
////                          fontSize: 16.0,
////                          fontWeight: FontWeight.bold,
////                          letterSpacing: 1.8,
////                        ),
////                      ),
////                    ),
////                  ),
////                ],
////              ),
////              SizedBox(
////                height: 20,
////              ),
////              Row(
////                mainAxisAlignment: MainAxisAlignment.spaceAround,
////                children: <Widget>[
////                  Container(
////                    width: size.width * .46,
////                    height: 60,
////                    decoration: BoxDecoration(
////                      borderRadius: BorderRadius.circular(10.0),
////                      gradient: LinearGradient(
////                        begin: Alignment.topCenter,
////                        end: Alignment.bottomCenter,
////                        colors: [
////                          Color(0xFFD45253),
////                          Color(0xFF9E1F28),
////                        ],
////                      ),
////                      boxShadow: [
////                        BoxShadow(
////                          color: Color(0xFF9E1F28),
////                          offset: Offset(0.0, 2.0),
////                          blurRadius: 6.0,
////                        ),
////                      ],
////                    ),
////                    child: Center(
////                      child: Text(
////                        "微视悬赏",
////                        style: TextStyle(
////                          color: Colors.white,
////                          fontSize: 16.0,
////                          fontWeight: FontWeight.bold,
////                          letterSpacing: 1.8,
////                        ),
////                      ),
////                    ),
////                  ),
////                  Container(
////                    width: size.width * .46,
////                    height: 60,
////                    decoration: BoxDecoration(
////                      borderRadius: BorderRadius.circular(10.0),
////                      gradient: LinearGradient(
////                        begin: Alignment.topCenter,
////                        end: Alignment.bottomCenter,
////                        colors: [
////                          Color(0xFFD45253),
////                          Color(0xFF9E1F28),
////                        ],
////                      ),
////                      boxShadow: [
////                        BoxShadow(
////                          color: Color(0xFF9E1F28),
////                          offset: Offset(0.0, 2.0),
////                          blurRadius: 6.0,
////                        ),
////                      ],
////                    ),
////                    child: Center(
////                      child: Text(
////                        "官方推荐",
////                        style: TextStyle(
////                          color: Colors.white,
////                          fontSize: 16.0,
////                          fontWeight: FontWeight.bold,
////                          letterSpacing: 1.8,
////                        ),
////                      ),
////                    ),
////                  ),
////                ],
////              )
////            ],
////          ),
//        ],
//      ),
//    );
//  }
//}
