import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crhs_parking_app/login/google_sign_in.dart';
import 'package:crhs_parking_app/pages/change_info.dart';
import 'package:crhs_parking_app/pages/process_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';
import 'map.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 50,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 20,
              ),
              Container(
                child: Text('Settings',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 25,
          ),
          Row(
            children: <Widget>[
              Container(
                width: 10,
              ),
              Container(
                child: FlatButton(
                  child: Container(
                    width: MediaQuery.of(context).size.width-50,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.feedback,
                          color: Colors.lightBlueAccent,
                        ),
                        Container(
                          width: 10,
                        ),
                        Text(
                          'Feedback',
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () async {
                    if (await canLaunch('https://forms.gle/NcPZGGcLJKaFFEEh7')) {
                      await launch('https://forms.gle/NcPZGGcLJKaFFEEh7');
                    }
                    else {

                    }
                  },
                  splashColor: Color.fromRGBO(79, 195, 247, 1),
                  highlightColor: Color.fromRGBO(129, 212, 250, 1),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: 10,
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
                builder: (context, snapshots) {
                  if(!snapshots.hasData) {
                    return Container();
                  }
                  else {
                    DocumentSnapshot currentStudent = snapshots.data as DocumentSnapshot;
                    if(currentStudent['spotuid']=='none') {
                      return Container();
                    }
                    else {
                      return StreamBuilder(
                        stream: FirebaseFirestore.instance.collection('spots').doc(currentStudent['spotuid']).snapshots(),
                        builder: (context, snap) {
                          if(!snap.hasData) {
                            return Container();
                          }
                          else {
                            DocumentSnapshot currentSpot = snap.data as DocumentSnapshot;
                            if(currentSpot['confirmed']) {
                              return Container();
                            }
                            else {
                              return Column(
                                children: <Widget>[
                                  currentSpot['completed'] ? Container(
                                    child: FlatButton(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width-50,
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.info_outline,
                                              color: Colors.lightBlue,
                                            ),
                                            Container(
                                              width: 10,
                                            ),
                                            Text(
                                              'Change Info',
                                              style: TextStyle(
                                                color: Colors.lightBlue,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Process()));
                                      },
                                      splashColor: Color.fromRGBO(79, 195, 247, 1),
                                      highlightColor: Color.fromRGBO(129, 212, 250, 1),
                                    ),
                                  ) : Container(),
                                  Container(
                                    child: FlatButton(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width-50,
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.local_parking,
                                              color: Colors.black54,
                                            ),
                                            Container(
                                              width: 10,
                                            ),
                                            Text(
                                              'Change Spot',
                                              style: TextStyle(
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Map()));
                                      },
                                      splashColor: Colors.black38,
                                      highlightColor: Colors.black12,
                                    ),
                                  ),
                                  Container(
                                    child: FlatButton(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width-50,
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.remove_circle_outline,
                                              color: Colors.redAccent,
                                            ),
                                            Container(
                                              width: 10,
                                            ),
                                            Text(
                                              'Remove Spot',
                                              style: TextStyle(
                                                color: Colors.redAccent,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.warning,
                                                    color: Colors.red,
                                                  ),
                                                  Text(
                                                    ' Alert',
                                                    style: TextStyle(
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              content: Text('Are You Sure You Want to Remove Your Reservation'),
                                              actions: <Widget>[
                                                FlatButton(
                                                  child: Text('No'),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                FlatButton(
                                                  child: Text('Yes'),
                                                  onPressed: () {
                                                    FirebaseFirestore.instance.collection('spots').doc(currentStudent['spotuid']).delete();
                                                    FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).update({
                                                      'spotuid': 'none'
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      splashColor: Color.fromRGBO(239, 154, 154, 1),
                                      highlightColor: Color.fromRGBO(255, 205, 210, 1),
                                    ),
                                  ),
                                ],
                              );
                            }
                          }
                        },
                      );
                    }
                  }
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: 10,
              ),
              Container(
                child: FlatButton(
                  child: Container(
                    width: MediaQuery.of(context).size.width-50,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.red,
                        ),
                        Container(
                          width: 10,
                        ),
                        Text(
                          'Sign Out',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    GoogleSignIn().signOut();
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Signin()),ModalRoute.withName('/pages'));
                  },
                  splashColor: Color.fromRGBO(239, 154, 154, 1),
                  highlightColor: Color.fromRGBO(255, 205, 210, 1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
