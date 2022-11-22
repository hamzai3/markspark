import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markshark_mvc/controller/splash_screen/splashscreen_controller.dart';
import 'package:markshark_mvc/utils/tools.dart';
import '../constants/expo_all_const.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key key}) : super(key: key);

  // further navigation written in oninit of controller
  final SplashScreenController _splashScreenController =
      Get.put(SplashScreenController());

  Tools tools = Tools();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white_color,
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // Image.asset(
            //   "assets/shark_fin.png",
            //   width: tools.getWidth(context) * 0.3,
            //   fit: BoxFit.cover,
            // ),
            Image.asset(
              "assets/logo.png",
              width: tools.getWidth(context) * 0.9,
              fit: BoxFit.cover,
            ),
          ]),
        ));
  }
}
