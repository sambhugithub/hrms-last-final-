import '../../helper/api_base_helper.dart';
import '../../helper/string.dart';

class AttendanceRepository{




  static Future<Map<String, dynamic>> ClockInClockOut({
    required Map<String, dynamic> parameter,
  }) async {
    try {
      var clockinclockoutData = await ApiBaseHelper().postAPICall(clockInClockOut, parameter);
      print('repository print clockinclockout: $clockinclockoutData');
      return clockinclockoutData;


    } on Exception catch (e) {
      throw ApiException(e.toString());
    }
  }

  static Future<Map<String, dynamic>> EmployeeAttendanceReport({
    required String monthYear,required Map<String, dynamic> parameter,
}) async {
    Uri url=Uri.parse('$employeeAttendanceReport''?gm=$monthYear');
    try {
      var attendanceReport = await ApiBaseHelper().postAPICall((url),parameter );
      print('employee attndnc report: $attendanceReport');
      return attendanceReport;


    } on Exception catch (e) {
      throw ApiException(e.toString());
    }
  }

  static Future<Map<String, dynamic>> EmployeeAttendanceGraphReport({
    required Map<String, dynamic> parameter,
  }) async {
    try {
      var graphData = await ApiBaseHelper().postAPICall(employeeAttendanceGraph, parameter);
      print('repository print attendance graph report: $graphData');
      return graphData;


    } on Exception catch (e) {
      throw ApiException(e.toString());
    }
  }


}