import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/helper/prefkeys.dart';
import 'package:hrms/model/employee/clockin_clockout_model.dart';
import 'package:hrms/model/employee/employee_attendance_graph_report_model.dart';
import 'package:hrms/model/employee/employee_attendance_report_model.dart';
import 'package:hrms/repository/attendance/attendance_repository.dart';
import 'package:hrms/view/screens/employee_modules/attendance/dashboard/widgets/Attendance_dashboard.dart';
import 'package:hrms/view/widgets/shared_preference.dart';
import 'package:intl/intl.dart';

import '../../helper/routes.dart';
import '../../helper/string.dart';
import '../../localizations/app_localizations.dart';
import '../../view/widgets/toast_msg.dart';

class AttendanceProvider extends ChangeNotifier{

  //show calender
  bool _showCalender=false;
  get showCalender => _showCalender;

  setShowCalender(bool value){
    _showCalender=value;
    notifyListeners();
  }

  //selected month year
  String _correntMonthYear= DateFormat('MMMM - yyyy').format(DateTime.now());
  get currentMonthYear => _correntMonthYear;

  setCurrentMonthYear(DateTime curentDateTime){
    _correntMonthYear= DateFormat('MMMM - yyyy').format(curentDateTime);
    print(_correntMonthYear);
    notifyListeners();
  }

  bool _isLoading=false;
  get isLoading=>_isLoading;
  setIsLoading(value){
    _isLoading=value;
    notifyListeners();
  }

  String? type='',time_in='',time_in_location='',latitude='',longitude='';
  setType(String value){
    type=value;
    notifyListeners();
  }

  setTimeIn(String value){
    time_in=value;
    notifyListeners();
  }

  setTimeInLocation(String value){
    time_in_location=value;
    notifyListeners();
  }

  setLatitude(String value){
    latitude=value;
    notifyListeners();
  }

  setLongitude(String value){
    longitude=value;
    notifyListeners();
  }

  bool? _isClockIn;
  get isClockIn=>_isClockIn;
  setIsClockIn(value){
    _isClockIn=value;
    notifyListeners();
  }
  
  bool? _isHoliday;
  get isHoliday=>_isHoliday;
  setIsHoliday(value){
    _isHoliday=value;
    notifyListeners();
  }
  
  bool? _todayLogout;
  get todaylogout => _todayLogout;
  setTodayLogout(val){
    _todayLogout=val;
    notifyListeners();
  }

  //employee image
  String? _empImage;
  get empImage => _empImage;
  setEmpImage()async{
    _empImage=await SharedPreference().getStringValue(PrefKeys.EMPIMAGEURL);
    notifyListeners();
  }

  //designation
  String? _designation;
  get designation => _designation;
  setDesignation()async{
    _designation=await SharedPreference().getStringValue(PrefKeys.DESIGNATION);
    notifyListeners();
  }

  //employee name
  String? _empName;
  get empName => _empName;
  setEmpName()async{
    _empName=await SharedPreference().getStringValue(PrefKeys.NAME);
    notifyListeners();
  }


  ClockInClockOutModel? _clockinClockoutDetails;
  get clockinClockoutDetails=>_clockinClockoutDetails;
  setClockinClockoutDetails(value){
    _clockinClockoutDetails=value;
    notifyListeners();
  }

  String? _employeeid;
  get employeeid => _employeeid;
  setEmployeeId()async{
    _employeeid=await SharedPreference().getStringValue(PrefKeys.EMPLOYEEID);
   notifyListeners();
  }

  String _workReport = '';
  get workReport => _workReport;
  setWorkReport(v){
    _workReport=v;
    notifyListeners();
  }
// employee clockin clockout
  Future<Map<String, dynamic>> clockInClockOut(context) async {
    print('>>>>>>>>>>>>$workReport');
    await setEmployeeId();
    _isLoading=true;
    int? flag;
    try {
      var parameter = {
        EMPLOYEE_ID : employeeid,
        TYPE : type,
        TIME_IN : time_in,
        TIME_IN_LOCATION : time_in_location,
        LATITUDE : latitude,
        LONGITUDE : longitude,
        WORK_REPORT:workReport
      };
      var result = await AttendanceRepository.ClockInClockOut(parameter: parameter);
      setIsLoading(false);
      setIsClockIn(result['todayLogin']);
      flag = result['flag'];
      String errorMsg=result['message'];
      setIsHoliday(result['isHoliday']);
      setTodayLogout(result['todayLogout']);
      isHoliday?ToastMsg().showToast(Translation.of(context)!.translate('today_is_holiday')!, Colors.red):null;
      type=='' && todaylogout?ToastMsg().showToast(Translation.of(context)!.translate('today_You_done')!, Colors.red):null;

      if (flag==1) {
        ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_successfull_msg':type=='logout'?'clockout_successfull_msg':'')!, Colors.green);
        setClockinClockoutDetails(ClockInClockOutModel.fromJson(result['data']));
        //var getdata = result['data'][0];
        //type=='logout'?Routes.navigateToMainDashBoardAgain(context):null;
        return result;
      } else {
        ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_error_msg':type=='logout'?'clockout_error_msg':errorMsg)!, Colors.red);
        return {};
      }
    } catch (e) {
      return {};
    }
  }

  EmployeeAttendanceReportModel? _employeeAttendanceReport;
  EmployeeAttendanceReportModel? get employeeAttendanceReport => _employeeAttendanceReport;
  setEmployeeAttendanceReport(value){
    _employeeAttendanceReport =value;
    notifyListeners();
  }
  Future<Object> getEmployeeAttendanceReport(context) async {
    await setEmployeeId();
    setIsLoading(true);
    int? flag;
    String? errorMsg;
    try {
      var parameter = {
        EMPLOYEE_ID : employeeid,
      };
      var result = await AttendanceRepository.EmployeeAttendanceReport(monthYear: currentMonthYear,parameter: parameter);
      setIsLoading(false);

      flag = result['flag'];
      errorMsg=result['message'];
      if (flag==1) {
        await setEmployeeAttendanceReport(EmployeeAttendanceReportModel.fromJson(result['response']));
        //ToastMsg().showToast(Translation.of(context)!.translate('login_successfull_msg')!, Colors.green);
        //saveSharedPreferencesValue(result);
        //Routes.navigateToDashboard(context);
        return 1;
      } else {
        await setEmployeeAttendanceReport(EmployeeAttendanceReportModel.fromJson(result['response']));
        errorMsg!='Not Found Attendance list'?ToastMsg().showToast(errorMsg!, Colors.red):null;
        return 0;
      }
    } catch (e) {
      return {};
    }
  }


  Widget _employeeAttendanceDashboardWidget =const AttendanceDashboard();

  get employeeAttendanceDashboardWidget => _employeeAttendanceDashboardWidget;
  setEmployeeAttendanceDashboardWidget(Widget value){
    _employeeAttendanceDashboardWidget=value;
    notifyListeners();
  }

  EmployeeAttendanceGraphReportModel? _graphReport;
  EmployeeAttendanceGraphReportModel? get graphReport => _graphReport;
  setEmployeeAttendanceGraphReport(value){
    _graphReport=value;
    notifyListeners();
  }
  
  Future<Map<String, dynamic>> getEmployeeAttendancegraphReport(context) async {
    await setEmployeeId();
    _isLoading=true;
    int? flag;
    try {
      var parameter = {
        EMPLOYEE_ID : employeeid,
      };
      var result = await AttendanceRepository.EmployeeAttendanceGraphReport(parameter: parameter);
      setIsLoading(false);
      flag = result['flag'];
      String errorMsg=result['message'];


      if (flag==1) {
        await setEmployeeAttendanceGraphReport(EmployeeAttendanceGraphReportModel.fromJson(result['response']));
        //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_successfull_msg':type=='logout'?'clockout_successfull_msg':'')!, Colors.green);
        //var getdata = result['data'][0];
        //type=='logout'?Routes.navigateToMainDashBoardAgain(context):null;
        return result;
      } else {
        await setEmployeeAttendanceGraphReport(EmployeeAttendanceGraphReportModel.fromJson(result['response']));
        //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_error_msg':type=='logout'?'clockout_error_msg':errorMsg)!, Colors.red);
        return {};
      }
    } catch (e) {
      return {};
    }
  }

}