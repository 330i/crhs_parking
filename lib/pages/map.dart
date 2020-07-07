import 'package:crhs_parking_app/animations/FadeAnimationUp.dart';
import 'package:crhs_parking_app/pages/spots_page.dart';
import 'package:flutter/material.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {

    Color _buttonColor = Color.fromRGBO(83, 109, 254, 1);

    return Scaffold(
      body: Column(
        children: [
          FadeAnimationUp(
            1,
            Container(
              child: Column(
                children: [
                  Container(
                    height: 30,
                  ),
                  Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          'Lot Selection',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              color: Colors.white
                          ),
                        ),
                      )
                  ),
                  Container(
                    height: 5,
                  ),
                  Container(
                    child: Image.asset(
                      'assets/schoolparking.png',
                    ),
                  ),
                  Container(
                    height: 35,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.lightBlue,
                    ]
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height-120-((2094/4241)*MediaQuery.of(context).size.width),
            child: ListView(
              children: [
                Container(
                  height: 610,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      FadeAnimationUp(
                        1.5,
                        Container(
                          width: MediaQuery.of(context).size.width-20,
                          child: ButtonTheme(
                            height: 85,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                              elevation: 0,
                              child: Row(
                                children: [
                                  Text(
                                    ' Back Lot',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Spacer(
                                    flex: 1,
                                  )
                                ],
                              ),
                              color: _buttonColor,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Spots('a')));
                              },
                            ),
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      FadeAnimationUp(
                        2,
                        Container(
                          width: MediaQuery.of(context).size.width-20,
                          child: ButtonTheme(
                            height: 85,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                              elevation: 0,
                              child: Row(
                                children: [
                                  Text(
                                    ' 9th Grade Center',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Spacer(
                                    flex: 1,
                                  )
                                ],
                              ),
                              color: _buttonColor,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Spots('b')));
                              },
                            ),
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      FadeAnimationUp(
                        2.5,
                        Container(
                          width: MediaQuery.of(context).size.width-20,
                          child: ButtonTheme(
                            height: 85,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                              elevation: 0,
                              child: Row(
                                children: [
                                  Text(
                                    ' PAC Lot',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Spacer(
                                    flex: 1,
                                  )
                                ],
                              ),
                              color: _buttonColor,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Spots('c')));
                              },
                            ),
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      FadeAnimationUp(
                        3,
                        Container(
                          width: MediaQuery.of(context).size.width-20,
                          child: ButtonTheme(
                            height: 85,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                              elevation: 0,
                              child: Row(
                                children: [
                                  Text(
                                    ' 1200 Lot',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Spacer(
                                    flex: 1,
                                  )
                                ],
                              ),
                              color: _buttonColor,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Spots('d')));
                              },
                            ),
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      FadeAnimationUp(
                        3.5,
                        Container(
                          width: MediaQuery.of(context).size.width-20,
                          child: ButtonTheme(
                            height: 85,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                              elevation: 0,
                              child: Row(
                                children: [
                                  Text(
                                    ' 1600 Lot',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Spacer(
                                    flex: 1,
                                  )
                                ],
                              ),
                              color: _buttonColor,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Spots('e')));
                              },
                            ),
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      FadeAnimationUp(
                        4,
                        Container(
                          width: MediaQuery.of(context).size.width-20,
                          child: ButtonTheme(
                            height: 85,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                              elevation: 0,
                              child: Row(
                                children: [
                                  Text(
                                    ' Athletic Lot',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Spacer(
                                    flex: 1,
                                  )
                                ],
                              ),
                              color: _buttonColor,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Spots('f')));
                              },
                            ),
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
