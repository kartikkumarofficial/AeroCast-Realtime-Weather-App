import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? selectedLocation;
  String? selectedCity;
  final MapController _mapController = MapController();

  // Function to get city name from coordinates
  Future<void> getCityName(LatLng latLng) async {
    final url = Uri.parse(
        "https://nominatim.openstreetmap.org/reverse?lat=${latLng.latitude}&lon=${latLng.longitude}&format=json");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          selectedCity = data['address']?['city'] ??
              data['address']?['town'] ??
              data['address']?['village'] ??
              "City not found";
        });
      } else {
        setState(() {
          selectedCity = "City not found";
        });
      }
    } catch (e) {
      setState(() {
        selectedCity = "Error fetching city";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pick a Location")),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: LatLng(28.7041, 77.1025),
          initialZoom: 10,
          onTap: (tapPosition, latLng) async {
            // When user taps, update selectedLocation and fetch city name
            setState(() {
              selectedLocation = latLng;
              selectedCity = null;
            });
            await getCityName(latLng);
          },
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          ),

          if (selectedLocation != null)
            MarkerLayer(
              markers: [
                Marker(
                  point: selectedLocation!,
                  width: 40,
                  height: 40,
                  child: Icon(Icons.location_pin, color: Colors.red, size: 40),
                ),
              ],
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedLocation != null &&
              selectedCity != null &&
              selectedCity != "City not found") {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text("Selected City: $selectedCity")),
            );
            Navigator.pop(context, {
              'location': selectedLocation,
              'city': selectedCity
            });
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text("Failed to get location. Please pick a valid point.")),
            );
          }
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
