import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markshark_mvc/common_widget/answer_widget.dart';
import 'package:markshark_mvc/common_widget/app_bar.dart';
import 'package:markshark_mvc/common_widget/question_widget.dart';
import 'package:markshark_mvc/constants/color_const.dart';
import 'package:markshark_mvc/controller/que_ans_screen/que_ans_controller.dart';
import 'package:markshark_mvc/screens/congratulations.dart';
import 'package:percent_indicator/percent_indicator.dart';

class QueAnsScreen extends StatelessWidget {
  QueAnsScreen({Key key}) : super(key: key);

  QueAnsController _queAnsController = QueAnsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white_color,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBarWidget(
            isback: true,
            title: "Question",
            isColored: false,
          ),
        ),
        body: Obx(
          () {
            return ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 0),
                      child: InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Icon(Icons.close)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.fromLTRB(0, 20, 20, 20),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: LinearPercentIndicator(
                          backgroundColor: light_grey_color,
                          progressColor: primary_blue,
                          percent: _queAnsController.progressPercentage.value,
                          lineHeight: 8,
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  child: Column(
                    children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: QuestionWidget(
                        question: QueAnsController.currentQuestion.toString(),
                      ))
                    ],
                  ),
                ),
                                Divider(height: 15,color: transperent_color,),

                ListView.builder(
                    shrinkWrap: true,
                    itemCount: QueAnsController.currentAnswerList.length,
                    itemBuilder: ((context, i) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: InkWell(onTap: () {
                          if (!_queAnsController.isProcessing.value) {
                            print("clicked");
                            Get.closeAllSnackbars();
                            _queAnsController.isProcessing.value = true;
                            _queAnsController.showAnswer(
                                i,
                                QueAnsController
                                    .currentAnswerList[i].isCorrect);
                          }
                        }, child: Obx(
                          () {
                            return Column(
                              children: [
                                AnswerWidget(
                                  answer: QueAnsController
                                      .currentAnswerList[i].choice
                                      .toString(),
                                  color: _queAnsController.ansColorList[i],
                                ),
                                Divider(height: 10,color: transperent_color,)
                              ],
                            );
                          },
                        )))))
              ],
            );
          },
        ));
  }
}
