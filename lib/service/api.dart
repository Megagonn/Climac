import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/service/token.dart';

class Api {
  Future<dynamic> getData(String location) async {
    var token = Token().token();
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$token&units=metric');
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
