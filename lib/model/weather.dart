class Weather {
  final String locationName, image, main, description;
  final double wind, pressure, temp, humidity;

  Weather({
    required this.locationName,
    required this.image,
    required this.main,
    required this.description,
    required this.wind,
    required this.pressure,
    required this.temp,
    required this.humidity,
  });

  factory Weather.fromJson (Map map){
    return Weather(locationName: map['name'], image: map['weather'][0]['icon'], main: map['weather'][0]['main'], description: map['weather'][0]['description'], wind: map['wind']['speed'], pressure: map['main']['pressure'], temp: map['main']['temp'], humidity: map['main']['humidity']);
  }
}
