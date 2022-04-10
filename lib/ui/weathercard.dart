import 'package:flutter/material.dart';
import 'package:weather/color.dart';

import 'city.dart';

weatherCard(BuildContext context, data) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const City(),
          settings: RouteSettings(arguments: data),
        ),
      );
    },
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xFF6151C3),
        boxShadow: [
          BoxShadow(
            color: grey.withOpacity(.7),
            blurRadius: 1,
            spreadRadius: 3,
            blurStyle: BlurStyle.normal,
          )
        ]
        // borderRadius: BorderRadius.circular(50),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.country,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  Container(
                    width: 250,
                    margin: const EdgeInsets.only(
                      top: 10,
                      bottom: 30,
                    ),
                    child: Text(
                      data.locationName,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w900,
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
}
