import 'package:crhs_parking_app/pages/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 240, 250, 1),
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              Container(
                height: 50,
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 20,
                  ),
                  Image.asset(
                    'assets/crhs.png',
                    width: 70,
                    height: 70,
                  ),
                ],
              ),
              Container(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 20,
                  ),
                  Container(
                    child: Text('Welcome',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 20,
                  ),
                  Container(
                    child: Text('Sign in to continue',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.black87,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 180,
              ),
              Container(
                width: 250,
                child: MaterialButton(
                  padding: EdgeInsets.all(0),
                  child: Image.asset('assets/google_signin.png'),
                  onPressed: () async {
                    await authService.googleSignIn();
                    String uid;
                    String email;
                    await FirebaseAuth.instance.currentUser().then((currentUser) {
                      uid = currentUser.uid;
                      email = currentUser.email;
                    });
                    DocumentSnapshot userDoc = await Firestore.instance.collection('users').document(uid).get();
                    if(email.endsWith('@students.katyisd.org')){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Navigation()),ModalRoute.withName('/login'));
                    }
                    else {
                      print('invalid account');
                      FirebaseAuth.instance.signOut();
                      authService.signOut();
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Error'),
                              content: Text('Use your KatyISD Google Account'),
                            );
                          }
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ],
        scrollDirection: Axis.vertical,
      ),
    );
  }
}

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  Map<String,dynamic> _profile;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    authService.profile.listen((state) => setState(() => _profile = state));
    
    authService.loading.listen((state) => setState(() => _loading = state));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(_profile.toString()),
    );
  }
}