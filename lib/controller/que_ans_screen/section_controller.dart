import 'package:get/get.dart';
import 'package:markshark_mvc/api_Service/section_api.dart';
import 'package:markshark_mvc/model/section_model.dart';
import 'package:markshark_mvc/screens/queAnsScreen.dart';
import 'package:markshark_mvc/screens/section.dart';

class SectionController extends GetxController {
  static RxList sectionList = [].obs;

  fetchSetions(subjectId) async {
    SectionModel sectionModel = await SectionApi.fetchSection(subjectId);

    sectionList.value = sectionModel.response[0].sections;
    Get.to(Section(subjectId: subjectId),
        // transition: Transition.rightToLeft,
        duration: Duration(milliseconds: 100));
    print("fetchSetions${sectionList.value}");
  }
}
