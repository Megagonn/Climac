import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/color.dart';
import 'package:weather/ui/home.dart';
import 'package:weather/ui/login.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _key = GlobalKey<FormState>();
  bool signup() {
    return _key.currentState!.validate();
  }

  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController _textEditingController = TextEditingController();

  final TextEditingController locusController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool obscural = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                // height: 470,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: primary, blurRadius: 1, spreadRadius: 2),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sign Up",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: primary,
                        )),
                    Divider(
                      color: grey,
                      thickness: 2,
                    ),
                    Form(
                      key: _key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextFormField(
                              validator: (val) {
                                return val.toString().isEmpty
                                    ? "Please fill in your username"
                                    : null;
                              },
                              cursorColor: primary,
                              controller: textEditingController,
                              decoration: InputDecoration(
                                labelText: 'Username',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextFormField(
                              validator: (val) {
                                return val.toString().isEmpty
                                    ? "Please fill in your password"
                                    : val.toString().length < 5
                                        ? "Password must be atleast 5 characters long"
                                        : null;
                              },
                              obscureText: obscural,
                              cursorColor: primary,
                              controller: _textEditingController,
                              decoration: InputDecoration(
                                suffixIcon: obscural
                                    ? IconButton(
                                        onPressed: () {
                                          obscural = false;
                                          setState(() {});
                                        },
                                        icon: const Icon(
                                            Icons.remove_red_eye_outlined))
                                    : IconButton(
                                        onPressed: () {
                                          obscural = true;
                                          setState(() {});
                                        },
                                        icon: const Icon(Icons.close)),
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextFormField(
                              validator: (val) {
                                return val.toString().isEmpty
                                    ? "Please fill in your location"
                                    : null;
                              },
                              cursorColor: primary,
                              controller: locusController,
                              decoration: InputDecoration(
                                labelText: 'Current Location',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextFormField(
                              validator: (val) {
                                var regexp = RegExp(
                                    r"^[a-z0-9A-Z]{2,}@[a-z]{3,}\.[a-z]{2,}$");
                                return regexp.hasMatch(val!)
                                    ? null
                                    : "Please fill in a valid email address";
                              },
                              cursorColor: primary,
                              controller: emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Container(
                              width: 200,
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xFF6151C3),
                              ),
                              child: TextButton(
                                onPressed: () async {
                                  signup();
                                  if (signup()) {
                                    var data = {
                                      "username": textEditingController.text,
                                      "password": _textEditingController.text,
                                      "location": locusController.text,
                                      "email": emailController.text,
                                      "loggedin": true,
                                    };
                                    SharedPreferences pref =
                                        await SharedPreferences.getInstance();
                                    await pref.setString(
                                        "signup", jsonEncode(data));
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const Home()));
                                  }
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: primary,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()));
                                },
                                child: const Text("Log in"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
