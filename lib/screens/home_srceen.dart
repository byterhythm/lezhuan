import 'package:flutter/material.dart';
import 'package:lezhuan/common/constants.dart';
import 'package:lezhuan/screens/login_screen.dart';
import 'package:lezhuan/widgets/bottom_nav_bar.dart';

import '../model/movies.dart';
import '../model/tasks.dart';
import '../widgets/content_scroll.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  _movieSelector(int index) {
    var size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
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
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Hero(
                    tag: movies[index].imageUrl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        image: AssetImage(movies[index].imageUrl),
                        height: 220.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30.0,
              bottom: 40.0,
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
          Container(
            height: 280.0,
            width: double.infinity,
            child: PageView.builder(
              controller: _pageController,
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                return _movieSelector(index);
              },
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      print('点击了第一个');
                    },
                    child: Container(
                      width: size.width * .30,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFD45253),
                            Color(0xFF9E1F28),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF9E1F28),
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "抖音悬赏",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.8,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * .30,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFD45253),
                          Color(0xFF9E1F28),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF9E1F28),
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "快手悬赏",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.8,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * .30,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFD45253),
                          Color(0xFF9E1F28),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF9E1F28),
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "火山悬赏",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.8,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: size.width * .46,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFD45253),
                          Color(0xFF9E1F28),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF9E1F28),
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "微视悬赏",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.8,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * .46,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFD45253),
                          Color(0xFF9E1F28),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF9E1F28),
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "官方推荐",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.8,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
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
