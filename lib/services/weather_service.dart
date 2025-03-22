import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/weather_model.dart';


class WeatherService{
  final String apiKey = "674d0ce02de5536b3a7c0436bc6d9ad2";
  final String baseUrl = "https://api.openweathermap.org/data/2.5/weather";
  // final String city = "Dehradun";
  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final url = Uri.parse('$baseUrl?q=$city&appid=$apiKey&units=metric');
    // Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat={30.2753°}&lon={77.0476°}&appid={674d0ce02de5536b3a7c0436bc6d9ad2}"));
    // https://api.openweathermap.org/data/2.5/weather?q=Dehradun&appid=674d0ce02de5536b3a7c0436bc6d9ad2&units=metric
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to fetch weather data");
    }
  }


  }
