import 'package:hrms/helper/string.dart';

import '../../../helper/api_base_helper.dart';

class OrganizationRotaRepository{


  // rota
  static Future<Map<String, dynamic>> OrganizationRota(
      //{required Map<String, dynamic> parameter,}
      ) async {
    try {
      var leavetypeData = await ApiBaseHelper().getAPICall(organizationRota);
      print('repository print rota dashboard organization: $leavetypeData');
      return leavetypeData;


    } on Exception catch (e) {
      throw ApiException(e.toString());
    }
  }


}