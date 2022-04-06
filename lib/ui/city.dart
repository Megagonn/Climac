import 'package:flutter/material.dart';
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
        appBar: AppBar(),
        body: Container(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(30),
                  child: Container(
                          height: 300,
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
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
                          margin: const EdgeInsets.symmetric(vertical: 7),
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
                          margin: const EdgeInsets.only(top: 7),
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
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
