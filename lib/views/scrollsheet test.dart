import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ScrollSheet extends StatefulWidget {
  const ScrollSheet({super.key});

  @override
  State<ScrollSheet> createState() => _ScrollSheetState();
}

class _ScrollSheetState extends State<ScrollSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF3f2c6e),
        child: DraggableScrollableSheet(
          initialChildSize: 0.3,
          minChildSize: 0.1,
          maxChildSize: 0.8,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.transparent.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: Get.width * 0.018,
                      width: Get.width * 0.15,
                      decoration: BoxDecoration(
                        color: const Color(0xFF333333).withOpacity(0.4),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Forecast Row
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: const Text(
                            'Hourly Forecast',
                            style: TextStyle(color: Colors.white60, fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: Get.width * 0.3),
                          child: const Text(
                            'Weekly Forecast',
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
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              padding: const EdgeInsets.all(10),
                              width: Get.width * 0.17,
                              decoration: BoxDecoration(

                                border: Border.all(color: const Color(0xFF6440b3), width: 0.5),
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Color.fromRGBO(100, 69, 115, 1.0), Color.fromRGBO(56, 55, 96, 1.0)],
                                ),
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    formattedHour,
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                  const SizedBox(height: 8),
                                  const Icon(Icons.wb_sunny, size: 24, color: Colors.white),
                                  const SizedBox(height: 8),
                                  Text(
                                    "${20 + index}°C",
                                    style: const TextStyle(fontSize: 14, color: Colors.white),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Air Quality Container
                    Container(
                      height: Get.height * 0.2,
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                        color: const Color(0xFF302261).withOpacity(0.8),
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(color: const Color(0xFF6440b3), width: 0.5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, top: 15, bottom: 10),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 4.0),
                                  child: Icon(Icons.grid_view,size: Get.width*0.04, color: Colors.grey.withOpacity(0.5)),
                                ),
                                Text(
                                  'AIR QUALITY',
                                  style: TextStyle(fontSize: Get.width*0.045, color: Colors.grey.withOpacity(0.5), fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 18.0),
                            child: Text(
                              '3-Low Health Risk',
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                          // const SizedBox(height: ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(color: Colors.black.withOpacity(0.5), thickness: 0.2),
                          ),
                          const ListTile(
                            title: Text('See more', style: TextStyle(fontSize: 20, color: Colors.grey)),
                            trailing: Icon(Icons.arrow_forward_ios_rounded),
                          )
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // UV Index & Sunrise Containers
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: Get.height * 0.25,
                          width: Get.width * 0.43,
                          decoration: BoxDecoration(
                            color: const Color(0xFF302261).withOpacity(0.8),
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(color: const Color(0xFF6440b3), width: 0.5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.sunny, color: Colors.grey.withOpacity(0.5)),
                                    const Text('UV INDEX', style: TextStyle(fontSize: 18, color: Colors.grey)),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                const Text('4\nModerate', style: TextStyle(color: Colors.white, fontSize: 28)),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(width: 15),

                        Container(
                          height: Get.height * 0.25,
                          width: Get.width * 0.43,
                          decoration: BoxDecoration(
                            color: const Color(0xFF302261).withOpacity(0.8),
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(color: const Color(0xFF6440b3), width: 0.5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(CupertinoIcons.sunrise_fill, color: Colors.grey.withOpacity(0.5)),
                                    const Text('SUNRISE', style: TextStyle(fontSize: 18, color: Colors.white)),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(DateFormat('h:mm a').format(DateTime.now()), style: const TextStyle(color: Colors.white, fontSize: 40)),
                                const Divider(color: Colors.white),
                                Text('Sunset: ${DateFormat('h:mma').format(DateTime.now())}', style: const TextStyle(color: Colors.white, fontSize: 16)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
