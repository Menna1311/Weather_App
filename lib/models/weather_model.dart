class WeatherModel {
  final String city;
  final DateTime? date;
  final String? image;
  final double temp;
  final double? maxtemp;
  final double? mintemp;
  final String condition;

  WeatherModel(
      {required this.city,
      required this.date,
      required this.image,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.condition});
  factory WeatherModel.fromjson(json) {
    return WeatherModel(
        city: json['location']['name'],
        date: DateTime.parse(json['current']['last_updated']),
        image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        condition: json['forecast']['forecastday'][0]['day']['condition']
            ['text']);
  }
}
