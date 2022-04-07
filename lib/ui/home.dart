import 'package:flutter/material.dart';
import 'package:weather/model/weather.dart';
import 'package:weather/service/api.dart';
import 'package:weather/ui/city.dart';
import 'package:weather/ui/compare.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var name = 'Yusuff';

  var result2;
  var result3;
  var result4;
  getWeather() async {
    var result1 = await Api().getData('london');
    result2 = await Api().getData('ede');
    result3 = await Api().getData('ogbomoso');
    result4 = await Api().getData('ohio');
    print(result1);

    List myList = [result1, result2, result3, result4];
    return myList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeather();
  }

  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello $name,\nDiscover the weather",
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                      color: Colors.black,
                    ),
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
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: SingleChildScrollView(
                  child: FutureBuilder(
                    future: getWeather(),
                    builder: (context, AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const LinearProgressIndicator();
                      } else {
                        var allData = snapshot.data;
                        return SingleChildScrollView(
                          child: Container(
                            height: MediaQuery.of(context).size.height - 100,
                            child: ListView.builder(
                              itemCount: allData.length,
                              itemBuilder: (context, val) {
                                var data = Weather.fromJson(allData[val]);
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const City(),
                                        settings:
                                            RouteSettings(arguments: data),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: const Color(0xFF6151C3),
                                      // borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                data.country,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                  top: 10,
                                                  bottom: 30,
                                                ),
                                                child: Text(
                                                  data.locationName,
                                                  style: const TextStyle(
                                                      fontSize: 35,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Text(
                                                data.main,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Image(
                                                image: NetworkImage(
                                                    "http://openweathermap.org/img/wn/${data.image}@2x.png"),
                                              ),
                                              Text(
                                                "${data.temp.toString()}°C",
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }
                    },
                  ),
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
            content: Column(
              children: [
                TextField(
                  controller: textEditingController,
                ),
                TextField(
                  controller: _textEditingController,
                ),
              ],
            ),
            actions: [
              Container(
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () async {
                    // var locus1 = textEditingController.text;
                    // var locus2 = _textEditingController.text;
                    var locus1 = await Api().getData(textEditingController.text);
                    var locus2 = await Api().getData(_textEditingController.text);
                    var city1 = Weather.fromJson(locus1);
                    var city2 = Weather.fromJson(locus2);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Compared(),
                            settings:
                                RouteSettings(arguments: [city1, city2])));
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
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
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
