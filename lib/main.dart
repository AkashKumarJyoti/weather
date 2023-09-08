import 'package:flutter/material.dart';
import 'package:weather/weather_forecst.dart';

void main() {
  runApp( const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Weather",
    home: WeatherForecast()
  ));
}
