import 'dart:math';
import 'dart:ui';
import 'dart:async';

import 'package:crhs_parking_app/login/data_set.dart';
import 'package:crhs_parking_app/login/register.dart';
import 'package:crhs_parking_app/pages/info_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validators/validators.dart';
import 'package:crhs_parking_app/pages/alert.dart';

final _id = new TextEditingController();
final _password =  new TextEditingController();
String idSubmit;

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
  _LoginPageState createState() => _LoginPageState();
}

class Login extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(

      home: MyHomePage(title: 'Login'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _LoginPageState extends State<MyHomePage> {

  Color _med = Color.fromRGBO(163, 2, 52, 1);
  Color _dark = Color.fromRGBO(109, 0, 15, 1);
  bool _idExist = true;
  bool _passExist = true;

  var list;

  Future<Null> refreshApp() async {
    GlobalKey<RefreshIndicatorState>().currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 0));

    setState(() {
      list = List.generate(Random().nextInt(10), (i) => "Item $i");
    });

    return null;
  }

  @override
  Widget build(BuildContext context) {

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
                height: 50,
              ),
              Container(
                child: Hero(
                  tag: 'logo',
                  child: Image.asset(
                    'assets/crhs.png',
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
              Container(
                child: Text('Login',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Container(
                height: 50,
              ),
              AnimatedCrossFade(
                duration: Duration(milliseconds: 400),
                crossFadeState: _idExist ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                firstChild: Container(
                  width: 350,
                  child: TextField(
                    controller: _id,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                    decoration: InputDecoration(
                      hintText: 'School ID',
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
                secondChild: Container(
                  width: 350,
                  child: TextField(
                    controller: _id,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                    decoration: InputDecoration(
                      hintText: 'School ID Required',
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(176, 0, 32, 1),
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
              ),
              Container(
                height: 20,
              ),
              AnimatedCrossFade(
                duration: Duration(milliseconds: 400),
                crossFadeState: _passExist ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                firstChild: Container(
                  width: 350,
                  child: TextField(
                    controller: _password,
                    textAlign: TextAlign.left,
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Password',
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
                secondChild: Container(
                  width: 350,
                  child: TextField(
                    controller: _password,
                    textAlign: TextAlign.left,
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Password Required',
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(176, 0, 32, 1),
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
                      child: Text("Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    onTap: () async {
                      if(_id.text.length == 0){
                        _idExist = false;
                        print('no id');
                      }
                      if(_password.text.length == 0){
                        _passExist = false;
                        print('no password');
                      }
                      if(_id.text.length > 0 &&
                          _password.text.length > 0 &&
                          isAlpha(_id.text.substring(0,1)) &&
                          isNumeric(_id.text.substring(1)) &&
                          isAlpha(_password.text.substring(0,4)) &&
                          isNumeric(_password.text.substring(4))
                      ) {
                        idSubmit = _id.text.substring(0,1).toUpperCase()+_id.text.substring(1);
                        DatabaseService data = new DatabaseService(idSubmit);
                        bool passCheck = await data.handleSignInEmail(idSubmit, _password.text.substring(0,4).toLowerCase()+_password.text.substring(4));
                        if(passCheck == true){
                          //welcome page route goes here
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => InfoPage()),ModalRoute.withName('/login'));
                          print('Signed in '+idSubmit);
                        }
                        else{
                          print('wrong email or password');
                          AlertMessage alert = AlertMessage('Error', 'Wrong Email/Password', 'Close');
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert.build(context);
                              }
                          );
                          _id.clear();
                          _password.clear();
                        }
                      }
                      else{
                        print('invalid input');
                        AlertMessage alert = AlertMessage('Error', 'Wrong Email/Password', 'Close');
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert.build(context);
                            }
                        );
                        _id.clear();
                        _password.clear();
                      }
                      refreshApp();
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
                          "Register",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.w300
                          ),
                        )),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                  ),
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