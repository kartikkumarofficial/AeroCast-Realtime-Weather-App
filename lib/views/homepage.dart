import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherData? weatherInfo;
  // bool isLoading = true;
  String errorMessage = "";

  myWeather() async {

      WeatherData fetchedWeather = await WeatherService().fetchWeather();
      setState(() {
        weatherInfo = fetchedWeather;
        // isLoading = false;
      });
    // } catch (error) {
      setState(() {
        errorMessage = 'Failed to load weather data. Please try again.';
        // isLoading = false;
      });
    // }
  }

  @override
  void initState() {
    super.initState();
    myWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/29.png',
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
            height: Get.height * 1,
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: Get.height * 0.1),
                child: Text(
                  // weather.name,
                  'Mullana',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: Get.height * 0.055,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                '19',
                style: GoogleFonts.cinzel(
                  fontSize: Get.height * 0.09,
                  color: Colors.white,
                ),
              ),
              Text(
                'Mostly Clear',
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700,
                  fontSize: Get.height * 0.02,
                  color: Colors.grey,
                ),
              ),
              Text(
                'H: 24 L:18',
                style: GoogleFonts.allerta(
                  fontSize: Get.height * 0.028,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.height * 0.13),
                child: Image.asset('assets/images/House 4 3.png'),
              ),
            ],
          ),
          Positioned(
            left: -2,
              bottom: -10,
              // left: -90,
              width: Get.width*1,
              child: Image.asset('assets/images/bottomnavbar.png',)),
          // Center(
          //   // child: isLoading
          //   //     ? const CircularProgressIndicator(color: Colors.white) // Loading indicator
          //   //     : errorMessage.isNotEmpty
          //   //     ? Text(
          //   //   errorMessage,
          //   //   style: GoogleFonts.dmSans(
          //   //     fontSize: Get.height * 0.03,
          //   //     color: Colors.red,
          //   //   ),
          //   // ) // Show error message
          //   //     :
          //   child :WeatherDetail(weather: weatherInfo!),
          // ),
        ],
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
          padding: EdgeInsets.only(top: Get.height * 0.1),
          child: Text(
            // weather.name,
            'Mullana',
            style: GoogleFonts.playfairDisplay(
              fontSize: Get.height * 0.055,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          '19',
          style: GoogleFonts.cinzel(
            fontSize: Get.height * 0.09,
            color: Colors.white,
          ),
        ),
        Text(
          'Mostly Clear',
          style: GoogleFonts.dmSans(
            fontWeight: FontWeight.w700,
            fontSize: Get.height * 0.02,
            color: Colors.grey,
          ),
        ),
        Text(
          'H: 24 L:18',
          style: GoogleFonts.allerta(
            fontSize: Get.height * 0.028,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: Get.height * 0.13),
          child: Image.asset('assets/images/House 4 3.png'),
        ),
      ],
    );
  }
}
