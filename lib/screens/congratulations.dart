import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markshark_mvc/constants/color_const.dart';
import 'package:markshark_mvc/screens/selectSubject.dart';

import '../utils/tools.dart';

class Congratulations extends StatelessWidget {
  Congratulations({Key key}) : super(key: key);

  Tools tools = Tools();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      // appBar: tools.getApAppBar(context, isback: true, title: "Profile",color :Color(0xffFACB21)),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            "assets/standing_shark_gif.gif",
            width: tools.getWidth(context) * 1,
            // height: 400,
            fit: BoxFit.contain,
          ),
          Divider(
            height: MediaQuery.of(context).size.height * 0.01,
            color: Colors.transparent,
          ),
          Text(
            "Well Done ",
            style: TextStyle(
                color: primary_blue,
                fontWeight: FontWeight.bold,
                fontSize: tools.getFontSizeLarge(context) + 10,
                fontFamily: tools.getFontFamily()),
          ),
          Text(
            "Correct answer",
            style: TextStyle(
                color: primary_blue,
                fontWeight: FontWeight.bold,
                fontSize: tools.getFontSizeLarge(context) + 10,
                fontFamily: tools.getFontFamily()),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(SelectSubject(),
                    // transition: Transition.rightToLeft,
                    duration: Duration(milliseconds: 10));
              },
              child: Text("Continue"))
        ]),
      ),
    );
  }
}
