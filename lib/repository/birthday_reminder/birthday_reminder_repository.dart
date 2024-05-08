import 'package:hrms/helper/string.dart';

import '../../helper/api_base_helper.dart';

class BirthdayReminderRepository{


  //birthday list
  static Future<Map<String, dynamic>> BirthdayReminderList({
    required Map<String, dynamic> parameter,
  }) async {
    try {
      var birthdayData = await ApiBaseHelper().postAPICall(birthdayReminder, parameter);
      print('repository print birthday list: $birthdayData');
      return birthdayData;


    } on Exception catch (e) {
      throw ApiException(e.toString());
    }
  }
}