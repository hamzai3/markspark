import 'package:get/get.dart';
import 'package:markshark_mvc/api_Service/sub_details_api.dart';
import 'package:markshark_mvc/model/subject_details_model.dart';

class SelectSubjectController extends GetxController{
   static RxList<Subject> subjectList = <Subject>[].obs;
  fetchSubjects(userId) async{
    SubjectDetailsModel subjectDetailsModel =
        await SubjectApi.fetchSubject(userId);
    // for(int i in )
    subjectList.value = subjectDetailsModel.response[0].subject;
    print("subjectList.value $subjectList");

    // print("${leaderBoardList.value}");
  }
}