import 'package:crhs_parking_app/login/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:crhs_parking_app/login/auth.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FlatButton(
            child: Text('Sign Out'),
            onPressed: () {
              authService.signOut();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Signin()),ModalRoute.withName('/pages'));
            },
          ),
        ],
      ),
    );
  }
}
