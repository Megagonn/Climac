import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                child: const Image(
                  image: AssetImage(
                    'assets/wp.png',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // ignore: prefer_const_constructors
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                clipBehavior: Clip.antiAlias,
                child: Card(
                  color: const Color(0xFF6151C3),
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
                          margin: const EdgeInsets.only(bottom: 20.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text("Get started"),
                            clipBehavior: Clip.hardEdge,
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
                            TextButton(onPressed: (){}, child:const Text("Log in"),),
                          ],
                        ),
                      ],
                    ),
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
