import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather_app/views/homepage.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Timer(Duration(milliseconds: 1500000), () {
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
          child: Center(
            child: AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(seconds: 1),
              child: Padding(
                padding: EdgeInsets.only(top: srcheight * 0.35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/weather_thumb.png',
                      color: Colors.white,
                      height: srcwidth * 0.5,
                      width: srcwidth * 0.5,
                    ),
                    Text('Weather APP',style: TextStyle(color: Colors.white),)

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
