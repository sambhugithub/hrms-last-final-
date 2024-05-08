import 'package:hrms/helper/string.dart';

import '../../helper/api_base_helper.dart';

class LoginRepository{


  static Future<Map<String, dynamic>> LogIn({
    required Map<String, dynamic> parameter,
  }) async {
    try {
      var loginData = await ApiBaseHelper().postAPICall(logIn, parameter);
      print('repository print: $loginData');
      return loginData;


    } on Exception catch (e) {
      throw ApiException(e.toString());
    }
  }

}