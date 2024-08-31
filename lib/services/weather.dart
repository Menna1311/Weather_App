import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apikey = 'b26fa8632c8244c5849214519240208';
  WeatherService(this.dio);
  Future<WeatherModel> getweather({required String city}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$apikey&q=$city&days=1');
      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      log(weatherModel.condition);
      return weatherModel;
    } on DioException catch (e) {
      final String errormessage =
          e.response?.data['error']['message'] ?? 'oops there is an error';
      throw Exception(errormessage);
    } catch (e) {
      log(e.toString());
      throw Exception('there is an error ');
    }
  }
}
