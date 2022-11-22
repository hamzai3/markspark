import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markshark_mvc/common_widget/app_bar.dart';
import 'package:markshark_mvc/common_widget/bottom_navigation.dart';
import 'package:markshark_mvc/common_widget/divider_widget.dart';
import 'package:markshark_mvc/common_widget/profile_menu.dart';
import 'package:markshark_mvc/common_widget/space_widget.dart';
import 'package:markshark_mvc/constants/color_const.dart';
import 'package:markshark_mvc/constants/expo_all_const.dart';
import 'package:markshark_mvc/controller/profile_screen/profile_controller.dart';

import 'package:markshark_mvc/utils/log_out/log_out.dart';
import 'package:markshark_mvc/utils/tools.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key key}) : super(key: key);
  final ProfileController _profileController = ProfileController();
  final LogOut _logOut = LogOut();

  final double coverHeight = 80.0;
  final double profileHeight = 104;
  Tools tools = Tools();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBarWidget(
          color: light_yellow_color,
          isback: true,
          title: "Profile",
          isColored: true,
        ),
      ),
      backgroundColor: white_color,
      body: ListView(
        children: [
          Obx(
            () {
              return Column(
                // padding: EdgeInsets.zero,
                children: <Widget>[
                  buildTop(), // yellow section with profile pic
                  VerticalSpacerWidget(height: 10.0),
                  // Container(
                  //   padding: const EdgeInsets.all(8),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.all(Radius.circular(5)),
                  //     color: yellow_color,
                  //   ),
                  //   child:
                  Text(
                    ProfileController.userName.value,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.022,
                      fontFamily: tools.getFontFamily(),
                      fontWeight: FontWeight.bold,
                      color: black_color,
                      // backgroundColor: Color(0xffFACB21)
                    ),
                    // ),
                  ),
                  VerticalSpacerWidget(height: 4.0),

                  // Container(
                  //   padding: const EdgeInsets.all(10),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.all(Radius.circular(5)),
                  //     color: yellow_color,
                  //   ),
                  //   child:
                  Text(
                    ProfileController.userEmail.value,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.018,
                        fontFamily: tools.getFontFamily(),
                        fontWeight: FontWeight.bold,
                        color: black_color),
                  ),
                  // ),r
                  VerticalSpacerWidget(height: 10.0),

                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: <Widget>[
                        // FlatButton(
                        //     padding: const EdgeInsets.all(10),
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(5)),
                        //     color: white_color,
                        //     onPressed: () {},
                        //     child: Row(
                        //       children: [
                        //         // SizedBox(width: 10),
                        //         Expanded(
                        //           child: Text(
                        //             "Personal Details",
                        //             style: TextStyle(
                        //               fontSize:
                        //                   MediaQuery.of(context).size.height *
                        //                       0.022,
                        //               fontFamily: tools.getFontFamily(),
                        //               fontWeight: FontWeight.bold,
                        //               color: black_color,
                        //               // backgroundColor: Color(0xffFACB21)
                        //             ),
                        //           ),
                        //         ),
                        //         Text(
                        //           "EDIT",
                        //           style: TextStyle(
                        //             fontSize:
                        //                 MediaQuery.of(context).size.height *
                        //                     0.022,
                        //             fontFamily: tools.getFontFamily(),
                        //             fontWeight: FontWeight.bold,
                        //             color: Color(0xff1B3066),
                        //             // backgroundColor: Color(0xffFACB21)
                        //           ),
                        //         ),
                        //         //
                        //         // Icon(Icons.arrow_forward_ios)
                        //       ],
                        //     )),

                        // DividerWidget(height: 2),
                        // ProfileMenu(
                        //   text: "Personal Details",
                        //   press: () {},
                        //   icon: "",
                        // ),
                        MaterialButton(
                            padding: const EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            color: white_color,
                            onPressed: () {},
                            child: Row(
                              children: [
                                // SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    "Subject completed ",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.022,
                                      fontFamily: tools.getFontFamily(),
                                      fontWeight: FontWeight.bold,
                                      color: black_color,
                                      // backgroundColor: Color(0xffFACB21)
                                    ),
                                  ),
                                ),
                                Text(
                                  ProfileController.subjectCompleted
                                          .toString() +
                                      "/100",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.022,
                                    fontFamily: tools.getFontFamily(),
                                    fontWeight: FontWeight.bold,
                                    color: black_color,
                                    // backgroundColor: Color(0xffFACB21)
                                  ),
                                ),
                                //
                                // Icon(Icons.arrow_forward_ios)
                              ],
                            )),
                        // DividerWidget(height: 2),
                        VerticalSpacerWidget(
                          height: 2,
                        ),
                        MaterialButton(
                            padding: const EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            color: white_color,
                            onPressed: () {},
                            child: Row(
                              children: [
                                // SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    "Question attempted",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.022,
                                      fontFamily: tools.getFontFamily(),
                                      fontWeight: FontWeight.bold,
                                      color: black_color,
                                      // backgroundColor: Color(0xffFACB21)
                                    ),
                                  ),
                                ),
                                Text(
                                  // "${profileList[0]['queCount']}/${Dataconstants.totalQuestionCount}",
                                  ProfileController.questionAttempted
                                          .toString() +
                                      "/100",

                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.022,
                                    fontFamily: tools.getFontFamily(),
                                    fontWeight: FontWeight.bold,
                                    color: black_color,
                                    // backgroundColor: Color(0xffFACB21)
                                  ),
                                ),
                                //
                                // Icon(Icons.arrow_forward_ios)
                              ],
                            )),
                        DividerWidget(height: 2),

                        ProfileMenu(
                          text: "FAQs",
                          press: () {
                            launchUrl(Uri.parse(base_url_files + faq));
                          },
                          icon: "",
                        ),
                        DividerWidget(height: 2),

                        ProfileMenu(
                          text: "Privacy Policy",
                          press: () {
                            launchUrl(
                                Uri.parse(base_url_files + privacy_policy));
                          },
                          icon: "",
                        ),
                        DividerWidget(height: 2),

                        ProfileMenu(
                          text: "About us",
                          press: () {
                            launchUrl(Uri.parse(base_url_files + about_us));
                          },
                          icon: "",
                        ),
                        DividerWidget(height: 2),
                        VerticalSpacerWidget(
                          height: 20,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                _logOut.logout();
                              },
                              child: Text(
                                "Logout",
                                style: TextStyle(
                                  fontSize: tools.getFontSizeMedium(context),
                                  fontFamily: tools.getFontFamily(),
                                  color: primary_blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              "Version 1.0.1",
                              style: TextStyle(
                                fontSize: tools.getFontSizeSmall(context),
                                fontFamily: tools.getFontFamily(),
                                color: yellow_color,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          )
        ],
      ),
      bottomNavigationBar: BottomNavWidget(currentIndex: 2),
    );
  }

  Widget buildTop() {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: bottom), child: buildCoverImage()),
        Positioned(
          top: top,
          child: buildProfileImage(),
        )
      ],
    );
  }

  Widget buildCoverImage() => Card(
        elevation: 4,
        margin: EdgeInsets.all(0),
        child: Container(
          // color: tools.getLightGreyColor(),
          height: coverHeight,
          decoration: BoxDecoration(
            // gradient:
            //   LinearGradient(
            //     colors: [
            //       const Color(0xFFEDB305),
            //       Color.fromARGB(255, 238, 215, 145),
            //     ],
            //     begin: const FractionalOffset(0.0, 0.0),
            //     end: const FractionalOffset(1.0, 0.0),
            //     stops: [0.0, 1.0],
            //     tileMode: TileMode.clamp),
            color: light_yellow_color,
            // boxShadow: [
            //   BoxShadow(color: grey_color),
            // ]
          ),
        ),
      );

  Widget buildProfileImage() => Container(
        decoration: BoxDecoration(
            border: Border.all(color: white_color, width: 3),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: CircleAvatar(
            radius: profileHeight / 2,
            backgroundColor: white_color,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset("assets/shark_fin.png"),
            )),
      );
}
