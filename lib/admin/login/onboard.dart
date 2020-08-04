import 'package:crhs_parking_app/admin/login/auth.dart';
import 'package:crhs_parking_app/animations/FadeAnimationStatic.dart';
import 'package:crhs_parking_app/login/google_sign_in.dart';
import 'package:crhs_parking_app/login/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:crhs_parking_app/animations/FadeAnimationUp.dart';

class DontDoIt extends StatefulWidget {
  @override
  _DontDoItState createState() => _DontDoItState();
}

class _DontDoItState extends State<DontDoIt> {
  @override
  Widget build(BuildContext context) {
    authService.signOut();
    adminAuthService.signOut();
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Spacer(
              flex: 2,
            ),
            Container(
              height: MediaQuery.of(context).size.height-150,
              child: AspectRatio(
                aspectRatio: 9/12,
                child: Container(
                  child: ListView(
                    children: <Widget>[
                      FadeAnimationStatic(
                        1,
                        Icon(
                          Icons.warning,
                          size: 80,
                          color: Colors.redAccent,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Spacer(
                            flex: 1,
                          ),
                          FadeAnimationStatic(
                            1,
                            Text(
                              'User Agreement',
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                        ],
                      ),
                      Container(
                        height: 33,
                      ),
                      Container(
                        child: Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width-40,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FadeAnimationUp(
                                  1.2,
                                  Text(
                                    'I understand that only authorized individuals are allowed to log into the app and will not do unauthorized acts including distributing the app to unauthorized individuals and allowing unauthorized individuals to utilize the app.',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  height: 20,
                                ),
                                FadeAnimationUp(
                                  1.4,
                                  Text(
                                    'I understand that unauthorized acts against the app could possibly result in legal/corporate action against me.',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      Container(
                        child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width-40,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  FadeAnimationUp(
                                    1.6,
                                    Text(
                                      'I understand that if any malicious activity is detected in the Parking Database, the server could possibly go on lock down with history on the database searched. School Administrators will immediately be alerted after the following incident.',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                  ),
                                  FadeAnimationUp(
                                    1.8,
                                    Text(
                                      'I understand that my name and ID registered to the KatyISD Database is also stored on the Parking Database ',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                    ],
                    scrollDirection: Axis.vertical,
                  ),
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            FadeAnimationStatic(
              3,
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    Spacer(
                      flex: 1,
                    ),
                    Container(
                      width: 250,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.redAccent,
                      ),
                      child: InkWell(
                        child: Center(
                          child: Text(
                            'Accept',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Signin()),ModalRoute.withName('/login'));
                        },
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ),
            ),
            Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
