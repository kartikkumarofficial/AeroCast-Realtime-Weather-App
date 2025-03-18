import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OtherCities extends StatefulWidget {
  const OtherCities({super.key});

  @override
  State<OtherCities> createState() => _OtherCitiesState();
}

class _OtherCitiesState extends State<OtherCities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2b2f54).withOpacity(1),
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: IconButton(onPressed: (){Get.back();}, icon:Icon(Icons.arrow_back_ios,color: Colors.white,size: 25,)),
        ),
        title: Padding(
          padding:  EdgeInsets.only(right:20),
          child: Text(
            "Weather",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        // centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white,size: 30,),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
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
            
            Container(
              color: Colors.red,
              child:Stack(
                children: [
                  Image.asset('assets/images/container.png',width: Get.width*0.9,height: Get.width*0.45,),
                  Positioned(
                      left: Get.width*0.06,
                      top: Get.width*0.06,
                      child: Text('24°',style:
                      GoogleFonts.workSans(
                        fontWeight: FontWeight.w500,
                        fontSize: Get.width*0.17,
                        color: Colors.white
                      ),)),
                  
                  Positioned(
                      left: Get.width*0.06,
                      top: Get.width*0.27,
                      child: Text('H: 26° L:-16°',style:
                      GoogleFonts.workSans(
                        fontWeight: FontWeight.w500,
                        fontSize: Get.width*0.04,
                        color: Colors.white.withOpacity(0.5)
                      ),)),
                  Positioned(
                      left: Get.width*0.06,
                      top: Get.width*0.32,
                      child: Text('Montral, Canada',style:
                      GoogleFonts.workSans(
                        fontWeight: FontWeight.w500,
                        fontSize: Get.width*0.05,
                        color: Colors.white
                      ),)),
                  Positioned(
                      right: Get.width*0.06,
                      top: Get.width*0.33,
                      child: Text('Mostly Sunny',style:
                      GoogleFonts.workSans(
                        fontWeight: FontWeight.w500,
                        fontSize: Get.width*0.04,
                        color: Colors.white
                      ),)),
                  Positioned(
                      right: Get.width*0.06 ,
                      top: Get.width*0.025,
                      child: Image.asset('assets/images/weather icons/sun.png',height: Get.width*0.25,)
                  ),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
