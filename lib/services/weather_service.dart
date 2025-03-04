import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/weather_model.dart';


class WeatherService{
  fetchWeather() async{
    final response = await http.get(
        Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat={30.2753°}&lon={77.0476°}&appid={674d0ce02de5536b3a7c0436bc6d9ad2}"));
    try{
      if(response.statusCode==200){
        var json = jsonDecode(response.body);
        return WeatherData.fromJson(json);
      }else{
        throw Exception('Failed to load Weather Data');
      }

      }catch(e){
        print(e.toString());
    }
    }


  }
