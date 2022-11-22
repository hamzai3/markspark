import 'package:get/get.dart';
import 'package:markshark_mvc/api_Service/leaderboard_api.dart';
import 'package:markshark_mvc/constants/expo_all_const.dart';
import 'package:markshark_mvc/model/leaderboard_model.dart';
import 'package:markshark_mvc/utils/tools.dart';

class LeaderBoardController extends GetxController {
  static RxList<Top3RankArray> leaderBoardList = <Top3RankArray>[].obs;
  static RxString imageUrl = "".obs;
  // static RxString userName = "".obs;
  static RxString userEmail = "".obs;
  static RxString userName = "".obs;
  static RxString userId = "".obs;
  static RxString userScore = "".obs;
  Tools tools = Tools();
  
  fetchLeaderBoardData(userId) async {
    tools.getshared(UserGender).then((value) {
      print("UserGender $value");
      imageUrl.value = value;
    });
    tools.getshared(UserEmail).then((value) {
      print("UserEmail $value");
      userEmail.value = value;
    });
    tools.getshared(UserName).then((value) {
      print("userName $value");
      userName.value = value;
    });
    tools.getshared(UserId).then((value) {
      print("UserId $value");
      userId.value = value;
    });
    LeaderBoardModel leaderBoardModel =
        await LeaderBoardApi.fetchLeaderBoardData(userId);
    // for(int i in )
    leaderBoardList.value = leaderBoardModel.response[0].top3RankArray;
    userScore.value = leaderBoardModel.response[0].score;

    // print("${leaderBoardList.value}");
  }
}
