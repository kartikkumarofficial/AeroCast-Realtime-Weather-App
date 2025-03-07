import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        color: Colors.purple,
        child: DraggableScrollableSheet(
          initialChildSize: 0.3,
          minChildSize: 0.1,
          maxChildSize: 0.8,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.transparent.withOpacity(0.5),
                borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40))
              ),
              child:Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Container(
                          height: Get.width*0.018,
                          width: Get.width*0.15,
                          decoration: BoxDecoration(
                              color: Color(0xFF333333).withOpacity(0.4),
                              borderRadius: BorderRadius.circular(030)
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text('Hourly Forecast',style: TextStyle(color: Colors.white60,fontSize: 14,fontWeight: FontWeight.bold ,
                            shadows: [BoxShadow(color: Colors.black,offset: Offset(0, 1),blurRadius: 2,spreadRadius: 2)]),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: Get.width*0.3),
                        child: Text('Weekly Forecast',style: TextStyle(color: Colors.white60,fontSize: 14,fontWeight: FontWeight.bold ,
                            shadows: [BoxShadow(color: Colors.black,offset: Offset(0, 1),blurRadius: 2,spreadRadius: 2)]),),
                      )
                    ],
                  ),
                  Divider(color: Colors.white30.withOpacity(0.5),thickness: 0.5,),
                  ListView(
                    scrollDirection: Axis.horizontal,
                    children: [

                    ],
                  )

                ],
              ) ,
            );
          },),
      ),
    );
  }
}
