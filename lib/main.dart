import 'package:flutter/material.dart';
import 'package:weather/ui/home.dart';
import 'package:weather/ui/login.dart';
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
      home: Login(),
      // const Home(),
    );
  }
}

