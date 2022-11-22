import 'package:get/get.dart';
import 'package:markshark_mvc/constants/expo_all_const.dart';
import 'package:markshark_mvc/controller/fetch_app_Ddata_controller.dart';
import 'package:markshark_mvc/screens/loginScreen.dart';
import 'package:markshark_mvc/screens/selectSubject.dart';
import 'package:markshark_mvc/utils/tools.dart';

class SplashScreenController extends GetxController {
  Tools tools = Tools();
  @override
  void onInit() {
    super.onInit();
    print("in onInit");
    Future.delayed(const Duration(milliseconds: 1500), () {
      _checkIfUserLogedIn();
      
    });

    
  }


  _checkIfUserLogedIn() async {
    FetAppDataCotroller _fetAppDataCotroller = FetAppDataCotroller();
    await tools.getshared(UserId).then((value) async{
      if(value.toString() == "null" || value == ""){
        Get.to(LoginScreen(),
          transition: Transition.rightToLeft,
          duration: Duration(milliseconds: 1000));
      }
      else{
                
        await _fetAppDataCotroller.fetchData();
        
      }
    });
  }
}
