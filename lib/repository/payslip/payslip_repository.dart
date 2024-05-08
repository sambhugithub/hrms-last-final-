import 'package:hrms/helper/string.dart';

import '../../helper/api_base_helper.dart';

class PayslipRepository{



  //employee payslip list
  static Future<Map<String, dynamic>> EmployeePayslipList({
    required Map<String, dynamic> parameter,
  }) async {
    try {
      var payslipData = await ApiBaseHelper().postAPICall(employeePayslip, parameter);
      print('repository print payslip: $payslipData');
      return payslipData;


    } on Exception catch (e) {
      throw ApiException(e.toString());
    }
  }
}