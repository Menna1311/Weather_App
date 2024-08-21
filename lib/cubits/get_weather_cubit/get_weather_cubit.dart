import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(InitialState());
  WeatherModel? weathermodel;
  getWeather({required String value}) async {
    try {
      weathermodel = await weatherService(Dio()).getweather(city: value);
      emit(Weatherloadedstate());
    } catch (e) {
      emit(Weatherfaildedstate());
    }
  }
}
