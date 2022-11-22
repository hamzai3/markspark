import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markshark_mvc/api_Service/que_ans_api.dart';
import 'package:markshark_mvc/constants/color_const.dart';
// import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:markshark_mvc/model/after_answer_model.dart';
import 'package:markshark_mvc/model/ques_ans_model.dart';
import 'package:markshark_mvc/screens/congratulations.dart';

class QueAnsController extends GetxController {
  RxList ansList = ["yes", "no", "none", "other"].obs;
  RxList<Color> ansColorList = [
    light_grey_color_with_opacity,
    light_grey_color_with_opacity,
    light_grey_color_with_opacity,
    light_grey_color_with_opacity
  ].obs;
  // RxInt rightOPtion = 0.obs;

  static AudioPlayer audioplayer = AudioPlayer();
  static AudioCache player = AudioCache();

  // Source rightAudioPath = "assets/right-ans.mp3" as Source;
  static const wrongAudioPath = "assets/wrong-ans.mp3";

  static RxList<QuestionList> questionList = <QuestionList>[].obs;
  // static RxList<Subject> subjectList = <Subject>[].obs;

  static RxString currentQuestion = "".obs;
  static RxList<AnswerList> currentAnswerList = <AnswerList>[].obs;
  RxInt currentQuestionIndex = 0.obs;
  RxInt currentQuestionAtempts = 0.obs;
  RxBool isProcessing = false.obs;
  RxDouble progressPercentage = 0.0.obs;
  RxString _userId = "0".obs;
  RxString _subjectId = "0".obs;

  fetchQueAns(userId, subjectId, section) async {
    _userId.value = userId;
    _subjectId.value = subjectId;
    QuesAnsModel questionDetailsModel =
        await QueAnsApi.fetchQuestion(userId, subjectId, section);

    questionList.value = questionDetailsModel.response[0].questionList;
    // show percentage
    countPercentage(0);
    // making ready first question
    currentQuestion.value =
        questionDetailsModel.response[0].questionList[0].question.toString();
    currentAnswerList.value =
        questionDetailsModel.response[0].questionList[0].answerList;

    print("currentAnswerList.value ${currentAnswerList.value}");
    currentQuestionIndex.value = 0;
  }

  fetchNextQuestion() {
    // if user reaches ro last question then send him to congratulation page
    if (currentQuestionIndex.value == (questionList.length - 1)) {
      Get.to(Congratulations(),
          transition: Transition.rightToLeft,
          duration: Duration(milliseconds: 100));
    } else {
      currentQuestionIndex.value = currentQuestionIndex.value + 1;
      countPercentage(currentQuestionIndex.value);

      currentQuestion.value =
          questionList[currentQuestionIndex.value].question.toString();
      currentAnswerList.value =
          questionList[currentQuestionIndex.value].answerList;
    }
  }

  countPercentage(currentQuentionCount) {
    progressPercentage.value = currentQuentionCount / questionList.length;
    print("progressPercentage.value ${progressPercentage.value}");
  }

  addAttemptCount() async {
    currentQuestionAtempts.value = currentQuestionAtempts.value + 1;
    print("total attempt ${currentQuestionAtempts.value}");
  }

  showAnswer(index, bool type) {
    //  await Get.closeCurrentSnackbar();
    isProcessing.value = true;
    // true will be right else wrong
    type ? _isAnsRight(index) : _isAnsWrong(index);

    Future.delayed(const Duration(milliseconds: 1500), () {
      ansColorList.value = [
        light_grey_color_with_opacity,
        light_grey_color_with_opacity,
        light_grey_color_with_opacity,
        light_grey_color_with_opacity
      ];
      ansColorList.refresh();

      type ? fetchNextQuestion() : addAttemptCount();
      isProcessing.value = false;
    });
  }

  _isAnsRight(index) async {
    // show snackbar
    // _showResultSnackbar(true);

    // show right one green
    _showRightOptionGreen(index);
    audioplayer.play(AssetSource("sound_effects/correct-ans.mp3"));

    // clearing attempts for crrent question and sending data to api
    currentQuestionAtempts.value = 0;
    AfterAnswerModel afterAnswerModel = QueAnsApi.afterAnswer(
        _userId.value,
        _subjectId.value,
        currentQuestionIndex.value.toString(),
        currentQuestionAtempts.value.toString());

    // redirect to next question
  }

  _isAnsWrong(index) {
    // show snackbar
    // _showResultSnackbar(false);

    // show wrong one red
    _showWrongOptionRed(index);

    // show right one green
    // _showRightOptionGreen(rightOPtion.value);

    audioplayer.play(AssetSource("sound_effects/wrong-ans.mp3"));

    // redirect to next question
  }

  _showResultSnackbar(bool resultStatus) {
    switch (resultStatus) {
      case true:
        _showSuccessSnackbar();
        break;
      case false:
        _showFailureSnackbar();
        break;
    }
  }

  _showSuccessSnackbar() async {
    Get.snackbar(
      "Great Job",
      "You are correct",
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
            radius: 30,
            backgroundColor: white_color,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child:
                    Image.asset("assets/thumbs-up.png", fit: BoxFit.contain))),
      ),
      shouldIconPulse: true,
      backgroundColor: success_green_color,
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
      // duration: Duration(milliseconds: 3000),
      forwardAnimationCurve: Curves.easeOutBack,
      margin: EdgeInsets.all(15),
      colorText: Colors.white,
    );
  }

  _showFailureSnackbar() async {
    // await Get.closeCurrentSnackbar();
    Get.snackbar(
      "Bad luck",
      "Answer is wrong",
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
            radius: 30,
            backgroundColor: white_color,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset("assets/thumbs-down.jpg", fit: BoxFit.contain),
            )),
      ),
      shouldIconPulse: true,
      backgroundColor: failure_red_color,
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,

      // duration: Duration(milliseconds: 3000),
      forwardAnimationCurve: Curves.easeOutBack,
      margin: EdgeInsets.all(15),
      colorText: Colors.white,
    );
  }

  _showRightOptionGreen(index) {
    ansColorList[index] = success_green_color;
    ansColorList.refresh();
  }

  _showWrongOptionRed(index) {
    ansColorList[index] = failure_red_color;
    ansColorList.refresh();
  }
}
