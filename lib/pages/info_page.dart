import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:crhs_parking_app/login/data_set.dart';
import 'package:crhs_parking_app/login/login.dart';

DatabaseService data = new DatabaseService(idSubmit);
String currentID = idSubmit;

class InfoPage extends StatefulWidget {

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {

  @override
  Widget build(BuildContext context) {

    double widgetSize = 30;
    Color backColor = Color.fromRGBO(38, 50, 65, 1);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      backgroundColor: Color.fromRGBO(79, 91, 98, 1),
      body: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/infopagepicture.png',
              height: MediaQuery.of(context).size.height/2.618,
            ),
          ),
          Container(
            child: Container(
              child: data.getDataMap('spot', 'spot', MediaQuery.of(context).size.width/2.618, backColor, FontWeight.w700),
              alignment: Alignment.bottomLeft,
            ),
            height: MediaQuery.of(context).size.height/2.4,
            alignment: Alignment.bottomLeft,
          ),
          Container(
            child: ScrollConfiguration(
              behavior: ScrollBehavior(),
              child: GlowingOverscrollIndicator(
                axisDirection: AxisDirection.down,
                color: backColor,
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height/3.1,
                    ),
                    Container(
                      color: backColor,
                      alignment: Alignment.topCenter,
                      height: MediaQuery.of(context).size.height-MediaQuery.of(context).size.height/3.1,
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 20,
                                ),
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 5),
                                      child: data.getDataMapBool('spot', 'licence', widgetSize+5, backColor),
                                    ),
                                    Text(
                                      'License',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: widgetSize,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 20,
                                ),
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 5),
                                      child: data.getDataMapBool('spot', 'insurance', widgetSize, backColor),
                                    ),
                                    Text(
                                      'Insurance',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: widgetSize,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 20,
                                ),
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 5),
                                      child: Icon(
                                        Icons.attach_money,
                                        size: widgetSize,
                                        color: Colors.white,
                                      ),
                                    ),
                                    data.getDataMap('spot', 'due', widgetSize, Colors.white, FontWeight.w300),
                                    Text(
                                      ' Due',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: widgetSize,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  scrollDirection: Axis.vertical,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
