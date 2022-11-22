import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markshark_mvc/constants/color_const.dart';
import 'package:markshark_mvc/constants/expo_all_const.dart';
import 'package:markshark_mvc/controller/login_screen/login_controller.dart';
import 'package:markshark_mvc/utils/tools.dart';

class SelectAvatarPopup extends StatelessWidget {
  SelectAvatarPopup({Key key}) : super(key: key);
  LoginController _loginController = LoginController();
  Tools tools = Tools();
  void showBottomSheet(email) {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(15),
        height: Get.height / 3,
        decoration: const BoxDecoration(
          color: white_color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Divider(height: 10, color: Colors.transparent),
            Text(
              "Select Gender",
              style: TextStyle(
                fontSize: 15,
                fontFamily: tools.getFontFamily(),
                fontWeight: FontWeight.bold,
                color: black_color,
                // backgroundColor: Color(0xffFACB21)
              ),
            ),
            Divider(
              height: 20,
              color: Colors.transparent,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        
                          _loginController.fetchUserGenderData(email, "male");                        
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: primary_blue, width: 3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: CircleAvatar(
                            radius: 40,
                            backgroundColor: white_color,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset("assets/Male.png"),
                            )),
                      ),
                    ),
                    Divider(
                      height: 10,
                      color: Colors.transparent,
                    ),
                    Text(
                      "Male",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: tools.getFontFamily(),
                        fontWeight: FontWeight.bold,
                        color: black_color,
                        // backgroundColor: Color(0xffFACB21)
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        
                          _loginController.fetchUserGenderData(email, "female");
                       
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: primary_blue, width: 3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: CircleAvatar(
                            radius: 40,
                            backgroundColor: white_color,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset("assets/Female.png"),
                            )),
                      ),
                    ),
                    Divider(
                      height: 10,
                      color: Colors.transparent,
                    ),
                    Text(
                      "Female",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: tools.getFontFamily(),
                        fontWeight: FontWeight.bold,
                        color: black_color,
                        // backgroundColor: Color(0xffFACB21)
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      ignoreSafeArea: false,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
