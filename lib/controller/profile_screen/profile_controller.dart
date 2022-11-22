import 'package:get/get.dart';
import 'package:markshark_mvc/api_Service/profile_api.dart';
import 'package:markshark_mvc/constants/expo_all_const.dart';
import 'package:markshark_mvc/model/profile_model.dart';
import 'package:markshark_mvc/utils/tools.dart';

class ProfileController extends GetxController {
  Tools tools = Tools();

  static RxString userName = "".obs;
  static RxString userEmail = "".obs;
  static RxInt subjectCompleted = 0.obs;
  static RxInt questionAttempted = 0.obs;


  @override
  void onInit() {
    super.onInit();
    print("inside profile oninit");
    tools.getshared(UserId).then((value){
      if(value != null && value != ""){
        fetchProfileData(value);
      }
    });
  }

  fetchProfileData(userId) async {
    // fetch User details   
    print("inside fetchProfileData");

    ProfileModel profileModel = await ProfileApi.fetchProfile(userId);    

    userName.value = profileModel.response[0].username.toString();
    userEmail.value = profileModel.response[0].email.toString();
    subjectCompleted.value =
        int.parse(profileModel.response[0].subjectCount.toString());
    questionAttempted.value =
        int.parse(profileModel.response[0].queCount.toString());
    print("${userName.value}");

    // Get.to(SelectSubject(), transition: Transition.rightToLeft, duration: Duration(milliseconds: 1000));
  }
}
