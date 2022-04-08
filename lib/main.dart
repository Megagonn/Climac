import 'package:flutter/material.dart';
import 'package:weather/ui/home.dart';
import 'package:weather/ui/login.dart';
import 'package:weather/ui/signup.dart';
import 'package:weather/ui/ui.dart';
void main() {
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
      // theme: Theme.of(context),
      // ThemeData(
      //   primarySwatch: Colors.blueGrey,
      // ),
      home: Onboarding(),
      // SignUp(),
      // Login(),
      // const Home(),
    );
  }
}

