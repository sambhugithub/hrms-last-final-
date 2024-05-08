import 'package:hrms/helper/string.dart';

import '../../../helper/api_base_helper.dart';

class OrganizationTaskRepository{

  // task
  static Future<Map<String, dynamic>> OrganizationTask(
      //{required Map<String, dynamic> parameter,}
      ) async {
    try {
      var leavetypeData = await ApiBaseHelper().getAPICall(organizationTask);
      print('repository print task organization: $leavetypeData');
      return leavetypeData;


    } on Exception catch (e) {
      throw ApiException(e.toString());
    }
  }


}