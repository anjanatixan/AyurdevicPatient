import 'package:ayurvedic/helper/colors.dart';
import 'package:ayurvedic/helper/navigation.dart';
import 'package:ayurvedic/helper/utils.dart';
import 'package:ayurvedic/provider/patienProvider.dart';
import 'package:ayurvedic/widget/button.dart';
import 'package:ayurvedic/widget/customDrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'registerScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   @override
  void initState() {
    Future.delayed(Duration(seconds: 0), () async {
      await getContext().read<PatientProvider>().fetchPatientlist();
     
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 12,right: 12,bottom: 15),
        child: CustomButton(text: "Register Now", onpress: (){
          NavigationUtils.goNext(context, RegisterScreen());
        }, context: context),
      ),
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back,
          color: black,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none,
                color: Colors.black,
              ))
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.0), // Adjust padding as needed
                    height: 40.h, // Adjust height as needed
                    decoration: BoxDecoration(
                      color: white, // Background color of the container
                      borderRadius: BorderRadius.circular(
                          8.0), // Adjust border radius as needed
                      border: Border.all(
                        color: Colors.grey.shade300, // Border color
                        width: 1.0, // Border width
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          size: 20.sp,
                          color: Colors.grey.shade300,
                        ), // Icon for search
                        SizedBox(
                            width:
                                8.0), // Add spacing between icon and text field
                        Expanded(
                          child: TextField(
                            style: GoogleFonts.poppins(
                                fontSize: 10.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                            decoration: InputDecoration(
                              hintText: 'Search...',

                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 10.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                              border:
                                  InputBorder.none, // Hide text field border
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                    height: 40.h,
                    width: 100.w,
                    child: CustomButton(
                        text: 'Search', onpress: () {}, context: context))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: Text("Sort by : ",
                      style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                ),
                Expanded(
                  child: Container(
                    width: 50.w,
                    height: 35.h,
                    child: CustomDropFiled(
                        items: [],
                        onSelected: (value) {},
                        hint: "Date",
                        height: 40.h),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
          ),
          ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                   margin: EdgeInsets.symmetric(vertical: 8.0,horizontal: 12),
                  // padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color:
                        Colors.grey[200], // Background color of the container
                    borderRadius: BorderRadius.circular(
                        8.0), // Adjust border radius as needed
                  ),
                  child: Column(
                    children: [
                       SizedBox(height: 5.h,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           
                            Text("1.  ",
                                style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500)),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("name",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500)),
                                Text("address",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12.sp,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w300)),
                                        SizedBox(height: 5.h,),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month_outlined,
                                      color: red,
                                      size: 18.sp,
                                    ),
                                    Text(" 2333",
                                        style: GoogleFonts.poppins(
                                            fontSize: 12.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w300)),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Icon(
                                      Icons.group_outlined,
                                      color: red,
                                      size: 18.sp,
                                    ),
                                    Text(" dbjhb",
                                        style: GoogleFonts.poppins(
                                            fontSize: 12.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w300)),
                                  ],
                                ),
                               
                               
                              ],
                            ),
                          ],
                        ),
                      ),
                       Divider(
                                thickness: 1,
                                
                              
                              ),
                               Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 15),
                                 child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text(
                                        "View booking details ",
                                        style: GoogleFonts.poppins(
                                            fontSize: 12.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w300),
                                        textAlign: TextAlign.center,
                                      ),
                                      Icon(Icons.arrow_forward_ios,size: 16.sp,color: green,)
                                   ],
                                 ),
                               ),
                               SizedBox(height: 10,)
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
