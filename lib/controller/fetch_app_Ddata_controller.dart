import 'package:get/get.dart';
import 'package:markshark_mvc/api_Service/profile_api.dart';
import 'package:markshark_mvc/constants/shared_pref_const.dart';
import 'package:markshark_mvc/controller/leaderboard_screen/leaderboard_controller.dart';
import 'package:markshark_mvc/controller/login_screen/login_controller.dart';
import 'package:markshark_mvc/controller/profile_screen/profile_controller.dart';
import 'package:markshark_mvc/controller/subject_screen/select_subject_controller.dart';
import 'package:markshark_mvc/model/profile_model.dart';
import 'package:markshark_mvc/screens/selectSubject.dart';
import 'package:markshark_mvc/utils/tools.dart';

class FetAppDataCotroller extends GetxController {
  final ProfileController _profileController = ProfileController();
  final LeaderBoardController _leaderBoardController = LeaderBoardController();
  final SelectSubjectController _selectSubjectController = SelectSubjectController();
  Tools tools = Tools();
  fetchData() {
    LoginController.isLoading.value = true;

    print("In fetchData");
    tools.getshared(UserId).then((value) async {  


      //setProfile
      _profileController.fetchProfileData(value);
      //setLeaderBoard
      _leaderBoardController.fetchLeaderBoardData(value);
      
      //setsubjects (wait to complete the process)
      await _selectSubjectController.fetchSubjects(value);
      LoginController.isLoading.value = false;

      // redirect to selectsub screen
      Get.to(SelectSubject(),
          // transition: Transition.rightToLeft,
          duration: Duration(milliseconds: 0));
      

    });

    // fetch leaderboard details
    // fetch subject details (in await)
  }
}
