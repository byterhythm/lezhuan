import 'package:flutter/material.dart';
import 'package:lezhuan/model/tasks.dart';

import '../constants.dart';

class HorContentScroll extends StatelessWidget {
  final List<String> images;
  final String title;
  final double imageHeight;
  final double imageWidth;

  HorContentScroll({
    this.images,
    this.title,
    this.imageHeight,
    this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () => print('View $title'),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                  size: 30.0,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: imageHeight,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20.0,
                ),
                width: imageWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image(
                    image: AssetImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class VerContentScroll extends StatelessWidget {
  final List<Task> tasks;
  final String title;

  VerContentScroll({
    this.tasks,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () => print('View $title'),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                  size: 30.0,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            itemCount: tasks.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  height: 100,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.0, 17.0),
                        blurRadius: 23.0,
                        spreadRadius: -13,
                        color: kShadowColor,
                      ),
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      Image.asset(tasks[index].icon),
                      SizedBox(width: 20,),
                      Expanded(child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tasks[index].title,
                            style: Theme.of(context).textTheme.subtitle,
                          ),
                          Text(
                            tasks[index].subTitle,
                          )
                        ],
                      )),
                      Padding(padding: EdgeInsets.all(10),
                      child: Text(
                        tasks[index].encourage,
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 18
                        ),
                      ),)
                    ],
                  ));
            })
      ],
    );
  }
}
