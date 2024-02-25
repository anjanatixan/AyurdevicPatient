import 'package:ayurvedic/helper/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CustomDropFiled extends StatelessWidget {
  final List<String>? items;
  final Function(String)? onSelected;
  final String? hint;
  String? selectedValue;
  final double height;

  CustomDropFiled(
      {@required this.items,
      @required this.onSelected,
      @required this.hint,
      this.selectedValue,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: white),
          child: DropdownButtonFormField2(
            decoration: InputDecoration(
              //Add isDense true and zero Padding.
              //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(20)),
              //Add more decoration as you want here
              //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
            ),
            isExpanded: true,
            hint: Text(hint!,
                style:
                    GoogleFonts.poppins(fontSize: 10.sp, color: Colors.grey)),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 30,
            buttonHeight: 50,
            buttonPadding: const EdgeInsets.only(right: 10),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            value: selectedValue,
            items: items!
                .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item,
                        style: GoogleFonts.poppins(fontSize: 10.sp))))
                .toList(),
            onChanged: (value) {
              onSelected!(value.toString());
              //Do something when changing the item if you want.
            },
            onSaved: (value) {
              // selectedValue = value.toString();
            },
          ),
        ),
      ],
    );
  }
}
