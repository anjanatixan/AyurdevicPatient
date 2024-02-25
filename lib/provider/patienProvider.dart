import 'package:ayurvedic/helper/navigation.dart';
import 'package:ayurvedic/helper/utils.dart';
import 'package:ayurvedic/models/branchModel.dart';
import 'package:ayurvedic/models/treatmentModel.dart';
import 'package:ayurvedic/repo/patientRepo.dart';
import 'package:flutter/material.dart';

import '../models/patientModel.dart';

class PatientProvider with ChangeNotifier {
  PatientListModel? patientListModel;
  BranchModel? branchModel;
  TreatmentModel? treatmentModel;
  PatientRepo patientRepo = PatientRepo();
  String? name;
  String? executive;
  String? payment;
  String? phone;
  String? address;
  String? total_amount;
  String? discount_amount;
  String? advance_amount;
  String? balance_amount;
  String? date_nd_time;
  String? id;
  int? male;
  int? female;
  String? branch;
  String? treatment;

  
  setName(String text) {
    this.name = text;
  }
  
  setExecutive(String text) {
    this.executive = text;
  }

   setPayment(String text) {
    this.payment = text;
  }
  
  setPhone(String text) {
    this.phone = text;
  }
  
  setAddress(String text) {
    this.address = text;
  }
  
  setTotalAmount(String text) {
    this.total_amount = text;
  }

  
  setDiscountAmount(String text) {
    this.discount_amount = text;
  }
  
  setAdvanceAmount(String text) {
    this.advance_amount = text;
  }
  
  setBalanceAmount(String text) {
    this.balance_amount = text;
  }
  
  setDate(String text) {
    this.date_nd_time = text;
  }

  
  setId(String text) {
    this.id = text;
  }
  
  setMale(int text) {
    this.male = text;
  }


  setFemale(int text) {
    this.female = text;
  }

  
  setBranch(String text) {
    this.branch = text;
  }
  
  setTratement(String text) {
    this.treatment = text;
  }
  fetchPatientlist() async {
    showLoading(getContext());
    await patientRepo.getPatientlist();
    NavigationUtils.goBack(getContext());
  }

  setPatientList(PatientListModel model) {
    this.patientListModel = model;
    notifyListeners();
  }

  fetchBranchlist() async {
    showLoading(getContext());
    await patientRepo.getBranchlist();
    NavigationUtils.goBack(getContext());
  }

  setBranchList(BranchModel model) {
    this.branchModel = model;
    notifyListeners();
  }

  fetchTratmentlist() async {
    showLoading(getContext());
    await patientRepo.getTreatmentlist();
    NavigationUtils.goBack(getContext());
  }

  setTreatmentList(TreatmentModel model) {
    this.treatmentModel = model;
    notifyListeners();
  }

  Register() async {
    showLoading(getContext());
    await patientRepo.submitForm();
  }
}
