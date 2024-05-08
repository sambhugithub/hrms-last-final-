import 'package:hrms/helper/string.dart';

import '../../../helper/api_base_helper.dart';

class LeaveApproverRepository{



  // leave list
  static Future<Map<String, dynamic>> OrganizationLeaveList({
    required Map<String, dynamic> parameter,
  }) async {
    try {
      var leavetypeData = await ApiBaseHelper().postAPICall(organizationLeaveApproverList, parameter);
      print('repository print leave list organization: $leavetypeData');
      return leavetypeData;


    } on Exception catch (e) {
      throw ApiException(e.toString());
    }
  }


}