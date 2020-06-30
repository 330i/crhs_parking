import 'package:flutter/material.dart';
import 'package:crhs_parking_app/animations/fade_animation.dart';

class Spots extends StatefulWidget {
  String position;
  Spots(this.position);
  @override
  _SpotsState createState() => _SpotsState();
}

class _SpotsState extends State<Spots> {
  @override
  Widget build(BuildContext context) {

    List<int> spots = new List<int>();

    if(widget.position=='a'){
      //Back Lot
      for(int i=1420;i<=1593;i++){
        spots.add(i);
      }
    }
    if(widget.position=='b'){
      //9th Grade Center
      for(int i=1305;i<=1419;i++){
        spots.add(i);
      }
    }
    if(widget.position=='c'){
      //PAC Lot
      for(int i=1192;i<=1304;i++){
        spots.add(i);
      }
    }
    if(widget.position=='d'){
      //1200 Lot
      for(int i=736;i<=1191;i++){
        spots.add(i);
      }
    }
    if(widget.position=='e'){
      //1600 Lot
      for(int i=356;i<=735;i++){
        spots.add(i);
      }
    }
    if(widget.position=='f'){
      //Athletic Lot
      for(int i=1;i<=355;i++){
        spots.add(i);
      }
    }

    return Scaffold(
      body: Column(
        children: [
          FadeAnimation(
            3,
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
                    child: Image.asset('assets/schoolparking.png'),
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
            height: 423,
            child: Container(

            ),
          ),
        ],
      ),
    );
  }
}
