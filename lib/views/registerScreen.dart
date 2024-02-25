import 'package:ayurvedic/helper/colors.dart';
import 'package:ayurvedic/helper/navigation.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: InkWell(
          onTap: (){
              NavigationUtils.goBack(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: black,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
              
              },
              icon: Icon(
                Icons.notifications_none,
                color: Colors.black,
              ))
        ],
      ),
    );
  }
}