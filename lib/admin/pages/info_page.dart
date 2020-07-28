import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SpotInfo extends StatefulWidget {
  DocumentSnapshot reference;
  SpotInfo(this.reference);

  @override
  _SpotInfoState createState() => _SpotInfoState();
}

class _SpotInfoState extends State<SpotInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: <Widget>[
            Container(
              width: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width-20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: (10*log(MediaQuery.of(context).size.width+5)-7)/64*40,
                  ),
                  Text(
                    '${widget.reference.data['first']} ${widget.reference.data['last']}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: (10*log(MediaQuery.of(context).size.width+5)-7)/64*60,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Spot ${widget.reference.data['spot']}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: (10*log(MediaQuery.of(context).size.width+5)-7)/64*40,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Paying With ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: (10*log(MediaQuery.of(context).size.width+5)-7)/64*30,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '${widget.reference.data['isCash'] ? 'Cash' : 'Check'}',
                        style: TextStyle(
                          color: widget.reference.data['isCash'] ? Colors.green : Colors.blue,
                          fontSize: (10*log(MediaQuery.of(context).size.width+5)-7)/64*30,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: (10*log(MediaQuery.of(context).size.width+5)-7)/64*15),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      size: (10*log(MediaQuery.of(context).size.width+5)-7)/64*50,
                                    ),
                                    Container(
                                      width: (10*log(MediaQuery.of(context).size.width+5)-7)/64*10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Personal Information',
                                        style: TextStyle(
                                            fontSize: (10*log(MediaQuery.of(context).size.width+5)-7)/64*30,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: (10*log(MediaQuery.of(context).size.width+5)-7)/64*8,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          height: (10*log(MediaQuery.of(context).size.width+5)-7)/64*10,
                                        ),
                                        StudentInfo('Student ID: ${widget.reference.data['schoolID']}'),
                                        StudentInfo('Grade: ${widget.reference.data['grade']}'),
                                        StudentInfo('Birth Date: ${widget.reference.data['birth'].toDate().month}/${widget.reference.data['birth'].toDate().day}/${widget.reference.data['birth'].toDate().year}'),
                                        StudentInfo('Address: ${widget.reference.data['address']}'),
                                        StudentInfo('Zip Code: ${widget.reference.data['zipCode']}'),
                                        StudentInfo('Phone Number: (${widget.reference.data['phone'].substring(0,3)}) ${widget.reference.data['phone'].substring(3,6)}-${widget.reference.data['phone'].substring(6)}'),
                                      ],
                                    ),
                                    Spacer(
                                      flex: 1,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: [
                                    Icon(
                                      Icons.directions_car,
                                      size: (10*log(MediaQuery.of(context).size.width+5)-7)/64*50,
                                    ),
                                    Container(
                                      width: (10*log(MediaQuery.of(context).size.width+5)-7)/64*10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Vehicle and Road Traffic Identification',
                                        style: TextStyle(
                                            fontSize: (10*log(MediaQuery.of(context).size.width+5)-7)/64*30,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: (10*log(MediaQuery.of(context).size.width+5)-7)/64*8,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          height: (10*log(MediaQuery.of(context).size.width+5)-7)/64*10,
                                        ),
                                        StudentInfo('Make/Model: ${widget.reference.data['model']}'),
                                        StudentInfo('Color: ${widget.reference.data['color']}'),
                                        StudentInfo('Year: ${widget.reference.data['year']}'),
                                        StudentInfo('License Plate Number: ${widget.reference.data['licensePlate']}'),
                                        StudentInfo('Driver\'s License Number: ${widget.reference.data['driverLicenseNumber']}'),
                                        StudentInfo('Driver\'s License Expiration: ${widget.reference.data['licenseExpiration'].toDate().month}/${widget.reference.data['licenseExpiration'].toDate().day}/${widget.reference.data['licenseExpiration'].toDate().year}'),
                                        StudentInfo('Insurance Expiration: ${widget.reference.data['insuranceExpiration'].toDate().month}/${widget.reference.data['insuranceExpiration'].toDate().day}/${widget.reference.data['insuranceExpiration'].toDate().year}'),
                                      ],
                                    ),
                                    Spacer(
                                      flex: 1,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: (10*log(MediaQuery.of(context).size.width+5)-7)/64*13,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: <Widget>[
                              Spacer(
                                flex: 1,
                              ),
                              Container(
                                width: 200,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.greenAccent,
                                ),
                                child: InkWell(
                                  child: Center(
                                    child: Text(
                                      'Confirm',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  onTap: () async {
                                    Firestore.instance.collection('spots').document(widget.reference.documentID).setData({
                                      'confirmed': true,
                                    }, merge: true);
                                    FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
                                    Firestore.instance.collection('admin').document(currentUser.uid).collection('history').document().setData({
                                      'time': DateTime.now(),
                                      'documentID': widget.reference.documentID,
                                      'action': 'confirm',
                                    }, merge: true);
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: Text('User Has Been Confirmed'),
                                        );
                                      }
                                    );
                                  },
                                ),
                              ),
                              Spacer(
                                flex: 1,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget StudentInfo(String info) {
    return Column(
      children: <Widget>[
        Text(
          info,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400
          ),
        ),
        Container(
          height: 7,
        ),
      ],
    );
  }
}
