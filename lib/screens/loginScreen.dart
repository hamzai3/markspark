import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markshark_mvc/common_widget/space_widget.dart';
import 'package:markshark_mvc/common_widget/text_field_widget.dart';
import 'package:markshark_mvc/constants/color_const.dart';
import 'package:markshark_mvc/controller/login_screen/login_controller.dart';
import 'package:markshark_mvc/screens/registrationScreen.dart';
import 'package:markshark_mvc/utils/tools.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key key}) : super(key: key);

  Tools tools = Tools();

  LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Obx(
                () {
                  return Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // VerticalSpacerWidget(height: 80),
                          // Image.asset(
                          //   "assets/shark_fin.png",
                          //   width: tools.getWidth(context) * 0.45,
                          //   fit: BoxFit.cover,
                          // ),
                          // VerticalSpacerWidget(height: 25),
                          Text(
                            "WELCOME BACK",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: blue_color,
                                fontWeight: FontWeight.bold,
                                fontSize: tools.getFontSizeXXLarge(context),
                                fontFamily: tools.getFontFamily()),
                          ),
                          VerticalSpacerWidget(height: 5),
                          Image.asset(
                            "assets/logo.jpg",
                            width: tools.getWidth(context) * 0.75,
                            fit: BoxFit.cover,
                          ),
                          VerticalSpacerWidget(height: 15),
                          SizedBox(
                            width: tools.getWidth(context) * 0.8,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0.0),
                              child: Form(
                                key: _loginController.loginformKey.value,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: tools.getWidth(context) * 0.8,
                                      child: TextFieldWidget(
                                        controller: _loginController
                                            .userIdController.value,
                                        capitalization:
                                            TextCapitalization.sentences,
                                        hinttext: 'Username',
                                        labeltxt: 'Username',
                                        // obscureText: false,
                                        validator: (value) {
                                          if (value == "") {
                                            return "Username cannot be empty!";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    VerticalSpacerWidget(height: 15),
                                    SizedBox(
                                      width: tools.getWidth(context) * 0.8,
                                      child: TextFieldWidget(
                                        controller: _loginController
                                            .passwordController.value,
                                        // capitalization: TextCapitalization.sentences,
                                        hinttext: 'Password',
                                        labeltxt: 'Password',
                                        obscureText: true,
                                        validator: (value) {
                                          if (value == "") {
                                            return "Password cannot be empty!";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          VerticalSpacerWidget(height: 15),
                          LoginController.isLoading.value
                              ? CircularProgressIndicator()
                              : Card(
                                  elevation: 4,
                                  child: SizedBox(
                                    width: tools.getWidth(context) * 0.8,
                                    child: CupertinoButton(
                                        padding: EdgeInsets.all(
                                            tools.getFontSizeMedium(context)),
                                        color: blue_color,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            // Image.asset(
                                            //   "assets/google.png",
                                            //   width: tools.getWidth(context) * 0.07,
                                            //   fit: BoxFit.cover,
                                            // ),
                                            Text(
                                              "Log in",
                                              style: TextStyle(
                                                  fontSize: tools
                                                      .getFontSizeLarge(context),
                                                  fontFamily:
                                                      tools.getFontFamily()),
                                            ),
                                          ],
                                        ),
                                        onPressed: () {
                                          // print(
                                          //     "Login now okay ${LoginController.isLoading.value}");
                                          // Authentication.signInWithGoogle(context: context);
                                          if (_loginController
                                              .loginformKey.value.currentState
                                              .validate()) {
                                            LoginController.isLoading.value =
                                                true;
                                            _loginController.fetchUserData();
                                          }

                                          // Navigator.push(context,
                                          //     CupertinoPageRoute(builder: (_) => Subject()));
                                        }),
                                  ),
                                ),
                          VerticalSpacerWidget(height: 5),
                          InkWell(
                            onTap: () {
                              Get.to(RegistrationScreen());
                            },
                            child: Text(
                              "Dont have account? Sign in here",
                              style: TextStyle(
                                  color: grey_color,
                                  fontSize: tools.getFontSizeMedium(context),
                                  fontFamily: tools.getFontFamily()),
                            ),
                          ),
                          // Obx(() {
                          //   return LoginController.isLoading.value
                          //       ? CircularProgressIndicator(color: primary_blue)
                          //       : Card(
                          //           elevation: 20,
                          //           child: SizedBox(
                          //             width: tools.getWidth(context) * 0.7,
                          //             child: CupertinoButton(
                          //                 padding: EdgeInsets.all(
                          //                     tools.getFontSizeMedium(context)),
                          //                 color: blue_color,
                          //                 child: Row(
                          //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //                   children: [
                          //                     Image.asset(
                          //                       "assets/google.png",
                          //                       width: tools.getWidth(context) * 0.07,
                          //                       fit: BoxFit.cover,
                          //                     ),
                          //                     Text(
                          //                       "Sign in with google",
                          //                       style: TextStyle(
                          //                           fontSize: tools.getFontSizeLarge(context),
                          //                           fontFamily: tools.getFontFamily()),
                          //                     ),
                          //                   ],
                          //                 ),
                          //                 onPressed: () {
                          //                   print(
                          //                       "Login now okay ${LoginController.isLoading.value}");
                          //                   // Authentication.signInWithGoogle(context: context);
                          //                   LoginController.isLoading.value = true;

                          //                   _loginController.googleSigin();
                          //                   // Navigator.push(context,
                          //                   //     CupertinoPageRoute(builder: (_) => Subject()));
                          //                 }),
                          //           ),
                          //         );
                          // })
                        ]),
                  );
                },
              )
            ],
          ),
        ));
  }
}
