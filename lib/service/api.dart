import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> getData(String location) async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=ca495b715da66e867fc2dd465dca9aac&units=metric');
    try {
      var response = await http.get(url);
      var res = await jsonDecode(response.body);
      return res;
    } catch (e) {
      // print(e);
      return e.toString();
    }
  }
}
