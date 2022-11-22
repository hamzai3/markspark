import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markshark_mvc/api_Service/register_api.dart';
import 'package:markshark_mvc/model/register_model.dart';
import 'package:markshark_mvc/screens/loginScreen.dart';
import 'package:markshark_mvc/utils/tools.dart';

import '../../constants/expo_all_const.dart';

class RegisterController extends GetxController {
  static RxBool isLoading = false.obs;

  final Rx<TextEditingController> userIdController =
      TextEditingController().obs;
  final Rx<TextEditingController> emailController = TextEditingController().obs;
  final Rx<TextEditingController> passwordController =
      TextEditingController().obs;
  final Rx<TextEditingController> confpasswordController =
      TextEditingController().obs;
  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  Tools tools = Tools();

  saveProfile() async {
    RegisterModel _loginModel = await RegisterApi.saveProfile(
        userIdController.value.text,
        emailController.value.text,
        passwordController.value.text);

    if (_loginModel.response[0].status == "success") {
      // _selectAvatarPopup.showBottomSheet();
      if (_loginModel.response[0].reason == "account_inserted") {
        Get.snackbar("Registration successful",
            "Email verification link sent, Kindly verify and login",
            backgroundColor: Colors.green,
            colorText: white_color,
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 2),
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8));
        Future.delayed(const Duration(milliseconds: 1000), () {
          Get.offAll(LoginScreen());
        });
      }
      userIdController.value.clear();
      passwordController.value.clear();
      emailController.value.clear();
    }
  }
}
