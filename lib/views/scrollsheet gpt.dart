import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ScrollSheet extends StatefulWidget {
  ScrollSheet({super.key});

  @override
  State<ScrollSheet> createState() => _ScrollSheetState();
}

class _ScrollSheetState extends State<ScrollSheet> {
  List<dynamic> hourlyForecast = [];
  double airQuality = 0;
  double uvIndex = 0;
  double windSpeed = 0;
  double rainfall = 0;
  String sunrise = '';
  String sunset = '';

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    const String apiKey = "674d0ce02de5536b3a7c0436bc6d9ad2";
    const String city = "Delhi"; // Change this as needed
    final String url =
        "https://api.openweathermap.org/data/2.5/forecast?q=$city&units=metric&appid=$apiKey";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        setState(() {
          hourlyForecast = data['list'].take(6).toList();
          airQuality = 3.0; // Placeholder (Get real AQI from another API)
          uvIndex = 4.0; // Placeholder (Need UV API)
          windSpeed = data['list'][0]['wind']['speed'];
          rainfall = data['list'][0]['rain']?['1h'] ?? 0;
          sunrise = DateFormat('h:mm a').format(
              DateTime.fromMillisecondsSinceEpoch(
                  data['city']['sunrise'] * 1000));
          sunset = DateFormat('h:mm a').format(
              DateTime.fromMillisecondsSinceEpoch(
                  data['city']['sunset'] * 1000));
        });
      } else {
        print("Failed to fetch weather data");
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.35,
      minChildSize: 0.35,
      maxChildSize: 1,
      builder: (context, scrollController) {
        return ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent.withOpacity(0.15),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: Get.width * 0.018,
                      width: Get.width * 0.13,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Forecast Row
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Hourly Forecast',
                            style: TextStyle(
                                color: Colors.white60,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                        color: Colors.white30.withOpacity(0.5), thickness: 0.5),

                    // Hourly Forecast List
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: SizedBox(
                        height: Get.height * 0.15,
                        child: hourlyForecast.isEmpty
                            ? Center(
                          child: CircularProgressIndicator(),
                        )
                            : ListView.builder(
                          itemCount: hourlyForecast.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            var forecast = hourlyForecast[index];
                            String formattedHour = DateFormat.j().format(
                                DateTime.fromMillisecondsSinceEpoch(
                                    forecast['dt'] * 1000));
                            double temperature =
                            forecast['main']['temp'];

                            return Container(
                              margin:
                              EdgeInsets.symmetric(horizontal: 8),
                              padding: EdgeInsets.all(10),
                              width: Get.width * 0.18,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xFF6440b3), width: 0.5),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromRGBO(100, 69, 115, 1.0),
                                    Color.fromRGBO(56, 55, 96, 1.0)
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Text(
                                    formattedHour,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(height: 8),
                                  Icon(Icons.wb_sunny,
                                      size: 24, color: Colors.white),
                                  SizedBox(height: 8),
                                  Text(
                                    "${temperature.toStringAsFixed(1)}°C",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: Get.width * 0.1),

                    // Air Quality Container
                    Container(
                      height: Get.height * 0.2,
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                        color: Color(0xFF302261).withOpacity(0.8),
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(
                            color: Color(0xFF6440b3), width: 0.5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                            EdgeInsets.only(left: 15.0, top: 15, bottom: 10),
                            child: Row(
                              children: [
                                Icon(Icons.grid_view,
                                    size: Get.width * 0.04,
                                    color: Colors.grey.withOpacity(0.5)),
                                Text(
                                  ' AIR QUALITY',
                                  style: TextStyle(
                                      fontSize: Get.width * 0.04,
                                      color: Colors.grey.withOpacity(0.5),
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 18.0),
                            child: Text(
                              '$airQuality - Low Health Risk',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Get.width * 0.06),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
