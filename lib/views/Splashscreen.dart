import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/views/homepage.dart';

import '../models/weather_model.dart';
import '../services/weather_service.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  String _city = "Dehradun";
  final WeatherService _weatherService = WeatherService();
  WeatherData? weatherInfo;
  bool _isLoading = false;
  Map<String, dynamic>? _weatherData;
  String errorMessage = "";
  double _opacity = 0.0;
  void fetchweather() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final data = await _weatherService.fetchWeather(_city);
      setState(() {
        _weatherData = data;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to fetch weather data")),
      );
    }

  }

  @override
  void initState() {
    super.initState();
    fetchweather();
    _startTimer();
  }

  void _startTimer() {
    Timer(Duration(milliseconds: 1500), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
    // fade effect
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var srcheight = MediaQuery.of(context).size.height;
    var srcwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: srcheight,
          width: srcwidth,
          decoration:BoxDecoration(
            gradient: LinearGradient(
            colors: [Color(0xFF011c37), Color(0xFF340b17)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),),
          child: AnimatedOpacity(
            opacity: _opacity,
            duration: Duration(seconds: 1),
            child: Padding(
              padding: EdgeInsets.only(top: srcheight * 0.27),
              child: Column(

                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    // height: srcwidth * 0.7,
                    width: srcwidth * 0.69,

                    // color: Colors.red,
                    child: Image.asset(
                      'assets/images/weather_thumb.png',
                      // color: Colors.white,


                    ),
                  ),
                  SizedBox(height: 40,),
                  Text('AeroCast',style: GoogleFonts.spectralSc(
                      fontSize: Get.width*0.14,
                      color: Colors.white),)

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
