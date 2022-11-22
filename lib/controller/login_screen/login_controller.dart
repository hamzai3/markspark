import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markshark_mvc/api_Service/login_api.dart';
import 'package:markshark_mvc/common_widget/avatar_popup_widget.dart';
import 'package:markshark_mvc/constants/expo_all_const.dart';
import 'package:markshark_mvc/controller/fetch_app_Ddata_controller.dart';
import 'package:markshark_mvc/model/login_model.dart';
import 'package:markshark_mvc/model/select_gender_model.dart';
import 'package:markshark_mvc/utils/google_signin/googleSignin.dart';
import 'package:markshark_mvc/utils/tools.dart';

class LoginController extends GetxController {
  static RxBool isLoading = false.obs;

  final Rx<TextEditingController> userIdController =
      TextEditingController().obs;
  final Rx<TextEditingController> passwordController =
      TextEditingController().obs;
  Rx<GlobalKey<FormState>> loginformKey = GlobalKey<FormState>().obs;

  FetAppDataCotroller _fetAppDataCotroller = FetAppDataCotroller();
  Tools tools = Tools();
  googleSigin() {
    GoogleSigninClass _googleSigninClass = GoogleSigninClass();
    print("inside googleSigin");
    _googleSigninClass.handleSignIn();
    // Get.to(SelectSubject(), transition: Transition.rightToLeft, duration: Duration(milliseconds: 1000));
  }

  checkLogin() {
    print("${passwordController.value.text} , ${userIdController.value.text}");
  }

  fetchUserData() async {
    LoginModel _loginModel = await LoginApi.fetchProfile(
        userIdController.value.text, passwordController.value.text);
    SelectAvatarPopup _selectAvatarPopup = SelectAvatarPopup();

    if (_loginModel.response[0].status == "success") {
      tools.setshared(UserEmail, _loginModel.response[0].email.toString());
      tools.setshared(UserName, _loginModel.response[0].username.toString());
      tools.setshared(UserId, _loginModel.response[0].id.toString());
      tools.setshared(
          UserGender,
          _loginModel.response[0].gender.toString().toLowerCase() == "male"
              ? "assets/Male.png"
              : "assets/Female.png");

      // _selectAvatarPopup.showBottomSheet();
      if (_loginModel.response[0].reason == "account_inserted" ||
          _loginModel.response[0].gender.toString() == "null") {
        _selectAvatarPopup
            .showBottomSheet(_loginModel.response[0].email.toString());
      } else {
        _fetAppDataCotroller.fetchData();
      }
      userIdController.value.clear();
      passwordController.value.clear();
    } else if (_loginModel.response[0].status == "failed") {
      if (_loginModel.response[0].reason == "auth_pending") {
        Get.snackbar("Authentication pending", "Email authentication pending",
            backgroundColor: Colors.red,
            colorText: white_color,
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8));
      } else {
        Get.snackbar("Wrong Credentials", "Try Again",
            backgroundColor: Colors.red,
            colorText: white_color,
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8));
      }
    } else {
      Get.snackbar("Wrong Credentials", "Try Again",
          backgroundColor: Colors.red,
          colorText: white_color,
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8));
    }
  }

  fetchUserGenderData(email, gender) async {
    SelectGenderModel _loginModel = await LoginApi.storeGender(email, gender);
    print(
        "SelectGenderModel _loginModel.response[0] ${_loginModel.response[0]}");
    tools.setshared(
        UserGender,
        gender.toString().toLowerCase() == "male"
            ? "assets/Male.png"
            : "assets/Female.png");

    if (_loginModel.response[0].status == "success") {
      _fetAppDataCotroller.fetchData();
    } else {
      _fetAppDataCotroller.fetchData();
    }

    // print("${leaderBoardList.value}");
  }
}
