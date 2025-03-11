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
      body:Container(
        color: Color(0xFF3f2c6e),
        child: DraggableScrollableSheet(
          initialChildSize: 0.3,
          minChildSize: 0.1,
          maxChildSize: 0.8,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.transparent.withOpacity(0.5),
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
                      width: Get.width * 0.15,
                      decoration: BoxDecoration(
                        color: Color(0xFF333333).withOpacity(0.4),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Hourly Forecast',
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(0, 1),
                                  blurRadius: 2,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: Get.width * 0.3),
                          child: Text(
                            'Weekly Forecast',
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(0, 1),
                                  blurRadius: 2,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(color: Colors.white30.withOpacity(0.5), thickness: 0.5),
                    SizedBox(
                      height: 130,
                      child: ListView.builder(
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          DateTime now = DateTime.now();
                          DateTime hourTime = now.add(Duration(hours: index - 1));
                          String formattedHour = DateFormat.j().format(hourTime);

                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            padding: EdgeInsets.all(10),
                            width: 70,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(100, 69, 115, 1.0),
                                  Color.fromRGBO(56, 55, 96, 1.0),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  formattedHour,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 8),
                                Icon(Icons.wb_sunny, size: 24, color: Colors.white),
                                SizedBox(height: 8),
                                Text(
                                  "${20 + index}°C",
                                  style: TextStyle(fontSize: 14, color: Colors.white),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 20,),

                    //air quality container
                    Container(
                      height: Get.height*0.2,
                      width: Get.width*0.9,
                      decoration: BoxDecoration(
                        color:Color(0xFF302261).withOpacity(0.8),
                        borderRadius: BorderRadius.circular(28),
                        border:Border.all(color: Color(0xFF6440b3),width: 0.5)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left: 15.0,top: 15,bottom: 10),
                            child: Row(
                              children: [
                                Icon(Icons.grid_view,color: Colors.grey.withOpacity(0.5),),
                                Text('AIR QUALITY',style: TextStyle(fontSize: 18,color: Colors.grey.withOpacity(0.5),fontWeight: FontWeight.w600),)
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 18.0),
                            child: Text('3-Low Health Risk',style: TextStyle(color: Colors.white,fontSize: 25),),
                          ),
                          SizedBox(height: 30,),
                          //todo make a colorfull widget based on data here
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(
                              color: Colors.black.withOpacity(0.5),
                              thickness: 0.2,
                            ),
                          ),
                          ListTile(
                            title: Text('See more',style: TextStyle(fontSize: 20
                                ,color: Colors.grey.withOpacity(0.8)),),
                            trailing: Icon(Icons.arrow_forward_ios_rounded),
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: 20,),


                    //uv index container
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left:Get.width*0.05),
                          child: Container(
                            height: Get.width*0.45,
                            width: Get.width*0.43,
                            decoration: BoxDecoration(
                                color:Color(0xFF302261).withOpacity(0.8),
                                borderRadius: BorderRadius.circular(28),
                                border:Border.all(color: Color(0xFF6440b3),width: 0.5)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(left: 15.0,top: 15,bottom: 10),
                                  child: Row(
                                    children: [
                                      Icon(Icons.sunny,color: Colors.grey.withOpacity(0.5),),
                                      Text('UV INDEX',style: TextStyle(fontSize: 18,color: Colors.grey.withOpacity(0.5),fontWeight: FontWeight.w600),)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 18.0,top: 10),
                                  child: Text('4\nModerate',style: TextStyle(color: Colors.white,fontSize: 28),),
                                ),
                                SizedBox(height: 30,),
                                //todo make a colorfull widget based on data here


                              ],
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: 17),
                          child: Container(
                            height: Get.width*0.45,
                            width: Get.width*0.43,
                            decoration: BoxDecoration(
                                color:Color(0xFF302261).withOpacity(0.8),
                                borderRadius: BorderRadius.circular(28),
                                border:Border.all(color: Color(0xFF6440b3),width: 0.7)
                            ),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Padding(
                                  padding:  EdgeInsets.only(left: 15.0,top: 15,),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 5.0),
                                        child: Icon(CupertinoIcons.sunrise_fill,color: Colors.grey.withOpacity(0.5),),
                                      ),
                                      Text('SUNRISE',style: TextStyle(fontSize: 18,color: Colors.grey.withOpacity(0.5),fontWeight: FontWeight.w600),)
                                    ],
                                  ),
                                ),

                                Padding(

                                  padding: EdgeInsets.only(left: 18.0,top: 10),
                                  child: Text(DateFormat('h:mm a').format(DateTime.now()),style: TextStyle(color: Colors.white,fontSize: 40),),
                                ),
                                SizedBox(height: 30,),
                                //todo make a colorfull widget based on data here
                                Divider(
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20.0),
                                  child: Text('Sunset: ${DateFormat('h:mma').format(DateTime.now())}',style: TextStyle(color: Colors.white,fontSize: 16),),
                                )


                              ],
                            ),
                          ),
                        )
                      ],
                    )
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






