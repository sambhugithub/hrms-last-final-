import 'package:hrms/helper/string.dart';
import 'package:hrms/view/screens/employer_modules/organization_profile/organization_profile.dart';

import '../../../helper/api_base_helper.dart';

class OrganizationProfileRepository{



  // organization profile dashboard
  static Future<Map<String, dynamic>> OrganizationProfileDashboard(
      {required Map<String, dynamic> parameter,}
      ) async {
    try {
      var leavetypeData = await ApiBaseHelper().postAPICall(organizationProfile, parameter);
      print('repository print organization profile dashboard organization: $leavetypeData');
      return leavetypeData;


    } on Exception catch (e) {
      throw ApiException(e.toString());
    }
  }
}