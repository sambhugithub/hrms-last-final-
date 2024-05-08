import 'package:hrms/helper/string.dart';

import '../../../helper/api_base_helper.dart';

class PerformanceManagementRepository{


  // organization performance management request list
  static Future<Map<String, dynamic>> OrganizationPerformanceReqList(
      {required Map<String, dynamic> parameter,}
      ) async {
    try {
      var leavetypeData = await ApiBaseHelper().getAPICall(organizationPerformanceReqList);
      print('repository print organization performance request list organization: $leavetypeData');
      return leavetypeData;


    } on Exception catch (e) {
      throw ApiException(e.toString());
    }
  }

}