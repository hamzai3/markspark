import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markshark_mvc/common_widget/app_bar.dart';
import 'package:markshark_mvc/common_widget/bottom_navigation.dart';
import 'package:markshark_mvc/common_widget/divider_widget.dart';
import 'package:markshark_mvc/constants/color_const.dart';
import 'package:markshark_mvc/controller/leaderboard_screen/leaderboard_controller.dart';
import 'package:markshark_mvc/utils/tools.dart';

class LeaderBoard extends StatelessWidget {
  LeaderBoard({Key key}) : super(key: key);
  Tools tools = Tools();
  LeaderBoardController _leaderBoardController = LeaderBoardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBarWidget(
          color: light_yellow_color,
          isback: true,
          title: "Leaderboard",
          isColored: true,
        ),
      ),
      backgroundColor: white_color,
      body: Obx(
        () {
          return Column(
            children: [
              // User data
              Container(
                padding: EdgeInsets.only(top: 40),
                height: 280,
                decoration: BoxDecoration(
                    color: light_yellow_color,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 18,
                    ),
                    Stack(
                      children: [
                        // SizedBox(
                        //   height: 20,
                        // ),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: golden_color, width: 2)),
                          child: CircleAvatar(
                              radius: 50,
                              backgroundColor: white_color,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(LeaderBoardController
                                    .imageUrl.value
                                    .toString()),
                              )),
                        ),
                        Positioned(
                          bottom: 0.0,
                          right: 0.0,
                          child: Container(
                            padding: EdgeInsets.all(4),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      LeaderBoardController.userName.value.toString(),
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: tools.getFontSizeSmall(context),
                        fontFamily: tools.getFontFamily(),
                        // fontWeight: FontWeight.bold,
                        color: black_color,
                        // backgroundColor: Color(0xffFACB21)
                      ),
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Divider(
                    //   thickness: 1,
                    //   indent: 20,
                    //   endIndent: 20,
                    // ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            // Text(
                            //   "2430",
                            //   style: TextStyle(
                            //     decoration: TextDecoration.none,
                            //     fontSize: tools.getFontSizeLarge(context),
                            //     fontFamily: tools.getFontFamily(),
                            //     fontWeight: FontWeight.bold,
                            //     color: black_color,
                            //     // backgroundColor: Color(0xffFACB21)
                            //   ),
                            // ),
                            Text(
                              LeaderBoardController.userScore.value
                                          .toString() ==
                                      'null'
                                  ? 'Complete sets to get score'
                                  : LeaderBoardController.userScore.value
                                      .toString(),
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: tools.getFontSizeSmall(context),
                                  fontFamily: tools.getFontFamily(),
                                  color: black_color
                                  // backgroundColor: Color(0xffFACB21)
                                  ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              // SizedBox(
              //   height: 20,
              // ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: SizedBox(
                    height: 300,
                    child: LeaderBoardController.leaderBoardList.value !=
                                null &&
                            LeaderBoardController.leaderBoardList.length > 0
                        ? ListView.builder(
                            // shrinkWrap: true,
                            itemCount:
                                LeaderBoardController.leaderBoardList.length,
                            itemBuilder: (context, index) {
                              return ListView(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  Card(
                                    elevation:
                                        LeaderBoardController.userEmail ==
                                                LeaderBoardController
                                                    .leaderBoardList[index]
                                                    .top3UserId
                                                    .toString()
                                            ? 7
                                            : 0,
                                    color: index == 0
                                        ? light_grey_color
                                        : index == 1
                                            ? orange_color
                                            : white_color,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: index == 0
                                                ? light_grey_color
                                                : index == 1
                                                    ? orange_color
                                                    : white_color,
                                            width: 0.5),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: ListTile(
                                      // dense: true,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 0),
                                      // minLeadingWidth: 20,

                                      leading: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: index == 0
                                                    ? grey_color_round_border
                                                    : index == 1
                                                        ? orange_color_round_border
                                                        : white_color,
                                                width: 3)),
                                        child: CircleAvatar(
                                            radius: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.07,
                                            backgroundColor: white_color,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: Image.asset(
                                                  LeaderBoardController
                                                              .leaderBoardList[
                                                                  index]
                                                              .top3Gender
                                                              .toString()
                                                              .toLowerCase() ==
                                                          "male"
                                                      ? "assets/Male.png"
                                                      : "assets/Female.png"),
                                            )),
                                      ),
                                      title: Text(
                                        LeaderBoardController
                                            .leaderBoardList[index].top3Username
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.020,
                                          fontFamily: tools.getFontFamily(),
                                          fontWeight: FontWeight.bold,
                                          color: black_color,
                                          // backgroundColor: Color(0xffFACB21)
                                        ),
                                      ),
                                      subtitle: Text(
                                        LeaderBoardController
                                            .leaderBoardList[index].top3Username
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: tools.getFontFamily(),
                                            color: black_color
                                            // backgroundColor: Color(0xffFACB21)
                                            ),
                                      ),
                                      trailing: Text(
                                          LeaderBoardController
                                              .leaderBoardList[index].top3Score
                                              .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: tools.getFontFamily(),
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.018,
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 2),
                                    child: DividerWidget(height: 2),
                                  ),
                                ],
                              );
                            },
                          )
                        : Center(
                            child: Text(
                            "No Streak, Keep learning daily to make a streak and higher order in leaderboard",
                            textAlign: TextAlign.center,
                          )),
                  ),
                ),
              )
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavWidget(currentIndex: 1),
    );
  }
}
