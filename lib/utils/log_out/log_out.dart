import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markshark_mvc/controller/login_screen/login_controller.dart';
import 'package:markshark_mvc/screens/loginScreen.dart';
import 'package:markshark_mvc/utils/tools.dart';
import '../../constants/expo_all_const.dart';

class LogOut {
  
  Tools tools = Tools();
  logout(){
    LoginController.isLoading.value = false;
    tools.setshared(UserId, "");
    tools.setshared(UserName, "");
    tools.setshared(UserEmail, "");
    tools.setshared(UserContact, "");
    tools.setshared(UserPhoto, "");
    tools.setshared(UserGender, "");
    Get.offUntil(MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
  }
}