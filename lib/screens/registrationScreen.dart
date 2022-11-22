import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markshark_mvc/common_widget/space_widget.dart';
import 'package:markshark_mvc/common_widget/text_field_widget.dart';
import 'package:markshark_mvc/constants/color_const.dart';
import 'package:markshark_mvc/controller/registartion_screen/register_controller.dart';

import 'package:markshark_mvc/utils/tools.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key key}) : super(key: key);

  Tools tools = Tools();

  RegisterController _registerController = Get.put(RegisterController());

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
                          // VerticalSpacerWidget(height: 40),
                          // Image.asset(
                          //   "assets/shark_fin.png",
                          //   width: tools.getWidth(context) * 0.45,
                          //   fit: BoxFit.cover,
                          // ),
                          // VerticalSpacerWidget(height: 5),
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
                                key: _registerController.formKey.value,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: tools.getWidth(context) * 0.8,
                                      child: TextFieldWidget(
                                        controller: _registerController
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
                                        controller: _registerController
                                            .emailController.value,
                                        capitalization:
                                            TextCapitalization.sentences,
                                        hinttext: 'Email',
                                        labeltxt: 'Email',
                                        // obscureText: false,
                                        validator: (value) {
                                          if (value == "") {
                                            return "Email cannot be empty!";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    VerticalSpacerWidget(height: 15),
                                    SizedBox(
                                      width: tools.getWidth(context) * 0.8,
                                      child: TextFieldWidget(
                                        controller: _registerController
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
                                    VerticalSpacerWidget(height: 15),
                                    SizedBox(
                                      width: tools.getWidth(context) * 0.8,
                                      child: TextFieldWidget(
                                        controller: _registerController
                                            .confpasswordController.value,
                                        // capitalization: TextCapitalization.sentences,
                                        hinttext: 'Confirm Password',
                                        labeltxt: 'Confirm Password',
                                        obscureText: true,
                                        validator: (value) {
                                          print(value);
                                          print(_registerController
                                              .passwordController.value);

                                          if (value == "") {
                                            return "Password cannot be empty!";
                                          }
                                          if (_registerController
                                                  .confpasswordController
                                                  .value
                                                  .text !=
                                              _registerController
                                                  .passwordController
                                                  .value
                                                  .text) {
                                            return "Password and Confirm password should match";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    VerticalSpacerWidget(height: 15),
                                    RegisterController.isLoading.value
                                        ? CircularProgressIndicator()
                                        : Card(
                                            elevation: 20,
                                            child: SizedBox(
                                              width:
                                                  tools.getWidth(context) * 0.8,
                                              child: CupertinoButton(
                                                  padding: EdgeInsets.all(
                                                      tools.getFontSizeMedium(
                                                          context)),
                                                  color: blue_color,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      // Image.asset(
                                                      //   "assets/google.png",
                                                      //   width: tools.getWidth(context) * 0.07,
                                                      //   fit: BoxFit.cover,
                                                      // ),
                                                      Text(
                                                        "Register",
                                                        style: TextStyle(
                                                            fontSize: tools
                                                                .getFontSizeLarge(
                                                                    context),
                                                            fontFamily: tools
                                                                .getFontFamily()),
                                                      ),
                                                    ],
                                                  ),
                                                  onPressed: () {
                                                    // print(
                                                    //     "Login now okay ${LoginController.isLoading.value}");
                                                    // Authentication.signInWithGoogle(context: context);
                                                    if (_registerController
                                                        .formKey
                                                        .value
                                                        .currentState
                                                        .validate()) {
                                                      RegisterController
                                                          .isLoading
                                                          .value = true;

                                                      _registerController
                                                          .saveProfile();
                                                    }

                                                    // Navigator.push(context,
                                                    //     CupertinoPageRoute(builder: (_) => Subject()));
                                                  }),
                                            ),
                                          )
                                  ],
                                ),
                              ),
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

                          //                   _registerController.googleSigin();
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
