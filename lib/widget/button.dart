import 'package:ayurvedic/helper/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatefulWidget {
  String text;
  VoidCallback onpress;
  BuildContext context;
  Icon? IconsData;

  CustomButton(
      {required this.text,
      required this.onpress,
      required this.context,
      this.IconsData});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      child: ElevatedButton(
        onPressed: widget.onpress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: GoogleFonts.poppins(fontSize: 10.sp, color: white),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: green,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r))),
      ),
    );
  }
}

class ButtonIcon extends StatefulWidget {
  String text;
  VoidCallback onpress;
  BuildContext context;
  Icon? IconsData;

  ButtonIcon(
      {required this.text,
      required this.onpress,
      required this.context,
      this.IconsData});

  @override
  State<ButtonIcon> createState() => _ButtonIconState();
}

class _ButtonIconState extends State<ButtonIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      child: ElevatedButton(
        onPressed: widget.onpress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: GoogleFonts.poppins(fontSize: 10.sp, color: white),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 14.sp,
              ),
            )
          ],
        ),
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: green,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r))),
      ),
    );
  }
}
