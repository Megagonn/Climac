import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/color.dart';
import 'package:weather/model/weather.dart';
import 'package:weather/service/api.dart';
import 'package:weather/ui/city.dart';
import 'package:weather/ui/compare.dart';
import 'package:weather/ui/weathercard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  getUserName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var data = (pref.getString("signup")!);
    var name = jsonDecode(data)['username'];
    // print(data);
    // print(name);
    return name;
  }

  Future<dynamic> getCurrentLocationWeather() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var data = jsonDecode(pref.getString("signup")!);
    var weatherRaw = await Api().getData(data['location']);
    return weatherRaw;
  }

  getWeather() async {
    var result1 = await Api().getData('abuja');
    var result2 = await Api().getData('ede');
    var result3 = await Api().getData('ogbomoso');
    var result4 = await Api().getData('ohio');
    var result5 = await Api().getData('mecca');
    var result6 = await Api().getData('london');
    var result7 = await Api().getData('medina');
    var result8 = await Api().getData('moscow');
    var result9 = await Api().getData('dublin');
    var result10 = await Api().getData('seoul');

    List myList = [
      result1,
      result2,
      result3,
      result4,
      result5,
      result6,
      result7,
      result8,
      result9,
      result10
    ];
    return myList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserName();
    getCurrentLocationWeather();
    getWeather();
  }

  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // var name = getUserName();
    // var currentLocation = getCurrentLocation();
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FutureBuilder(
                    future: getUserName(),
                    builder: (context, AsyncSnapshot<dynamic> snaphot) {
                      if (snaphot.connectionState == ConnectionState.waiting) {}
                      var name = snaphot.data;
                      return Text(
                        "Hello $name,\nDiscover the weather",
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      );
                    },
                  ),
                  CircleAvatar(
                      backgroundColor: const Color(0xFF6151C3),
                      child: IconButton(
                        onPressed: () {
                          _alert();
                        },
                        icon: const Icon(Icons.compare_arrows_sharp),
                      )),
                  SizedBox(
                    width: 150,
                    child: TextField(
                      controller: textEditingController,
                      onEditingComplete: () async {
                        var rawData =
                            await Api().getData(textEditingController.text);
                        var refinedData = Weather.fromJson(rawData);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const City(),
                            settings: RouteSettings(arguments: refinedData),
                          ),
                        );
                        textEditingController.clear();
                      },
                    ),
                  ),
                ],
              ),
              FutureBuilder(
                future: getCurrentLocationWeather(),
                builder: (context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('');
                  } else {
                    var data = snapshot.data;
                    var weatherMap = Weather.fromJson(data);
                    return weatherCard(context, weatherMap);
                  }
                },
              ),
              Center(
                child: Container(
                  width: 150,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: primary,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                child: FutureBuilder(
                  future: getWeather(),
                  builder: (context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const LinearProgressIndicator();
                    } else {
                      var allData = snapshot.data;
                      return SingleChildScrollView(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height - 282,
                          child: ListView.builder(
                            itemCount: allData.length,
                            itemBuilder: (context, val) {
                              var data = Weather.fromJson(allData[val]);
                              return weatherCard(context, data);
                            },
                          ),
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _alert() {
    return showDialog(
        barrierColor: const Color(0xFF6151C3).withOpacity(0.4),
        barrierDismissible: false,
        context: context,
        builder: (context) {
          TextEditingController textEditingController = TextEditingController();
          TextEditingController _textEditingController =
              TextEditingController();
          return AlertDialog(
            title: const Text('Compare with:'),
            content: SizedBox(
              height: 150,
              child: Column(
                children: [
                  TextField(
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      labelText: "City name",
                    ),
                  ),
                  TextField(
                    controller: _textEditingController,
                    decoration: const InputDecoration(
                      labelText: "City name",
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              Container(
                padding: const EdgeInsets.all(5),
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  color: const Color(0xFF6151C3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () async {
                    var locus1 =
                        await Api().getData(textEditingController.text);
                    var locus2 =
                        await Api().getData(_textEditingController.text);
                    var city1 = Weather.fromJson(locus1);
                    var city2 = Weather.fromJson(locus2);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Compared(),
                        settings: RouteSettings(arguments: [city1, city2]),
                      ),
                    );
                    textEditingController.clear();
                    _textEditingController.clear();
                  },
                  child: const Text(
                    "Compare",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    // ignore: prefer_const_constructors
                    child: Text(
                      "Cancel",
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              )
            ],
          );
        });
  }
}
