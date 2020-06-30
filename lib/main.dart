import 'package:crhs_parking_app/pages/confirm_page.dart';
import 'package:crhs_parking_app/pages/information_submission.dart';
import 'package:crhs_parking_app/splash/splash.dart';
import 'package:flutter/material.dart';
import 'pages/map.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'login/google_sign_in.dart';

void main() => runApp(
  MaterialApp(
    home: Splash(),
    debugShowCheckedModeBanner: false,
  )
);

