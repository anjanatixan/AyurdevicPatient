import 'package:ayurvedic/helper/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldContainer extends StatefulWidget {
  TextEditingController textEditingController;
  String? validateMessage;
  String? text;
  String? prefixText;
  bool? isValidated = false;
  TextInputType? keyboardType;
  List<TextInputFormatter>? formatters = [];
  int? length;

  TextFieldContainer(
      {Key? key,
      required this.textEditingController,
      this.text,
      this.prefixText,
      this.keyboardType,
      this.validateMessage,
      this.isValidated,
      this.formatters,
      this.length})
      : super(key: key);

  @override
  State<TextFieldContainer> createState() => _TextFieldContainerState();
}

class _TextFieldContainerState extends State<TextFieldContainer> {
  @override
  Widget build(BuildContext context) {
    return widget.isValidated == true
        ? Stack(
            children: [
             
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: widget.textEditingController,
                keyboardType: widget.keyboardType,
                maxLength: widget.length,
                style: GoogleFonts.poppins(fontSize: 10.sp),
                inputFormatters:
                    widget.formatters != null ? widget.formatters : [],
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 2.h, left: 10.w),
                    filled: true,
                    prefixText: widget.prefixText,
                    fillColor: Colors.grey.shade200,
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 10.sp, fontWeight: FontWeight.w400),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: widget.text),
                validator: (value) => value == null || value.isEmpty
                    ? "${widget.validateMessage}"
                    : null,
              ),
            ],
          )
        : Stack(
            children: [   
              TextFormField(
                controller: widget.textEditingController,
                keyboardType: widget.keyboardType,
                maxLength: widget.length,
                inputFormatters:
                    widget.formatters != null ? widget.formatters : [],
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 3.h, left: 10.w),
                    filled: true,
                    fillColor: white,
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 10.sp, fontWeight: FontWeight.w400),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: widget.text),
              ),
            ],
          );
  }
}

// ContainerTextField({required TextEditingController textEditingController}) {
//   return TextFormField(
//     maxLength: 250,
//     controller: textEditingController,
//     autovalidateMode: AutovalidateMode.onUserInteraction,
//     // minLines: 4,
//     maxLines: 3,
//     style: GoogleFonts.poppins(fontSize: 12.sp),
//     keyboardType: TextInputType.multiline,
//     decoration: InputDecoration(
//       contentPadding: EdgeInsets.only(bottom: 3.h, left: 10.w, top: 3.h),
//       filled: true,
//       fillColor: white,
//       hintStyle: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w400),
//       focusedBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: Colors.white),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       enabledBorder: UnderlineInputBorder(
//         borderSide: BorderSide(color: Colors.white),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       errorBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: Colors.white),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       focusedErrorBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: Colors.white),
//         borderRadius: BorderRadius.circular(10),
//       ),
//     ),
//     validator: (value) {
//       if (value!.isEmpty) {
//         return "This field is required";
//       }
//       return null;
//     },
//   );
// }
