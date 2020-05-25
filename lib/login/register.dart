import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:crhs_parking_app/login/login.dart';
import 'package:flutter/services.dart';
import 'package:validators/validators.dart';
import 'package:crhs_parking_app/pages/alert.dart';

final fNameController = new TextEditingController();
final lNameController = new TextEditingController();
final idController = new TextEditingController();
final passController = new TextEditingController();

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Register extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(

      home: MyHomePage(title: 'Register'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {

  Color _med = Color.fromRGBO(163, 2, 52, 1);
  Color _dark = Color.fromRGBO(109, 0, 15, 1);

  @override
  Widget build(BuildContext context) {



    void submitInfo(){
      setState(() {
        FirebaseAuth.instance.createUserWithEmailAndPassword(email: idController.text.substring(0,1).toUpperCase()+idController.text.substring(1)+'@students.katyisd.org', password: passController.text.substring(0,4).toLowerCase()+passController.text.substring(4));
        FirebaseAuth.instance.signInWithEmailAndPassword(email: "${idController.text}@students.katyisd.org", password: passController.text).toString();
        Firestore.instance.collection('user').document(idController.text.substring(0,1).toUpperCase()+idController.text.substring(1)).setData({
          "lName":lNameController.text.substring(0,1).toUpperCase()+lNameController.text.substring(1).toLowerCase(),
          "fName":fNameController.text.substring(0,1).toUpperCase()+fNameController.text.substring(1).toLowerCase(),
          "id":idController.text.substring(0,1).toUpperCase()+idController.text.substring(1),
          "spot":{"Confirmed":false, "due":0.00, "insurance":false,"licence":false,"spot":null}
        });
      });
    }
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 43, 1),
      body: ListView(
        children: [
          Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 20),
              child: Text('Register',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Container(
              width: 350,
              child: TextField(
                controller: fNameController,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
                decoration: InputDecoration(
                  hintText: "First Name",
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                  ),
                  enabledBorder: new UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: new UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 40,
            ),
            Container(
              width: 350,
              child: TextField(
                controller: lNameController,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
                decoration: InputDecoration(
                  hintText: "Last Name",
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                  ),
                  enabledBorder: new UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: new UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 40,
            ),
            Container(
              width: 350,
              child: TextField(
                controller: idController,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
                decoration: InputDecoration(
                  hintText: "School ID",
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                  ),
                  enabledBorder: new UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: new UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 40,
            ),
            Container(
              width: 350,
              child: TextField(
                controller: passController,
                obscureText: true,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                  ),
                  enabledBorder: new UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: new UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              height: 50.0,
              width: 300.0,
              decoration: BoxDecoration(
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black, blurRadius: 4, offset: Offset(0, 2)),
                ],
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [_med, _dark],
                    tileMode: TileMode.repeated,
                  ),
                ),
                child: InkWell(
                  child: Center(
                    child: Text("Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  onTap: () {
                    if(lNameController.text.length > 0 &&
                        fNameController.text.length > 0 &&
                        idController.text.length > 0 &&
                        passController.text.length > 0 &&
                        isAlpha(fNameController.text) &&
                        isAlpha(lNameController.text) &&
                        isAlpha(idController.text.substring(0,1)) &&
                        isNumeric(idController.text.substring(1)) &&
                        isAlpha(passController.text.substring(0,4)) &&
                        isNumeric(passController.text.substring(4))
                    ) {
                      submitInfo();
                      lNameController.clear();
                      fNameController.clear();
                      idController.clear();
                      passController.clear();
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()));
                      print('submit');
                    }
                    else{
                      print('invalid input');
                      AlertMessage alert = AlertMessage('Error', 'Invalid Input', 'Close');
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert.build(context);
                        }
                      );
                      fNameController.clear();
                      lNameController.clear();
                      idController.clear();
                      passController.clear();
                    }
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              height: 25.0,
              width: 120.0,
              child: Container(
                child: InkWell(
                  splashColor: Color.fromRGBO(0, 0, 43, 1),
                  highlightColor: Color.fromRGBO(0, 0, 43, 1),
                  child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 20,
                            fontWeight: FontWeight.w300
                        ),
                      )),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()));
                    },
                ),
              ),
            ),
        ],
    ),],
      scrollDirection: Axis.vertical,
      ),
    );
  }
}