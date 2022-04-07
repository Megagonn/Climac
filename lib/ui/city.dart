import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:weather/model/weather.dart';

class City extends StatefulWidget {
  const City({Key? key}) : super(key: key);

  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;

    // var data = Weather.fromJson(routeData);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(data.locationName.toString().toUpperCase()),
          backgroundColor: const Color(0xFF6151C3),
        ),
        body: Container(
          child: Column(
            children: [
              Center(
                child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      // height: 200,
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xFF6151C3),
                      ),
                      child: Column(
                        children: [
                          Image(
                            image: NetworkImage(
                                "http://openweathermap.org/img/wn/${data.image}@2x.png"),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              data.locationName,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.white),
                            ),
                          ),
                          Text(
                            "${data.temp.toString()}°C",
                            style: const TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 12),
                            child: Text(
                              data.main,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height:40
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color(0xffe5e5e5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.space,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Weather now", style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // ignore: unnecessary_new
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                                // borderRadius: BorderRadius.circular(50),
                              ),
                              child: CircularPercentIndicator(
                                radius: 55.0,
                                lineWidth: 5.0,
                                percent: data.wind / 20,
                                header: Container(
                                  padding: const EdgeInsets.only(right: 10), 
                                  margin: const EdgeInsets.symmetric(vertical: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: const Color(0xffe5e5e5),
                                    // borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        // ignore: prefer_const_constructors
                                        CircleAvatar(
                                          radius: 15,
                                          backgroundColor:
                                              const Color(0xFF6151C3),
                                          child: const Icon(Icons.air_sharp,),
                                        ),
                                        // ignore: prefer_const_constructors
                                        SizedBox(
                                          width:10
                                        ),
                                        const Text("Wind"),
                                      ]),
                                ),
                                center: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: const Color(0xFF6151C3),
                                    child: Text(
                                      '${data.wind}\nmph',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    )
                                    // size: 50.0,
                                    // color: Colors.blue,
                                    ),
                                backgroundColor: Colors.grey,
                                progressColor: const Color(0xFF6151C3),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                                // borderRadius: BorderRadius.circular(50),
                              ),
                              child: CircularPercentIndicator(
                                radius: 55.0,
                                lineWidth: 5.0,
                                percent: data.pressure / 1500,
                                header: Container(
                                  padding: const EdgeInsets.only(right: 10),
                                  margin: const EdgeInsets.symmetric(vertical: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: const Color(0xffe5e5e5),
                                    // borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        // ignore: prefer_const_constructors
                                        CircleAvatar(
                                          radius: 15,
                                          backgroundColor:
                                              const Color(0xFF6151C3),
                                          child: const Icon(
                                            Icons.speed_sharp,
                                          ),
                                        ),
                                        // ignore: prefer_const_constructors
                                        SizedBox(
                                          width:10
                                        ),
                                        const Text("Pressure"),
                                      ]),
                                ),
                                center: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: const Color(0xFF6151C3),
                                    child: Text(
                                      
                                      '${data.pressure}\nmmHg',textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    )
                                    // size: 50.0,
                                    // color: Colors.blue,
                                    ),
                                backgroundColor: Colors.grey,
                                progressColor: const Color(0xFF6151C3),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  final String x;
  final double y = 20;

  ChartData({
    required this.x,
  });
}
