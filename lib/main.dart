import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                useMaterial3: false,
                primarySwatch: getAppTheme(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weathermodel
                        ?.condition),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getAppTheme(String? condition) {
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.orange;
    case 'Partly cloudy':
      return Colors.lightBlue;
    case 'Cloudy':
    case 'Overcast':
      return Colors.grey;
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.blueGrey;
    case 'Patchy rain possible':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
    case 'Patchy light rain':
    case 'Light drizzle':
    case 'Patchy light drizzle':
      return Colors.blue;
    case 'Patchy snow possible':
    case 'Light snow':
    case 'Patchy light snow':
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case 'Heavy snow':
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.lightBlue;
    case 'Patchy sleet possible':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
      return Colors.lightBlue;
    case 'Patchy freezing drizzle possible':
    case 'Freezing drizzle':
    case 'Light freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
      return Colors.cyan;
    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.purple;
    case 'Blowing snow':
    case 'Blizzard':
      return Colors.indigo;
    case 'Ice pellets':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.lightBlue;
    default:
      return Colors.blue;
  }
}
