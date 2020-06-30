import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crhs_parking_app/animations/fade_animation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:crhs_parking_app/models/user.dart';
import 'map.dart';

class InfoPage extends StatefulWidget {

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {

  String _uid;
  User currentStudent;

  @override
  void initState() {
    getUser();
    super.initState();
  }

  void getUser() async {
    FirebaseUser getUser = await FirebaseAuth.instance.currentUser();
    DocumentSnapshot userData = await Firestore.instance.collection('users').document(getUser.uid).get();
    _uid = getUser.uid;
    currentStudent = User.fromSnapshot(userData);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    if(currentStudent==null){
      return Scaffold(
        body: Center(
          child: Container(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
    else{
      return Scaffold(
        body: StreamBuilder(
          stream: Firestore.instance.collection('users').document(_uid).snapshots(),
          builder: (context, snapshot) {
            if(!snapshot.hasData) {
              return Scaffold(
                body: Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            }
            else {
              if(snapshot.data['spotuid']=='none') {
                return Scaffold(
                  backgroundColor: Colors.indigo,
                  body: Column(
                    children: [
                      Container(
                        height: 200,
                      ),
                      GestureDetector(
                        child: FadeAnimation(
                          1,
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  child: FlareActor(
                                    "assets/add.flr",
                                    alignment:Alignment.center,
                                    fit:BoxFit.contain,
                                    animation: 'active'
                                  ),
                                  height: 250,
                                ),
                                FadeAnimation(
                                  1.2,
                                  Text(
                                    'Reserve a Parking Spot',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height-256,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Map())
                          );
                        },
                      ),
                    ],
                  ),
                );
              }
              else{
                return Scaffold();
              }
            }
          },
        ),
      );
    }
  }
}
