import 'package:hrms/helper/string.dart';

import '../../../helper/api_base_helper.dart';

class EmployeeRepository{

  // organization employee list
  static Future<Map<String, dynamic>> OrganizationEmployeeList({
    required Map<String, dynamic> parameter,
  }) async {
    try {
      var leavetypeData = await ApiBaseHelper().postAPICall(organizationEmployeeList, parameter);
      print('repository print employee list organization: $leavetypeData');
      return leavetypeData;


    } on Exception catch (e) {
      throw ApiException(e.toString());
    }
  }


}