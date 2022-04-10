class Weather {
  final String locationName, image, main, description, country;
  final double wind, temp;
  final int humidity, pressure;

  Weather({
    required this.country,
    required this.locationName,
    required this.image,
    required this.main,
    required this.description,
    required this.wind,
    required this.pressure,
    required this.temp,
    required this.humidity,
  });

  factory Weather.fromJson(Map<String, dynamic> map) {
    return Weather(
        locationName: map['name'],
        image: "${map['weather'][0]['icon']}",
        main: map['weather'][0]['main'],
        description: map['weather'][0]['description'],
        wind: map['wind']['speed'],
        pressure: map['main']['pressure'],
        temp: map['main']['temp'],
        humidity: map['main']['humidity'],
        country: map['sys']['country']);
  }
}
