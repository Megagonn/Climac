import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/color.dart';
import 'package:weather/ui/home.dart';
import 'package:weather/ui/signup.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController _textEditingController = TextEditingController();

  final _key = GlobalKey<FormState>();
  bool signin() {
    return _key.currentState!.validate();
  }

  bool obscural = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: Container(
              height: 330,
              padding: const EdgeInsets.all(25),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFF6151C3),
                        blurRadius: 1,
                        spreadRadius: 2)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  const Divider(
                    color: Color(0xFF6151C3),
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
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      width: 200,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xFF6151C3),
                      ),
                      child: TextButton(
                          onPressed: () async {
                            signin();
                            if (signin()) {
                              // var data = {
                              //   "username": textEditingController.text,
                              //   "password": _textEditingController.text,
                              // };
                              SharedPreferences pref =
                                  await SharedPreferences.getInstance();
                              var result = jsonDecode(pref.getString(
                                "signup",
                              )!);
                              if (result['username'] == textEditingController.text &&
                                  result['password'] ==
                                      _textEditingController.text) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Home()));
                              }
                            }
                          },
                          child: const Text("Login")),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
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
                                  builder: (context) => SignUp()));
                        },
                        child: const Text("Sign Up"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}