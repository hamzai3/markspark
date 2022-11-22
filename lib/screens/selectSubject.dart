import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markshark_mvc/common_widget/app_bar.dart';
import 'package:markshark_mvc/common_widget/bottom_navigation.dart';
import 'package:markshark_mvc/constants/color_const.dart';
import 'package:markshark_mvc/constants/expo_all_const.dart';
import 'package:markshark_mvc/controller/que_ans_screen/section_controller.dart';
import 'package:markshark_mvc/controller/subject_screen/select_subject_controller.dart';
import 'package:markshark_mvc/screens/queAnsScreen.dart';
import 'package:markshark_mvc/utils/tools.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SelectSubject extends StatelessWidget with PreferredSizeWidget {
  SelectSubject({Key key}) : super(key: key);

  SectionController _sectionController = SectionController();

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
            child: AppBarWidget(isback: false, title: 'Subjects', isColored: false,)),
        body: 
        Obx(() {
          return SafeArea(
          child:
              //  Observer(builder: (context) {
              // return
              SelectSubjectController.subjectList != null ||
                      SelectSubjectController.subjectList.length > 0
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
                        crossAxisSpacing: 3,
                        // childAspectRatio: 4,
                        crossAxisCount: 2,
                        // Generate 100 widgets that display their index in the List.
                        children: List.generate(
                            SelectSubjectController.subjectList.length,
                            (index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  // tools.getshared(UserId).then((value)async{
                                  // await _queAnsController.fetchQueAns(value,SelectSubjectController.subjectList[index].subjectId );
                                  // Get.to(QueAnsScreen(),
                                  //     transition: Transition.rightToLeft,
                                  //     duration: Duration(milliseconds: 1000));
                                  // });                                  
                                  _sectionController.fetchSetions(SelectSubjectController.subjectList[index].subjectId );
                                  


                                  
                                },
                                child: Container(
                                  decoration: BoxDecoration(
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
                                  child: CircularPercentIndicator(
                                    fillColor: white_color,
                                    animation: true,
                                    animationDuration: 2000,
                                    radius:
                                        135.0, // starts from center of whole circle and covers end point of outer ring
                                    lineWidth: 10.0,
                                    // percent: progress[index],
                                    percent: double.parse(SelectSubjectController
                                            .subjectList[index].subjectPercentage.toString()) ,
                                    center: Container(

                                      height:
                                          95, // defines size of inner circle
                                      // child: Text('1'),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: yellow_color,

                                        // image: DecorationImage(image: AssetImage("assets/shark_fin.png",))
                                      ),
                                      child: Image.network(
                                        SelectSubjectController
                                            .subjectList[index].subjectImage
                                            .toString(),
                                        fit: BoxFit.contain,
                                        scale: 1,
                                       
                                      ),
                                      // child: Align(
                                      //   alignment: Alignment.center,
                                      //   child:
                                      //    Image(image: AssetImage("assets/shark_fin.png",), fit: BoxFit.contain,)
                                      // ),
                                    ),
                                    progressColor: primary_blue,
                                  ),
                                ),
                              ),
                              Text(
                                 SelectSubjectController
                                            .subjectList[index].subjectName
                                            .toString(),
                                style: TextStyle(
                                    fontSize: tools.getFontSizeLarge(context),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: tools.getFontFamily()),
                              ),
                            ],
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
                  : Center(child: Text("No subject found")),
          // }
        );
        },),
        
        // ),
        bottomNavigationBar: BottomNavWidget(currentIndex: 0));
  }
}
