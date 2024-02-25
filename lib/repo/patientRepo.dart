import 'dart:convert';
import 'dart:developer';
import 'package:ayurvedic/apiServices/urls.dart';
import 'package:ayurvedic/apiServices/webService.dart';
import 'package:ayurvedic/helper/navigation.dart';
import 'package:ayurvedic/helper/utils.dart';
import 'package:ayurvedic/models/branchModel.dart';
import 'package:ayurvedic/models/patientModel.dart';
import 'package:ayurvedic/models/treatmentModel.dart';
import 'package:ayurvedic/provider/patienProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PatientRepo {
  ApiService _service = ApiService();

  Future<String> getPatientlist() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString("token");
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token}"
    };

    final response = await _service.getResponse(Urls.PATIENT_LIST, headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      PatientListModel model = PatientListModel.fromJson(responseBody);
      getContext().read<PatientProvider>().setPatientList(model);
    } else {
      // NavigationUtils.goBack(getContext());
      //    Map<String, dynamic> responseBody = jsonDecode(response.body);
      // showToast(getContext(), responseBody["message"], Colors.red, Colors.red);
    }
    return "";
  }

  Future<String> getBranchlist() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString("token");
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token}"
    };

    final response = await _service.getResponse(Urls.BRANCH_LIST, headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      BranchModel model = BranchModel.fromJson(responseBody);
      getContext().read<PatientProvider>().setBranchList(model);
      log("message" + responseBody.toString());
    } else {
      
    }
    return "";
  }

  Future<String> getTreatmentlist() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString("token");
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token}"
    };

    final response = await _service.getResponse(Urls.TREATMENT_LIST, headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      TreatmentModel model = TreatmentModel.fromJson(responseBody);
      getContext().read<PatientProvider>().setTreatmentList(model);
      log("message" + responseBody.toString());
    } else {
      
    }
    return "";
  }

  Future<String> submitForm() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString("token");
    Map<String, String> headers = {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Bearer ${token}"
    };

    var body = {
      "name":   getContext().read<PatientProvider>().name,
      "executive":   getContext().read<PatientProvider>().executive,
      "payment":  getContext().read<PatientProvider>().payment,
      "phone":  getContext().read<PatientProvider>().phone,
      "address":   getContext().read<PatientProvider>().address,
      "total_amount":   getContext().read<PatientProvider>().total_amount,
      "discount_amount":   getContext().read<PatientProvider>().discount_amount,
      "advance_amount": getContext().read<PatientProvider>().advance_amount,
      "balance_amount":getContext().read<PatientProvider>().balance_amount,
      "date_nd_time": getContext().read<PatientProvider>().date_nd_time,
      "id": 21,
      "male": getContext().read<PatientProvider>().male,
      "female":getContext().read<PatientProvider>().female,
      "branch": getContext().read<PatientProvider>().branch,
      "treatments": getContext().read<PatientProvider>().treatment
    };

    var formData = body.entries
        .map((e) => '${e.key}=${Uri.encodeComponent(e.value.toString())}')
        .join('&');

    final response = await http.post(
        Uri.parse("https://flutter-amr.noviindus.in/api/PatientUpdate"),
        body: formData,
        headers: headers);

    // Check the response status code
    if (response.statusCode == 200) {
      NavigationUtils.goBack(getContext());
      final responseBody = jsonDecode(response.body);

      log("message" + responseBody.toString());
    } else {
       NavigationUtils.goBack(getContext());
      showToast(getContext(), "Patient not found", Colors.black, Colors.white);
    }

    return "";
  }
}
