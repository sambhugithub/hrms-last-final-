import 'package:hrms/helper/string.dart';

import '../../helper/api_base_helper.dart';

class AnnouncementRepository{


  static Future<Map<String, dynamic>> EmployeeAnnouncementList({
    required Map<String, dynamic> parameter,
  }) async {
    try {
      var announcementList = await ApiBaseHelper().postAPICall(employeeAnnouncementList, parameter);
      print('repository print announcement list: $announcementList');
      return announcementList;


    } on Exception catch (e) {
      throw ApiException(e.toString());
    }
  }
}