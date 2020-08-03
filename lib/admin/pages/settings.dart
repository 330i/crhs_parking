import 'package:crhs_parking_app/login/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:crhs_parking_app/admin/login/auth.dart';
import 'package:crhs_parking_app/admin/login/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';

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
                    adminAuthService.signOut();
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => AdminSignin()),ModalRoute.withName('/pages'));
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