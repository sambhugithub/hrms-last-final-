import 'package:hrms/helper/string.dart';

import '../../../helper/api_base_helper.dart';

class OrganizationRequirementRepository{




  // requirement Dashboard
  static Future<Map<String, dynamic>> OrganizationRequirementDashboard(
      //{required Map<String, dynamic> parameter,}
  ) async {
    try {
      var leavetypeData = await ApiBaseHelper().getAPICall(organizationRequirementDashboard);
      print('repository print requirement dashboard organization: $leavetypeData');
      return leavetypeData;


    } on Exception catch (e) {
      throw ApiException(e.toString());
    }
  }
}