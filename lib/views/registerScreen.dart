import 'package:ayurvedic/helper/colors.dart';
import 'package:ayurvedic/helper/navigation.dart';
import 'package:ayurvedic/helper/utils.dart';
import 'package:ayurvedic/widget/TextFormfiled.dart';
import 'package:ayurvedic/widget/button.dart';
import 'package:ayurvedic/widget/customDrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../provider/patienProvider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();
  final totalController = TextEditingController();
  final discountController = TextEditingController();
  final advanceController = TextEditingController();
  final balanceController = TextEditingController();
  int paymentOption = 0;
  int malequantity = 1;
  int femalequantity = 1;
  final _dateInput = TextEditingController();

  void maleincrementQuantity() {
    setState(() {
      malequantity++;
      getContext().read<PatientProvider>().setMale(malequantity);
    });
  }

  void maledecrementQuantity() {
    if (malequantity > 1) {
      setState(() {
        malequantity--;
        getContext().read<PatientProvider>().setMale(malequantity);
      });
    }
  }

  void femaleincrementQuantity() {
    setState(() {
      femalequantity++;
      getContext().read<PatientProvider>().setFemale(femalequantity);
    });
  }

  void femaledecrementQuantity() {
    if (femalequantity > 1) {
      setState(() {
        femalequantity--;
        getContext().read<PatientProvider>().setFemale(femalequantity);
      });
    }
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0), () async {
      await getContext().read<PatientProvider>().fetchBranchlist();
      await getContext().read<PatientProvider>().fetchTratmentlist();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            NavigationUtils.goBack(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: black,
          ),
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
      body: Consumer<PatientProvider>(builder: (context, provider, child) {
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("Register",
                  style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(
              height: 5.h,
            ),
            Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFieldContainer(
                    isValidated: true,
                    textEditingController: nameController,
                    validateMessage: 'This field is required',
                    keyboardType: TextInputType.name,
                    formatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp("[a-z A-Z0-9!-&@+-_]"))
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "WhatsApp Number",
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFieldContainer(
                    isValidated: true,
                    textEditingController: mobileController,
                    validateMessage: 'This field is required',
                    keyboardType: TextInputType.number,
                    formatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp("[a-zA-Z0-9@._+-]"),
                      ),
                      LengthLimitingTextInputFormatter(10)
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Address",
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFieldContainer(
                    isValidated: true,
                    textEditingController: addressController,
                    validateMessage: 'This field is required',
                    keyboardType: TextInputType.name,
                    formatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp("[a-z A-Z0-9!-& +-_]"))
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Location",
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomDropFiled(
                      items: ["Thrissur", "Kozhikode", "Ernakulam"],
                      onSelected: (value) {},
                      hint: "Choose your Location",
                      height: 40.h),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Branch",
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Consumer<PatientProvider>(
                      builder: (context, provider, child) {
                    return CustomDropFiled(
                        items: provider.branchModel != null &&
                                provider.branchModel!.branches.isNotEmpty
                            ? provider.branchModel!.branches
                                .map((e) => e.name)
                                .toList()
                            : [],
                        onSelected: (value) {
                          getContext()
                              .read<PatientProvider>()
                              .setBranch(value.toString());
                        },
                        hint: "Select the branch",
                        height: 40.h);
                  }),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Treatments",
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Consumer<PatientProvider>(
                                builder: (context, provider, child) {
                              return CustomDropFiled(
                                  items: provider.branchModel != null &&
                                          provider
                                              .branchModel!.branches.isNotEmpty
                                      ? provider.branchModel!.branches
                                          .map((e) => e.name)
                                          .toList()
                                      : [],
                                  onSelected: (value) {
                                    getContext()
                                        .read<PatientProvider>()
                                        .setTratement(value.toString());
                                  },
                                  hint: "Select the treatment",
                                  height: 40.h);
                            }),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Add patients",
                            style: GoogleFonts.poppins(
                                fontSize: 10.sp, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Text("Male         ",
                                  style: GoogleFonts.poppins(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500)),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green, // Set circle color
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: maledecrementQuantity,
                                  color: Colors.white, // Set icon color
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                malequantity.toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green, // Set circle color
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: maleincrementQuantity,
                                  color: Colors.white, // Set icon color
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Text("Female     ",
                                  style: GoogleFonts.poppins(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500)),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green, // Set circle color
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: femaledecrementQuantity,
                                  color: Colors.white, // Set icon color
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                femalequantity.toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green, // Set circle color
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: femaleincrementQuantity,
                                  color: Colors.white, // Set icon color
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Total amount",
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFieldContainer(
                    isValidated: true,
                    textEditingController: totalController,
                    validateMessage: 'This field is required',
                    keyboardType: TextInputType.name,
                    formatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp("[a-z A-Z0-9!-&@+-_]"))
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Discount amount",
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFieldContainer(
                    isValidated: true,
                    textEditingController: discountController,
                    validateMessage: 'This field is required',
                    keyboardType: TextInputType.name,
                    formatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp("[a-z A-Z0-9!-&@+-_]"))
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Advance amount",
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFieldContainer(
                    isValidated: true,
                    textEditingController: advanceController,
                    validateMessage: 'This field is required',
                    keyboardType: TextInputType.name,
                    formatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp("[a-z A-Z0-9!-&@+-_]"))
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Balance amount",
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFieldContainer(
                    isValidated: true,
                    textEditingController: balanceController,
                    validateMessage: 'This field is required',
                    keyboardType: TextInputType.name,
                    formatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp("[a-z A-Z0-9!-&@+-_]"))
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Payment option",
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            paymentOption = 0;
                            setState(() {
                              getContext()
                                  .read<PatientProvider>()
                                  .setPayment("CASH");
                            });
                          },
                          child: Container(
                            height: 40.h,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(
                                    color: paymentOption == 0 ? green : white),
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    "cash",
                                    style: GoogleFonts.poppins(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            paymentOption = 1;
                            setState(() {
                              getContext()
                                  .read<PatientProvider>()
                                  .setPayment("CARD");
                            });
                          },
                          child: Container(
                            height: 40.h,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(
                                    color: paymentOption == 1 ? green : white),
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    "CARD",
                                    style: GoogleFonts.poppins(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            paymentOption = 2;
                            setState(() {
                              getContext()
                                  .read<PatientProvider>()
                                  .setPayment("UPI");
                            });
                          },
                          child: Container(
                            height: 40.h,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(
                                    color: paymentOption == 2 ? green : white),
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Row(
                                children: [
                                  Text(
                                    "UPI",
                                    style: GoogleFonts.poppins(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Tratment date",
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Container(
                          height: 42.h,
                          child: TextFormField(
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  initialEntryMode:
                                      DatePickerEntryMode.calendarOnly,
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2100));

                              if (pickedDate != null) {
                                print(
                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                String newFormatedDate =
                                    DateFormat('dd-MM-yyyy').format(pickedDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                setState(() {
                                  _dateInput.text = newFormatedDate;
                                  //set output date to TextField value.
                                });
                              } else {}
                            },
                            style: GoogleFonts.lato(
                                fontSize: 12.sp, fontWeight: FontWeight.w400),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: _dateInput,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () async {
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                              initialEntryMode:
                                                  DatePickerEntryMode
                                                      .calendarOnly,
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(1950),
                                              //DateTime.now() - not to allow to choose before today.
                                              lastDate: DateTime(2100));

                                      if (pickedDate != null) {
                                        print(
                                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                        String formattedDate =
                                            DateFormat('yyyy-MM-dd')
                                                .format(pickedDate);
                                        String newFormatedDate =
                                            DateFormat('dd-MM-yyyy')
                                                .format(pickedDate);
                                        print(
                                            formattedDate); //formatted date output using intl package =>  2021-03-16
                                        setState(() {
                                          _dateInput.text = newFormatedDate;
                                          //set output date to TextField value.
                                        });
                                      } else {}
                                    },
                                    icon: Icon(
                                      Icons.calendar_month_outlined,
                                      color: black,
                                    )),
                                filled: true,
                                fillColor: Colors.grey.shade100,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 14.h, horizontal: 10.w),
                                hintStyle: GoogleFonts.lato(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: "DD/MM/YYYY"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Treatment hour",
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomDropFiled(
                      items: ["11. am", "12. pm", "4. pm"],
                      onSelected: (value) {},
                      hint: "Choose time",
                      height: 40.h),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomButton(
                      text: "SAVE",
                      onpress: () async {
                        if (balanceController.text.isEmpty) {
                          showToast(context, "Fields are required",
                              Colors.black, white);
                        } else {
                          await getContext()
                              .read<PatientProvider>()
                              .setName(nameController.text);
                          await getContext()
                              .read<PatientProvider>()
                              .setExecutive(nameController.text);

                          await getContext()
                              .read<PatientProvider>()
                              .setPhone(mobileController.text);
                          await getContext()
                              .read<PatientProvider>()
                              .setAddress(addressController.text);
                          await getContext()
                              .read<PatientProvider>()
                              .setTotalAmount(totalController.text);
                          await getContext()
                              .read<PatientProvider>()
                              .setDiscountAmount(discountController.text);
                          await getContext()
                              .read<PatientProvider>()
                              .setAdvanceAmount(advanceController.text);
                          await getContext()
                              .read<PatientProvider>()
                              .setBalanceAmount(balanceController.text);
                          await getContext()
                              .read<PatientProvider>()
                              .setDate(_dateInput.text);
                          await getContext()
                              .read<PatientProvider>()
                              .setId("21");

                          await getContext().read<PatientProvider>().Register();
                        }
                      },
                      context: context),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
