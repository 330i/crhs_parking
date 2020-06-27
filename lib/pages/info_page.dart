import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:crhs_parking_app/models/user.dart';

class InfoPage extends StatefulWidget {

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Hi'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.local_parking),
      ),
    );
  }
}
