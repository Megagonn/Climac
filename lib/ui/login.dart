import 'package:flutter/material.dart';
import 'package:weather/color.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController textEditingController = TextEditingController();

  final TextEditingController _textEditingController = TextEditingController();

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
              height: 300,
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
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
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
                    child: TextField(
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
                                icon: const Icon(Icons.remove_red_eye_outlined))
                            : IconButton(
                                onPressed: () {
                                  obscural = true;
                                  setState(() {
                                    
                                  });
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
                  Center(
                    child: Container(
                      width: 200,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xFF6151C3),
                      ),
                      child: TextButton(onPressed: () {}, child: const Text("Login")),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
