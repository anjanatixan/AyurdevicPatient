import 'package:ayurvedic/helper/utils.dart';
import 'package:ayurvedic/provider/loginProvider.dart';
import 'package:ayurvedic/widget/TextFormfiled.dart';
import 'package:ayurvedic/widget/button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20),
        child: Text.rich(
          TextSpan(
            text:
                'By creating or logging into an account you are agreeing with our ',
            style: GoogleFonts.poppins(
                fontSize: 10.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
            children: [
              TextSpan(
                text: 'Terms & Conditions',
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.blue,
                  fontWeight: FontWeight.w400,
                 
                ),
                // Add a gesture recognizer for the Terms & Conditions link
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
              TextSpan(
                text: ' and ',
                style: TextStyle(),
              ),
              TextSpan(
                text: 'Privacy Policy',
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.blue,
                  fontWeight: FontWeight.w400,
                 
                ),
                // Add a gesture recognizer for the Privacy Policy link
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: ListView(
        children: [
          Container(
            width: getWidth(context),
            height: 180.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/splashScreen.png"),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Login or register to book your appointments",
                    style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600)),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Username",
                  style: GoogleFonts.poppins(
                      fontSize: 10.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextFieldContainer(
                  isValidated: true,
                  textEditingController: usernameController,
                  text: "Enter your username",
                  validateMessage: 'This field is required',
                  keyboardType: TextInputType.emailAddress,
                  formatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp("[a-zA-Z0-9@._+-]"))
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Password",
                  style: GoogleFonts.poppins(
                      fontSize: 10.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextFieldContainer(
                  isValidated: true,
                  text: "Enter your password",
                  textEditingController: passwordController,
                  validateMessage: 'This field is required',
                  keyboardType: TextInputType.name,
                  formatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp("[a-z A-Z0-9!-&@+-_]"))
                  ],
                ),
                SizedBox(
                  height: 100.h,
                ),
                CustomButton(text: "Login", onpress: () async{
                    if (usernameController.text.isEmpty) {
                  showToast(
                      context, "Enter your username", Colors.black, Colors.white);
                }else if(passwordController.text.isEmpty){
                    showToast(
                      context, "Enter your password", Colors.black, Colors.white);
                }else{
                 await getContext().read<LoginProvider>().setUserName(usernameController.text);
                 await getContext().read<LoginProvider>().setPassword(passwordController.text);
                 hideKeyBoard();
                await getContext().read<LoginProvider>().login();
                }
                }, context: context),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
