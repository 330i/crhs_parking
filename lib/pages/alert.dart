import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AlertMessage extends StatelessWidget {
  String _t;
  String _d;
  String _b;
  AlertMessage(String title, String dialog, String button) {
    _t = title;
    _d = dialog;
    _b = button;
  }
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text(_t),
      content: new Text(_d),
      actions: <Widget>[
        // usually buttons at the bottom of the dialog
        new FlatButton(
          child: new Text(_b),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

