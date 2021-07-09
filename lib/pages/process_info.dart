import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'change_info.dart';

late DateTime birth;
late DateTime licenseExpiration;
late DateTime insuranceExpiration;
bool payCash = true;

late String firstSave;
late String lastSave;
late String gradeSave;
late String idSave;
late String addressSave;
late String zipSave;
late String phoneSave;
late String modelSave;
late String colorSave;
late String yearSave;
late String plateSave;
late String driverSave;

class Process extends StatefulWidget {
  @override
  _ProcessState createState() => _ProcessState();
}

class _ProcessState extends State<Process> {

  late User currentStudent;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get(),
      builder: (context, currentStudent) {
        if(currentStudent.hasData) {
          return FutureBuilder(
            future: FirebaseFirestore.instance.collection('spots').doc((currentStudent.data as DocumentSnapshot)['spotuid']).get(),
            builder: (context, snapshots) {
              DocumentSnapshot spotDoc = snapshots.data as DocumentSnapshot;
              if(snapshots.hasData) {
                birth = spotDoc['birth'].toDate();
                licenseExpiration = spotDoc['licenseExpiration'].toDate();
                insuranceExpiration = spotDoc['insuranceExpiration'].toDate();
                payCash = spotDoc['isCash'];

                firstSave = spotDoc['first'];
                lastSave = spotDoc['last'];
                gradeSave = spotDoc['grade'].toString();
                idSave = spotDoc['schoolID'];
                addressSave = spotDoc['address'];
                zipSave = spotDoc['zipCode'];
                phoneSave = spotDoc['phone'];
                modelSave = spotDoc['model'];
                colorSave = spotDoc['color'];
                yearSave = spotDoc['year'].toString();
                plateSave = spotDoc['licensePlate'];
                driverSave = spotDoc['driverLicenseNumber'];
                return InfoChange();
              }
              else {
                return Scaffold(
                  body: Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              }
            },
          );
        }
        else {
          return Scaffold(
            body: Center(
              child: Container(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}
