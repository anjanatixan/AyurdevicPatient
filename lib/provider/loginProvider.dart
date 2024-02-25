import 'package:ayurvedic/helper/navigation.dart';
import 'package:ayurvedic/helper/utils.dart';
import 'package:ayurvedic/repo/loginRepo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/loginModel.dart';
import '../views/homePage.dart';

class LoginProvider with ChangeNotifier{
  LoginRepo loginRepo = LoginRepo();
  LoginModel? loginModel;
   String? username;
  String? password;

  setUserName(String text) {
    this.username = text;
  }

  setPassword(String text) {
    this.password = text;
  }

  login() async {
    showLoading(getContext());
    await loginRepo.Login();
    
  }

  setLoginModel(LoginModel model)async {
    this.loginModel = model;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("token", this.loginModel!.token.toString());
    NavigationUtils.goNextFinishAll(getContext(), HomeScreen());
    notifyListeners();
  }
}