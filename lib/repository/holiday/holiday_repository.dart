import 'package:hrms/helper/string.dart';

import '../../helper/api_base_helper.dart';

class HolidayRepository{


  //employee holiday list
  static Future<Map<String, dynamic>> EmployeeHolidayList({
    required Map<String, dynamic> parameter,
  }) async {
    try {
      var holidayData = await ApiBaseHelper().postAPICall(employeeHoliday, parameter);
      print('repository print holiday: $holidayData');
      return holidayData;


    } on Exception catch (e) {
      throw ApiException(e.toString());
    }
  }
}