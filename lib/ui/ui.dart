import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/color.dart';
import 'package:weather/ui/login.dart';
import 'package:weather/ui/signup.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          // decoration: const BoxDecoration(
          //   color: Color(0xFF6151C3),
          // ),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: Stack(
                    // ignore: prefer_const_literals_to_create_immutables
                    // ignore: prefer_const_constructors
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Image(
                        image: AssetImage(
                          'assets/wp.png',
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 30,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(.3),
                          radius: 20,
                          child: const Image(
                            image: NetworkImage("http://openweathermap.org/img/wn/02d@2x.png"),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 100,
                        right: 80,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(.3),
                          child: const Image(
                            image: NetworkImage("http://openweathermap.org/img/wn/10d@2x.png"),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120,
                        right: 200,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(.3),
                          child: const Image(
                            image: NetworkImage("http://openweathermap.org/img/wn/10n@2x.png"),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 122,
                        left: 135,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(.3),
                          child: const Image(
                            image: NetworkImage("http://openweathermap.org/img/wn/13n@2x.png"),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 145,
                        right: 67,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(.3),
                          child: const Image(
                            image: NetworkImage("http://openweathermap.org/img/wn/11d@2x.png"),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 290,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(.3),
                          child: const Image(
                            image: NetworkImage("http://openweathermap.org/img/wn/01d@2x.png"),
                          ),
                        ),
                      ),
                      Positioned(
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(.3),
                          child: const Image(
                            image: NetworkImage("http://openweathermap.org/img/wn/01n@2x.png"),
                          ),
                        ),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 10,
              ),
              // ignore: prefer_const_constructors
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color(0xFF6151C3),
                ),
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: const Text(
                          "Explore global map of wind, weather, and ocean conditions",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 50.0),
                        child: const Text(
                          "Planing your trip becomes more easier with ideate weather app. You can instantly see the whole world weather within few seconds.",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: 150,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: white,
                        ),
                        margin: const EdgeInsets.only(bottom: 20.0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUp(),
                              ),
                            );
                          },
                          child: Text(
                            "Get started",
                            style: TextStyle(color: primary),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
