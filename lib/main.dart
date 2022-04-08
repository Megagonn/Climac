import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/ui/home.dart';
import 'package:weather/ui/login.dart';
import 'package:weather/ui/signup.dart';
import 'package:weather/ui/ui.dart';

var firstTimer = true;
var isLoggedIn = true;
isFirstTime() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var firstTime = pref.getString("signup") ?? '';
  var result = jsonDecode(firstTime);
  isLoggedIn = result['loggedin'];
  if (firstTime.isNotEmpty) {
    firstTimer = false;
  }
  return firstTimer;
}

void main() {
  isFirstTime();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Climac',
      home: firstTimer ? const Onboarding() : isLoggedIn ? const Home() : Login(),
      // SignUp(),
      // Login(),
      // const Home(),
    );
  }
}
