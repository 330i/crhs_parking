import 'package:crhs_parking_app/pages/spots_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 239, 241, 1),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  height: 50,
                ),
                Container(
                  height: 5,
                ),
                Container(
                  child: Image.asset(
                    'assets/schoolparking.png',
                    height: MediaQuery.of(context).size.height/3,
                  ),
                ),
                Container(
                  height: 35,
                ),
              ],
            ),
          ),
          Container(
            height: 2*MediaQuery.of(context).size.height/3-90,
            child: ListView(
              children: [
                Container(
                  height: 510,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      SpotButton('Back Lot', 'a'),
                      SpotButton('9th Grade Center', 'b'),
                      SpotButton('PAC Lot', 'c'),
                      SpotButton('1200 Lot', 'd'),
                      SpotButton('1600 Lot', 'e'),
                      SpotButton('Athletic Lot', 'f'),
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

  Widget SpotButton(String name, String spot) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width-10,
          child: ButtonTheme(
            height: 70,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17),
              ),
              elevation: 0,
              child: Row(
                children: [
                  Text(
                    ' $name',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  )
                ],
              ),
              color: Color.fromRGBO(236, 239, 241, 1),
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) => Spots(spot)));
              },
            ),
          ),
        ),
        spot=='f' ? Container() :
        Divider(
          thickness: 2,
          indent: 20,
          endIndent: 20,
          color: Colors.grey,
        ),
      ],
    );
  }
}
