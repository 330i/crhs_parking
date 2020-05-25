import 'dart:async';
import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:validators/sanitizers.dart';
import 'package:validators/validators.dart';

class DatabaseService {
  String _id;
  final CollectionReference dataCollection = Firestore.instance.collection('user');

  DatabaseService(id) {
    _id = id;
  }

  Future<bool> handleSignInEmail(String id, String password) async {

    AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: id.substring(0,1).toUpperCase()+id.substring(1)+'@students.katyisd.org', password: password.substring(0,4).toLowerCase()+password.substring(4));
    final FirebaseUser user = result.user;

    assert(user != null);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
    assert(user.uid == currentUser.uid);

    print('signInEmail succeeded: $user');

    return true;

  }



  getData(String data, double textSize) {
    return new Material(
        child: StreamBuilder(
            stream: Firestore.instance.collection('user').document(_id).snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return new Text("", style: TextStyle(color: Colors.grey, fontSize: textSize),);
              }
              var userDocument = snapshot.data;
              String doc = userDocument[data];
              if(userDocument[data] == null){
                doc = 'N/A';
              }
              return new Text(doc, style: TextStyle(color: Colors.black, fontSize: textSize));
            }
        )
    );
  }

  getDataMapBool(String map, String data, double logoSize, Color color) {
    return new Material(
        child: StreamBuilder(
            stream: Firestore.instance.collection('user').document(_id).snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return new Text("", style: TextStyle(color: Colors.grey, fontSize: logoSize),);
              }
              var userDocument = snapshot.data;
              String doc;
              if(userDocument[map][data] == true){
                doc = 'assets/${data}_yes.png';
              }
              else{
                doc = 'assets/${data}_no.png';
              }
              return new Container(
                color: color,
                child: Image.asset(doc),
                width: logoSize,
                height: logoSize,
              );
            }
        )
    );
  }

  getDataMap(String map, String data, double textSize, Color fontColor, FontWeight fontWeight) {
    return new Material(
      color: Colors.transparent,
        child: StreamBuilder(
            stream: Firestore.instance.collection('user').document(_id).snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return new Text("", style: TextStyle(color: Colors.grey, fontSize: textSize),);
              }
              var userDocument = snapshot.data;
              String doc;
              doc = toString(userDocument[map][data]);
              if(userDocument[map][data] == null){
                doc = 'N/A';
              }
              if(equals(data, 'due')==true){
                double docM = toDouble(doc);
                doc = docM.toStringAsFixed(2).toString();
              }

              return new Text(doc, style: TextStyle(color: fontColor, fontSize: textSize, fontWeight: fontWeight),);
            }
        )
    );
  }




  Future updateSpotData(int spot, double due) async {
    await Firestore.instance.collection('spot').document(spot.toString()).setData({
      'SpotAvailable': false,
    }, merge: true);
    await dataCollection.document(_id).setData({
      'spot': {'spot': spot, 'due': due,}
    }, merge: true);
  }
}