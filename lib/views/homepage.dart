import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/views/cities.dart';
import 'package:weather_app/views/citiespage2.dart';
import 'package:weather_app/views/mappage.dart';
import 'package:weather_app/views/scrollsheet%20test.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _city = "Dehradun";
  final WeatherService _weatherService = WeatherService();
  WeatherData? weatherInfo;
  bool _isLoading = false;
  Map<String, dynamic>? _weatherData;
  String errorMessage = "";
  void _fetchWeather() async {
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

  // myWeather() async {
  //
  //     Map<String, dynamic> fetchedWeather = await WeatherService().fetchWeather();
  //     setState(() {
  //       weatherInfo = fetchedWeather;
  //       // isLoading = false;
  //     });
  //   // } catch (error) {
  //     setState(() {
  //       errorMessage = 'Failed to load weather data. Please try again.';
  //       // isLoading = false;
  //     });
  //   // }
  // }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
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
          if (_isLoading)
            CircularProgressIndicator()
          else if (_weatherData != null)
          Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: Get.height * 0.1),
                    child: Text(
                      // weather.name,
                      '${_weatherData!['name']}',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: Get.height * 0.055,
                        color: Colors.white,
                      ),
                    ),
                  ),



              Text(
                '${_weatherData!['main']['temp']}°C',
                style: GoogleFonts.cinzel(
                  fontSize: Get.height * 0.09,
                  color: Colors.white,
                ),
              ),
              Text(
                'Condition: ${_weatherData!['weather'][0]['description']}',
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
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left:10,top: Get.height * 0.0),
                child: Image.asset('assets/images/House 4 3.png'),
              ),
            ],
          ),
          ScrollSheet(),
          Positioned(
            // left: -2,
            right: 0,
              bottom: -5,
              // left: -90,
              // height: Get.height*0.,
              width: Get.width*1,
              child: Stack(
                children: [
                  //bottomnavbar
                  Container(
                    width:double.infinity,
                      child: Image.asset('assets/images/bottomnavbar.png',fit: BoxFit.cover,)),
                  Positioned(
                    left: 20,
                    bottom: 20,
                    child: IconButton(onPressed: (){
                      Get.to(MapScreen());
                    }, icon: Icon(CupertinoIcons.location_solid,color: Colors.white,size: Get.width*0.1,)
                    ),
                  ),
                  Positioned(
                    right: 20,
                    bottom: 20,
                    child: IconButton(onPressed: (){
                      Get.to(OtherCities());
                    }, icon: Icon(CupertinoIcons.list_bullet,color: Colors.white,size: Get.width*0.1,)
                    ),
                  ),
                  Positioned(
                    right: Get.width*0.41,
                    bottom: 22,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Color.fromRGBO(53,57,105,1),width: 4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 0.1,
                            offset: Offset(-4, -5)
                          )
                        ]
                      ),
                      child: CircleAvatar(
                        radius: 30,

                        backgroundColor: Colors.white,
                        child: IconButton(
                            onPressed: (){_fetchWeather();}, icon: Icon(CupertinoIcons.add,color:Colors.deepPurple ,size: Get.width*0.06,)
                        ),
                      ),
                    ),
                  ),
                ],
              )),
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
        DraggableScrollableSheet(
            initialChildSize: 0.3,
          minChildSize: 0.1,
          maxChildSize: 0.8,
            builder: (context, scrollController) {
              return Container(
                child:Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Container(
                            height: Get.width*0.018,
                            width: Get.width*0.12,
                            decoration: BoxDecoration(
                                color: Color(0xFF333333),
                                borderRadius: BorderRadius.circular(030)
                            ),
                          ),
                        ),
                      ],
                    )

                  ],
                ) ,
              );
            },)
      ],
    );
  }
}
