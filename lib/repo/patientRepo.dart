import 'dart:convert';
import 'dart:developer';

import 'package:ayurvedic/apiServices/urls.dart';
import 'package:ayurvedic/apiServices/webService.dart';
import 'package:ayurvedic/helper/utils.dart';
import 'package:ayurvedic/models/patientModel.dart';
import 'package:ayurvedic/provider/patienProvider.dart';
import 'package:provider/provider.dart';

class PatientRepo{
   ApiService _service = ApiService();

  Future<String> getPatientlist() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    final response = await _service.getResponse(
        Urls.PATIENT_LIST, headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      PatientListModel model = PatientListModel.fromJson(responseBody);
      getContext().read<PatientProvider>().setPatientList(model);
      log("message" + responseBody.toString());
    } else {
      // NavigationUtils.goBack(getContext());
      //    Map<String, dynamic> responseBody = jsonDecode(response.body);
      // showToast(getContext(), responseBody["message"], Colors.red, Colors.red);
    }
    return "";
  }
}