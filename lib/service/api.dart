import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> getData(String location) async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=582c6ecb3cf5aad485ea433f49dbcf22&units=metric');
    try {
      var response = await http.get(url);
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
}
