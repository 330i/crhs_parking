import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:crhs_parking_app/login/login.dart';
import 'package:image_crop/image_crop.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key, this.title}) : super(key: key);

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

class Splash extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(

      home: SplashPage(title: 'Register'),
      debugShowCheckedModeBanner: false,
    );
  }
}



class _MyHomePageState extends State<SplashPage> with SingleTickerProviderStateMixin {

  AnimationController _animController;
  Animation<double> _animaiton;

  void initState() {
    super.initState();

    _animController = AnimationController(duration: Duration(seconds: 1),
    vsync: this);

    sleep(Duration(seconds: 3));

    _animaiton = Tween<double>(
      begin: 0,
      end: 0.2,
    ).animate(_animController)
    ..addListener(() {
      setState(() {});
    })
    ..addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Login()),ModalRoute.withName('/splash'));
      }
    });

    _animController.forward();

    new Future.delayed(
        const Duration(seconds: 2),
            () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        ));
  }

  final cropKey1 = GlobalKey<CropState>();
  final cropKey2 = GlobalKey<CropState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Crop(
              key: cropKey1,
              image: AssetImage('assets/clearimg.png'),
              aspectRatio: MediaQuery.of(context).size.width/MediaQuery.of(context).size.height,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: _animaiton.value*25,
                sigmaY: _animaiton.value*25,
              ),
              child: Container(
                color: Colors.black.withOpacity(0),
              ),
            ),
          ),
          Container(
            alignment: Alignment(0, _animaiton.value*(1)),
            child: Text(
              'Parking',
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, _animaiton.value*(5)),
                fontWeight: FontWeight.w300,
                fontSize: 50,
              ),
            ),
          ),
          Container(
            alignment: Alignment(0, _animaiton.value*(-1)),
            child: Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/crhs.png',
                width: 150,
                height: 150,
              ),
            ),
          ),
        ],
      ),
    );
  }
  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }
}