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



  @override
  Widget build(BuildContext context) {
    return  DraggableScrollableSheet(
        initialChildSize: 0.35,
        minChildSize: 0.35,
        maxChildSize: 1,
        builder: (context, scrollController) {
          return ClipRRect(
            borderRadius:BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20,sigmaY: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent.withOpacity(0.15),
                  borderRadius:  BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      Container(
                        margin:  EdgeInsets.only(top: 10),
                        height: Get.width * 0.018,
                        width: Get.width * 0.13,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          // color:  Color(0xFF333333).withOpacity(0.7),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                       SizedBox(height: 10),

                      // Forecast Row
                      Row(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left: 20.0),
                            child:  Text(
                              'Hourly Forecast',
                              style: TextStyle(color: Colors.white60, fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: Get.width * 0.3),
                            child:  Text(
                              '    Weekly Forecast',
                              style: TextStyle(color: Colors.white60, fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.white30.withOpacity(0.5), thickness: 0.5),

                      // Hourly Forecast List
                      Padding(
                        padding:  EdgeInsets.only(left: 15.0),
                        child: SizedBox(
                          height: Get.height * 0.15,

                          child: ListView.builder(
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              DateTime now = DateTime.now();
                              DateTime hourTime = now.add(Duration(hours: index - 1));
                              String formattedHour = DateFormat.j().format(hourTime);

                              return Container(
                                margin:  EdgeInsets.symmetric(horizontal: 8),
                                padding:  EdgeInsets.all(10),
                                width: Get.width * 0.18,
                                decoration: BoxDecoration(

                                  border: Border.all(color:  Color(0xFF6440b3), width: 0.5),
                                  gradient:  LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Color.fromRGBO(100, 69, 115, 1.0), Color.fromRGBO(56, 55, 96, 1.0)],
                                  ),
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          formattedHour,
                                          style:  TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                        ),
                                      ],
                                    ),
                                     SizedBox(height: 8),
                                     Icon(Icons.wb_sunny, size: 24, color: Colors.white),
                                     SizedBox(height: 8),
                                    Text(
                                      "${20 + index}°C",
                                      style:  TextStyle(fontSize: 14, color: Colors.white),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                       SizedBox(height: Get.width*0.1),

                      // Air Quality Container
                      Container(
                        height: Get.height * 0.2,
                        width: Get.width * 0.9,
                        decoration: BoxDecoration(
                          color:  Color(0xFF302261).withOpacity(0.8),
                          borderRadius: BorderRadius.circular(28),
                          border: Border.all(color:  Color(0xFF6440b3), width: 0.5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(left: 15.0, top: 15, bottom: 10),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 4.0),
                                    child: Icon(Icons.grid_view,size: Get.width*0.04, color: Colors.grey.withOpacity(0.5)),
                                  ),
                                  Text(
                                    'AIR QUALITY',
                                    style: TextStyle(fontSize: Get.width*0.04, color: Colors.grey.withOpacity(0.5), fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: 18.0),
                              child: Text(
                                '3-Low Health Risk',
                                style: TextStyle(color: Colors.white, fontSize: Get.width*0.06),
                              ),
                            ),
                            //  SizedBox(height: ),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 20),
                              child: Divider(color: Colors.black.withOpacity(0.5), thickness: 0.2),
                            ),
                             ListTile(
                              title: Text('See more', style: TextStyle(fontSize:Get.width*0.045, color: Colors.grey)),
                              trailing: Icon(Icons.arrow_forward_ios_rounded),
                            )
                          ],
                        ),
                      ),

                       SizedBox(height: 20),

                      // UV Index & Sunrise Containers
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: Get.height * 0.25,
                            width: Get.width * 0.43,
                            decoration: BoxDecoration(
                              color:  Color(0xFF302261).withOpacity(0.8),
                              borderRadius: BorderRadius.circular(28),
                              border: Border.all(color:  Color(0xFF6440b3), width: 0.5),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.sunny,size: Get.width*0.05, color: Colors.grey.withOpacity(0.5)),
                                       Text(' UV INDEX', style: TextStyle(fontSize: Get.width*0.04, color: Colors.grey)),
                                    ],
                                  ),
                                   SizedBox(height: 10),
                                   Text('4\nModerate', style: TextStyle(color: Colors.white, fontSize: Get.width*0.075)),
                                ],
                              ),
                            ),
                          ),

                           SizedBox(width: 15),

                          Stack(
                            children: [
                              Divider(thickness:4,color: Colors.grey),



                              Container(
                                height: Get.height * 0.25,
                                width: Get.width * 0.43,
                                decoration: BoxDecoration(
                                  color:  Color(0xFF302261).withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(28),
                                  border: Border.all(color:  Color(0xFF6440b3), width: 0.5),
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(CupertinoIcons.sunrise_fill,size: Get.width*0.05, color: Colors.grey.withOpacity(0.5)),
                                          Text(' SUNRISE', style: TextStyle(fontSize: Get.width*0.04, color: Colors.grey)),
                                        ],
                                      ),
                                       SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Text(DateFormat('h:mm a').format(DateTime.now()), style:  TextStyle(color: Colors.white, fontSize: Get.width*0.08)),
                                        ],
                                      ),

                                      Text('Sunset: ${DateFormat('h:mma').format(DateTime.now())}', style:  TextStyle(color: Colors.white, fontSize: 16)),
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: Get.width*0.04,),
                      //wind and rainfall containers
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: Get.height * 0.25,
                            width: Get.width * 0.43,
                            decoration: BoxDecoration(
                              color:  Color(0xFF302261).withOpacity(0.8),
                              borderRadius: BorderRadius.circular(28),
                              border: Border.all(color:  Color(0xFF6440b3), width: 0.5),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(CupertinoIcons.wind,size: Get.width*0.05, color: Colors.grey.withOpacity(0.5)),
                                      Text(' WIND', style: TextStyle(fontSize: Get.width*0.04, color: Colors.grey)),

                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Center(child: Image.asset('assets/images/wind.png',height: Get.width*0.35,))
                                  // Text('4\nModerate', style: TextStyle(color: Colors.white, fontSize: Get.width*0.075)),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(width: 15),

                          Stack(
                            children: [
                              Divider(thickness:4,color: Colors.grey),



                              Container(
                                height: Get.height * 0.25,
                                width: Get.width * 0.43,
                                decoration: BoxDecoration(
                                  color:  Color(0xFF302261).withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(28),
                                  border: Border.all(color:  Color(0xFF6440b3), width: 0.5),
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.water_drop,size: Get.width*0.05, color: Colors.grey.withOpacity(0.5)),
                                          Text(' RAINFALL', style: TextStyle(fontSize: Get.width*0.04, color: Colors.grey)),
                                        ],
                                      ),

                                      SizedBox(height: 10),
                                      Text('1.8 mm', style: TextStyle(color: Colors.white, fontSize: Get.width*0.085)),
                                      Text(' in last hour', style: TextStyle(color: Colors.white, fontSize: Get.width*0.06)),
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ],
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
