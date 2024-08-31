import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';

class Searchscreen extends StatelessWidget {
  const Searchscreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onSubmitted: (value) async {
            var getweathercubit = BlocProvider.of<GetWeatherCubit>(context);
            getweathercubit.getWeather(value: value);
            log(value);
            Navigator.pop(context);
          },
          decoration: InputDecoration(
              hintText: 'enter the name of the country',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.blue),
              ),
              labelText: 'search',
              suffixIcon: const Icon(Icons.search)),
        ),
      ),
    );
  }
}
