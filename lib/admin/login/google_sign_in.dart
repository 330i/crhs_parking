import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crhs_parking_app/admin/pages/navigation.dart';
import 'package:crhs_parking_app/login/google_sign_in.dart';

class AdminSignin extends StatefulWidget {
  @override
  _AdminSigninState createState() => _AdminSigninState();
}

class _AdminSigninState extends State<AdminSignin> {

  TextEditingController keyController = new TextEditingController();

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
                    child: Text('KatyISD Staff Account Required',
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
                    GoogleSignIn().signIn().then((value) async {
                      final GoogleSignInAuthentication googleSignInAuthentication = await value!.authentication;
                      final AuthCredential credential = GoogleAuthProvider.credential(
                        accessToken: googleSignInAuthentication.accessToken,
                        idToken: googleSignInAuthentication.idToken,
                      );

                      try {
                        final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
                      } on FirebaseAuthException catch (e) {
                        print('error: cannot sign in');
                      }

                      late String email;
                      if(FirebaseAuth.instance.currentUser!=null) {
                        email = FirebaseAuth.instance.currentUser!.email!;
                      }
                      if(email!=null) {
                        if((email.endsWith('@katyisd.org')||email=='k0910022@students.katyisd.org')&&FirebaseAuth.instance.currentUser!=null){
                          Navigator.of(context).pushAndRemoveUntil(CupertinoPageRoute(builder: (context) => Navigation()),ModalRoute.withName('/login'));
                        }
                        else {
                          if(!(email.endsWith('@katyisd.org')||email=='k0910022@students.katyisd.org')) {
                            print('invalid account');
                            FirebaseAuth.instance.signOut();
                            FirebaseAuth.instance.signOut();
                            GoogleSignIn().signOut();
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
                          else {
                            FirebaseAuth.instance.signOut();
                            GoogleSignIn().signOut();
                            showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Stop'),
                                    content: Text('Unauthorized'),
                                  );
                                }
                            );
                          }
                        }
                      }
                      else if(FirebaseAuth.instance.currentUser==null) {
                        FirebaseAuth.instance.signOut();
                        GoogleSignIn().signOut();
                        showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Stop'),
                                content: Text('Unauthorized'),
                              );
                            }
                        );
                      }

                      verifyAccount();

                      await FirebaseFirestore.instance.collection('admin').doc(FirebaseAuth.instance.currentUser!.uid).update({
                        'uid': FirebaseAuth.instance.currentUser!.uid,
                        'email': FirebaseAuth.instance.currentUser!.email,
                        'displayName': FirebaseAuth.instance.currentUser!.displayName,
                        'signDate': DateTime.now(),
                        'key': keyController.text,
                        'emailProvider': FirebaseAuth.instance.currentUser!.email!.substring(FirebaseAuth.instance.currentUser!.email!.indexOf('@'))
                      }).catchError((onError) {
                        print('denied');
                        FirebaseAuth.instance.signOut();
                        GoogleSignIn().signOut();
                      }).then((value) {
                        Navigator.of(context).pushAndRemoveUntil(CupertinoPageRoute(builder: (context) => Navigation()),ModalRoute.withName('/login'));
                      });
                    }).catchError((onError) {
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Error'),
                              content: Text('Cannot Sign in with Google'),
                            );
                          }
                      );
                    });
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

  verifyAccount() {
    late String email;
    if(FirebaseAuth.instance.currentUser!=null) {
      email = FirebaseAuth.instance.currentUser!.email!;
    }
    if(email!=null) {
      if((email.endsWith('@katyisd.org')||email=='k0910022@students.katyisd.org')&&FirebaseAuth.instance.currentUser!=null){
        Navigator.of(context).pushAndRemoveUntil(CupertinoPageRoute(builder: (context) => Navigation()),ModalRoute.withName('/login'));
      }
      else {
        if(!(email.endsWith('@katyisd.org')||email=='k0910022@students.katyisd.org')) {
          print('invalid account');
          FirebaseAuth.instance.signOut();
          GoogleSignIn().signOut();
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
        else {
          FirebaseAuth.instance.signOut();
          GoogleSignIn().signOut();
          showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Stop'),
                  content: Text('Unauthorized'),
                );
              }
          );
        }
      }
    }
    else if(FirebaseAuth.instance.currentUser==null) {
      FirebaseAuth.instance.signOut();
      GoogleSignIn().signOut();
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Stop'),
              content: Text('Unauthorized'),
            );
          }
      );
    }
  }
}