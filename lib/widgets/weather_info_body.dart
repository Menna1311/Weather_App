import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/main.dart';
import 'package:weather/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WeatherModel? weathermodel =
        BlocProvider.of<GetWeatherCubit>(context).weathermodel;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        getAppTheme(weathermodel!.condition),
        getAppTheme(weathermodel.condition)[300]!,
        getAppTheme(weathermodel.condition)[50]!,
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weathermodel.city,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              'updated at ${weathermodel.date?.hour}:${weathermodel.date?.minute}',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  'http:${weathermodel.image}',
                ),
                Text(
                  weathermodel.temp.round().toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Maxtemp:${weathermodel.maxtemp?.round()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Mintemp:${weathermodel.mintemp?.round()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weathermodel.condition,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
