// import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:markshark_mvc/constants/expo_all_const.dart';
import 'package:markshark_mvc/controller/fetch_app_Ddata_controller.dart';
import 'package:markshark_mvc/controller/login_screen/login_controller.dart';
import 'package:markshark_mvc/utils/tools.dart';

class GoogleSigninClass {
  Tools tools = Tools();
  LoginController _loginController = LoginController();

  GoogleSignInAccount _currentUser;
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      // 'photos',
      // 'https://www.googleapis.com/auth/classroom.profile.photos'

      // 'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  handleSignIn() async {
    print("Inside handleSignIn ");
    // tools.setshared(UserEmail, "mishra@tester.com");
    // tools.setshared(UserId, "12");
    try {
      await _googleSignIn.signIn().then((user) {
        LoginController.isLoading.value = false;
        if (user != null) {
          print(user.displayName);
          print(user.email);
          print(user.photoUrl);

          if (user.displayName.toString() != "null" ||
              user.displayName.toString() != "") {
            // _loginController.fetchUserData(user.displayName, user.email);
            tools.setshared(UserPhoto, user.photoUrl);
          }
        }

        // _checkLogin(user.email, "", 'google');
      });
    } on PlatformException catch (e) {
      LoginController.isLoading.value = false;

      print('socketeee: $e');
      Get.snackbar("No Internet", "Check Internet Connectivity",
          duration: Duration(seconds: 1),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black45,
          margin: EdgeInsets.only(bottom: 10, left: 10, right: 10));
    } on SocketException catch (e) {
      print('socketeee: $e');
      Get.snackbar(
        "No Internet",
        "Check Internet Connectivity",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black45,
      );
    } on Error catch (e) {
      LoginController.isLoading.value = false;

      print('in catch--');
      print('Error: $e');
    }
  }
}
