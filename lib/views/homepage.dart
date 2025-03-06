import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

import '../widgets/curvedcontainer1.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherData? weatherInfo;
  bool isLoading = true;
  String errorMessage = "";

  // late WeatherData weatherInfo;
  myWeather(){
    WeatherService().fetchWeather().then((value){
      setState(() {
        weatherInfo = value;

      });
    });
  }
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    myWeather();

  }
  @override
  Widget build(BuildContext context) {

     var srcheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body:SingleChildScrollView(
        child: Stack(
          children: [


            Image.asset('assets/images/29.png',
            filterQuality: FilterQuality.high,
              // height: Get.height,
              fit: BoxFit.cover,
              height: Get.height*1,
            ),
            Center(
              child: WeatherDetail(weather: weatherInfo!),
        //       child: Column(
        //         children: [
        //           Padding(
        //             padding: EdgeInsets.only(top: Get.height*0.1),
        //             child: Text('Mullana',
        //               style: GoogleFonts.playfairDisplay(
        //                   fontSize: Get.height*0.055,
        //                 color: Colors.white
        //             ),),
        //
        //           ),
        //           Text('19',
        //             style: GoogleFonts.cinzel(
        //               // fontWeight: FontWeight.normal,
        //                 fontSize: Get.height*0.09,
        //               color: Colors.white
        //           ),),
        //           Text('Mostly Clear',
        //             style: GoogleFonts.dmSans(
        //               fontWeight: FontWeight.w700,
        //                 fontSize: Get.height*0.02,
        //               color: Colors.grey
        //           ),),
        // Text('H: 24 L:18',
        //   style: GoogleFonts.allerta(
        //       fontSize: Get.height*0.028,
        //       color: Colors.white
        //   ),),
        //           Padding(
        //             padding: EdgeInsets.only(top: Get.height*0.13),
        //             child: Image.asset('assets/images/House 4 3.png',),
        //           ),
        //
        //         ],
        //
        //       ),
            ),
            // DraggableScrollableSheet(
            //
            //
            //     builder: builder)
          ],
        ),
      ),
    );
  }
}


class WeatherDetail extends StatelessWidget {
  final WeatherData weather;
  const WeatherDetail({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: Get.height*0.1),
          child: Text(weather.name,
            style: GoogleFonts.playfairDisplay(
                fontSize: Get.height*0.055,
                color: Colors.white
            ),),

        ),
        Text("19",//${weather.temperature.current.toStringAsFixed(2)}°C
          style: GoogleFonts.cinzel(
            // fontWeight: FontWeight.normal,
              fontSize: Get.height*0.09,
              color: Colors.white
          ),),
        Text('Mostly Clear',
          style: GoogleFonts.dmSans(
              fontWeight: FontWeight.w700,
              fontSize: Get.height*0.02,
              color: Colors.grey
          ),),
        Text('H: 24 L:18',
          style: GoogleFonts.allerta(
              fontSize: Get.height*0.028,
              color: Colors.white
          ),),
        Padding(
          padding: EdgeInsets.only(top: Get.height*0.13),
          child: Image.asset('assets/images/House 4 3.png',),
        ),

      ],

    );
  }
}
