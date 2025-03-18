import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CitiesScreen extends StatefulWidget {
  @override
  State<CitiesScreen> createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {
  final List<Map<String, dynamic>> weatherData = [
    {
      "temperature": 19,
      "high": 24,
      "low": 18,
      "location": "Bengaluru, India",
      "condition": "Mid Rain",
      "icon": Icons.water_drop,
    },
    {
      "temperature": 22,
      "high": 26,
      "low": 18,
      "location": "Chennai, India",
      "condition": "Fast Wind",
      "icon": Icons.air,
    },
    {
      "temperature": 29,
      "high": 32,
      "low": 27,
      "location": "Delhi, India",
      "condition": "Cloudy",
      "icon": Icons.cloud,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromRGBO(44,49,87,1.0), Color.fromRGBO(29,28,55,1.0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            AppBar(
              title: Text(
                "Weather",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              // centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(Icons.more_vert, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search city or airport",
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  filled: true,
                  fillColor: Colors.black26,
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  hintStyle: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: weatherData.length,
                itemBuilder: (context, index) {
                  return WeatherTile(
                    temperature: weatherData[index]["temperature"],
                    high: weatherData[index]["high"],
                    low: weatherData[index]["low"],
                    location: weatherData[index]["location"],
                    condition: weatherData[index]["condition"],
                    icon: weatherData[index]["icon"],
                  );
                },
              ),
            ),
            Container(
              // width: double.infinity,
              child: Stack(
                children: [
                  Image.asset('assets/images/container.png',)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WeatherTile extends StatelessWidget {
  final int temperature;
  final int high;
  final int low;
  final String location;
  final String condition;
  final IconData icon;

  WeatherTile({
    required this.temperature,
    required this.high,
    required this.low,
    required this.location,
    required this.condition,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Image.asset('assets/images/container.png',width: double.infinity,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$temperature°",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "H:$high°  L:$low°",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  Text(
                    location,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    condition,
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
              Icon(icon, color: Colors.white, size: 40),
            ],
          ),
        ],
      ),
    );
  }
}
