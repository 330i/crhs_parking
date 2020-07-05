import 'package:crhs_parking_app/login/google_sign_in.dart';
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
                          Icons.exit_to_app,
                          color: Colors.redAccent,
                        ),
                        Container(
                          width: 10,
                        ),
                        Text(
                          'Sign Out',
                          style: TextStyle(
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    authService.signOut();
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
