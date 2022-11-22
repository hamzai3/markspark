import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markshark_mvc/common_widget/app_bar.dart';
import 'package:markshark_mvc/controller/que_ans_screen/que_ans_controller.dart';
import 'package:markshark_mvc/controller/que_ans_screen/section_controller.dart';
import 'package:markshark_mvc/screens/queAnsScreen.dart';
import 'package:markshark_mvc/utils/tools.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:markshark_mvc/common_widget/bottom_navigation.dart';

import '../constants/expo_all_const.dart';

class Section extends StatelessWidget {
  final String subjectId;
  Section({Key key, this.subjectId}) : super(key: key);

  SectionController _sectionController = Get.put(SectionController());
  QueAnsController _queAnsController = Get.put(QueAnsController());

  Tools tools = Tools();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: AppBarWidget(
              isback: false,
              title: 'Section',
              isColored: false,
            )),
        body: Obx(() {
          return SafeArea(
              child:
                  //  Observer(builder: (context) {
                  // return
                  SectionController.sectionList != null ||
                          SectionController.sectionList.length > 0
                      ? Column(children: [
                          Expanded(
                              child:
                                  //  Dataconstants.isSubjectDataLoaded
                                  // ?
                                  GridView.count(
                            // Create a grid with 2 columns. If you change the scrollDirection to
                            // horizontal, this produces 2 rows.
                            scrollDirection: Axis.vertical,
                            // mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            // childAspectRatio: 4,
                            crossAxisCount: 2,
                            // Generate 100 widgets that display their index in the List.
                            children: List.generate(
                                SectionController.sectionList.length,
                                // 4,
                                (index) {
                              return InkWell(
                                onTap: () {
                                  tools.getshared(UserId).then((value) async {
                                    await _queAnsController.fetchQueAns(
                                        value,
                                        subjectId,
                                        SectionController.sectionList[index]);
                                    Get.to(QueAnsScreen(),
                                        // transition: Transition.rightToLeft,
                                        duration: Duration(milliseconds: 100));
                                  });
                                },
                                child: Container(
                                    padding: EdgeInsets.all(30),
                                    margin: EdgeInsets.all(
                                        25), //  circle size depends on margin
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      // color: primary_blue,

                                      border: Border.all(
                                          color: light_grey_color, width: 10),
                                      // borderRadius: BorderRadius.circular(20),
                                      shape: BoxShape.circle,
                                      // boxShadow: [
                                      //   BoxShadow(

                                      //       // spreadRadius: 25,
                                      //       color: light_grey_color,
                                      //       blurRadius: 5.0,
                                      //       spreadRadius: 2,
                                      //       offset: Offset(0.0, 8.00)),
                                      // ]
                                    ),
                                    child: AutoSizeText(
                                        SectionController.sectionList[index],
                                        style: TextStyle(
                                            fontSize: tools
                                                .getFontSizeXXLarge(context),
                                            fontWeight: FontWeight.bold,
                                            color: primary_blue,
                                            fontFamily:
                                                tools.getFontFamily()))),
                              );
                            }),
                          )
                              // : const Center(
                              //     child: CircularProgressIndicator(
                              //     color: Colors.blue,
                              //   )
                              // )
                              ),
                        ])
                      : Center(child: Text("No data found")));
        }),

        // ),
        bottomNavigationBar: BottomNavWidget(currentIndex: 0));
  }
}
