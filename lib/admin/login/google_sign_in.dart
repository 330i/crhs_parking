import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crhs_parking_app/admin/pages/navigation.dart';
import 'package:crhs_parking_app/login/google_sign_in.dart';

class AdminSignin extends StatefulWidget {
  @override
  _AdminSigninState createState() => _AdminSigninState();
}

class _AdminSigninState extends State<AdminSignin> {

  TextEditingController keyController = new TextEditingController(text: key);

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
                    'assets/adminlogo.png',
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
                height: 2,
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 20,
                  ),
                  Container(
                    child: Text('KatyISD Account Required',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black87,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 140,
              ),
              Container(
                width: 250,
                child: TextField(
                  controller: keyController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Enter Key Here',
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Container(
                height: 10,
              ),
              Container(
                width: 250,
                child: MaterialButton(
                  padding: EdgeInsets.all(0),
                  child: Image.asset('assets/google_signin.png'),
                  onPressed: () async {
                    key = keyController.text;
                    await adminAuthService.googleSignIn();
                    String uid;
                    String email;
                    await FirebaseAuth.instance.currentUser().then((currentUser) {
                      uid = currentUser.uid;
                      email = currentUser.email;
                    });
                    DocumentSnapshot userDoc = await Firestore.instance.collection('users').document(uid).get();
                    if(true){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Navigation()),ModalRoute.withName('/login'));
                    }
                    else {
                      print('invalid account');
                      FirebaseAuth.instance.signOut();
                      adminAuthService.signOut();
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

class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  Map<String,dynamic> _profile;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    adminAuthService.profile.listen((state) => setState(() => _profile = state));
    
    adminAuthService.loading.listen((state) => setState(() => _loading = state));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(_profile.toString()),
    );
  }
}