import 'package:ayurvedic/helper/navigation.dart';
import 'package:ayurvedic/helper/utils.dart';
import 'package:ayurvedic/repo/patientRepo.dart';
import 'package:flutter/material.dart';

import '../models/patientModel.dart';

class PatientProvider with ChangeNotifier{
 PatientListModel? patientListModel;
  PatientRepo patientRepo = PatientRepo();

  fetchPatientlist() async {
    showLoading(getContext());
    await patientRepo.getPatientlist();
    NavigationUtils.goBack(getContext());
  }

   setPatientList(PatientListModel model) {
    this.patientListModel = model;
    notifyListeners();
  }
}