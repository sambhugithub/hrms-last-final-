import 'package:hrms/helper/string.dart';

import '../../../helper/api_base_helper.dart';

class OrganizationAttendanceRepository{



  // organization employee list
  static Future<Map<String, dynamic>> OrganizationAttendanceList({
    required Map<String, dynamic> parameter,
  }) async {
    try {
      var leavetypeData = await ApiBaseHelper().postAPICall(organizationAttendanceList, parameter);
      print('repository print attendance list organization: $leavetypeData');
      return leavetypeData;


    } on Exception catch (e) {
      throw ApiException(e.toString());
    }
  }
}