import 'package:hrms/helper/string.dart';

import '../../helper/api_base_helper.dart';

class LeaveRepository{


// employee leave types
  static Future<Map<String, dynamic>> EmployeeLeaveTypes({
    required Map<String, dynamic> parameter,
  }) async {
    try {
      var leavetypeData = await ApiBaseHelper().postAPICall(employeeLeaveType, parameter);
      print('repository print leave types: $leavetypeData');
      return leavetypeData;


    } on Exception catch (e) {
      throw ApiException(e.toString());
    }
  }


  //employee new leave Application
  static Future<Map<String, dynamic>> EmployeeNewLeaveApplication({
    required Map<String, dynamic> parameter,
  }) async {
    try {
      var leaveapplication = await ApiBaseHelper().postAPICall(newLeaveApplication, parameter);
      print('repository print new leaven Application: $leaveapplication');
      return leaveapplication;


    } on Exception catch (e) {
      throw ApiException(e.toString());
    }
  }


  //employee leave application status
  static Future<Map<String, dynamic>> EmployeeLeaveApplicationStatus({
    required Map<String, dynamic> parameter,
  }) async {
    try {
      var leaveapplicationstatus = await ApiBaseHelper().postAPICall(employeeLeaveStatus, parameter);
      print('repository print employee leave status: $leaveapplicationstatus');
      return leaveapplicationstatus;


    } on Exception catch (e) {
      throw ApiException(e.toString());
    }
  }




}