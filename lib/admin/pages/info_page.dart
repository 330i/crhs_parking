import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            Container(
              width: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width-10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${widget.reference['first']} ${widget.reference['last']}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: (10*log(MediaQuery.of(context).size.width+5)-7)/64*60,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Spot ${widget.reference['spot']}',
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
                        '${widget.reference['isCash'] ? 'Cash' : 'Check'}',
                        style: TextStyle(
                          color: widget.reference['isCash'] ? Colors.green : Colors.blue,
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
                                        StudentInfo('Student ID: ${widget.reference['schoolID']}'),
                                        StudentInfo('Grade: ${widget.reference['grade']}'),
                                        StudentInfo('Birth Date: ${widget.reference['birth'].toDate().month}/${widget.reference['birth'].toDate().day}/${widget.reference['birth'].toDate().year}'),
                                        StudentInfo('Address: ${widget.reference['address']}'),
                                        StudentInfo('Zip Code: ${widget.reference['zipCode']}'),
                                        StudentInfo('Phone Number: (${widget.reference['phone'].substring(0,3)}) ${widget.reference['phone'].substring(3,6)}-${widget.reference['phone'].substring(6)}'),
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
                                        StudentInfo('Make/Model: ${widget.reference['model']}'),
                                        StudentInfo('Color: ${widget.reference['color']}'),
                                        StudentInfo('Year: ${widget.reference['year']}'),
                                        StudentInfo('License Plate Number: ${widget.reference['licensePlate']}'),
                                        StudentInfo('Driver\'s License Number: ${widget.reference['driverLicenseNumber']}'),
                                        StudentInfo('Driver\'s License Expiration: ${widget.reference['licenseExpiration'].toDate().month}/${widget.reference['licenseExpiration'].toDate().day}/${widget.reference['licenseExpiration'].toDate().year}'),
                                        StudentInfo('Insurance Expiration: ${widget.reference['insuranceExpiration'].toDate().month}/${widget.reference['insuranceExpiration'].toDate().day}/${widget.reference['insuranceExpiration'].toDate().year}'),
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
                      ],
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
                              FirebaseFirestore.instance.collection('spots').doc(widget.reference.id).update({
                                'confirmed': true,
                              });
                              FirebaseFirestore.instance.collection('admin').doc(FirebaseAuth.instance.currentUser!.uid).collection('history').doc('${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}${DateTime.now().second}${DateTime.now().millisecond}').update({
                                'time': DateTime.now(),
                                'documentID': widget.reference.id,
                                'action': 'confirm',
                              });
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
                    height: 25,
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
        Container(
          width: MediaQuery.of(context).size.width-20,
          child: Text(
            info,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400
            ),
            maxLines: 2,
          ),
        ),
        Container(
          height: 7,
        ),
      ],
    );
  }
}
