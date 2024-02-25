import 'dart:developer';

import 'package:ayurvedic/helper/navigation.dart';
import 'package:ayurvedic/helper/utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   @override
  void initState() {
    IsLogedIn(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: Stack(
        children: [
           Container(
            width: getWidth(context),
            height: getHeight(context),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/splashScreen.png"),
                    fit: BoxFit.cover)),
          ),
         
        ],
      ),
    );
  }
}

IsLogedIn(BuildContext context) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var token = preferences.getString("token");

  log(token.toString());
  if (token == null) {
    Future.delayed(Duration(seconds: 1)).then((value) async {
      NavigationUtils.goNextFinishAll(context, LoginScreen());
    });
  } else {
    Future.delayed(Duration(seconds: 1)).then((value) {
     NavigationUtils.goNextFinishAll(context, LoginScreen());
    });
  }
}