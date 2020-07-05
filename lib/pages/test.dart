import 'package:crhs_parking_app/animations/FadeAnimationDown.dart';
import 'package:crhs_parking_app/animations/FadeAnimationStatic.dart';
import 'package:flutter/material.dart';
import 'package:crhs_parking_app/animations/FadeAnimationUp.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 240,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 60,
                    ),
                    FadeAnimationStatic(
                      3.8,
                      Stack(
                        children: <Widget>[
                          Center(
                            child: Container(
                              width: 105,
                              height: 105,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ]
                              ),
                            ),
                          ),
                          Center(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 5,
                                ),
                                SizedBox(
                                  width: 95,
                                  height: 95,
                                  child: ClipRRect(
                                    child: Image.asset('assets/xi.png'),
                                    borderRadius: BorderRadius.circular(45),
                                  ),
                                ),
                                Container(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 25,
                    ),
                    FadeAnimationDown(
                      3.9,
                      Text(
                        'Welcome Ian Kim',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: FadeAnimationUp(
                3,
                Container(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height-296,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 80,
                            ),
                            Text(
                              '5',
                              style: TextStyle(
                                fontSize: 80,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Days Until Due',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              height: 20,
                            ),
                            Container(
                              width: 200,
                              child: Text(
                                'Show your valid License and Insurance to your Counselor to Confirm your Parking Spot',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height-626,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black38,
                              size: 35,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width-20,
                            height: MediaQuery.of(context).size.height-326,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 10,
                                ),
                                Text(
                                  'Your spot is',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                    color: Colors.black87,
                                  ),
                                ),
                                Text(
                                  '273',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 60,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Payment Method: ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'Check',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height-296,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54.withOpacity(.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.purple]
          ),
        ),
      ),
    );
  }
}
