import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/localizations/app_localizations.dart';
import 'package:hrms/model/employee/leave/leave_type_model.dart';
import 'package:hrms/provider/leave_application/employee_leave_status_model.dart';
import 'package:hrms/repository/leave/leave_repository.dart';
import 'package:hrms/view/screens/employee_modules/leave_application/dashboard/widgets/leave_application_status.dart';
import 'package:hrms/view/screens/employee_modules/leave_application/dashboard/widgets/new_leave_application.dart';
import 'package:hrms/view/widgets/toast_msg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../helper/prefkeys.dart';
import '../../helper/string.dart';
import '../../repository/attendance/attendance_repository.dart';
import '../../view/widgets/shared_preference.dart';

class LeaveApplicationProvider extends ChangeNotifier{



Widget _leaveApplicationModuleWidget =LeaveApplicationStatus();
get leaveApplicationModuleWidge => _leaveApplicationModuleWidget;

setLeaveApplicationModuleWidget(value){
  _leaveApplicationModuleWidget=value;
  notifyListeners();
}

String _halfDay='HALF DAY';
String _fullDay='FULL DAY';
get halfDay=>_halfDay;
get fullday=>_fullDay;

String _dayType='';
get dayType=> _dayType;
setDayType(value){
  _dayType=value;
  notifyListeners();
}

String? _leaveType;
get leaveType =>_leaveType;
setLeaveType(value){
  _leaveType=value;
  notifyListeners();
}

String? _fromDate;
String? _toDate;
get fromDate =>_fromDate;
get toDate =>_toDate;
setFromDate(DateTime v){
  _fromDate= DateFormat('yyyy-MM-dd').format(v);
  notifyListeners();
}
setToDate(DateTime v){
  _toDate= DateFormat('yyyy-MM-dd').format(v);
  notifyListeners();
}

XFile? _image;
XFile? get image => _image;
setImage(v){
  _image=v;
  notifyListeners();
}

bool _isLoading=false;
get isLoading => _isLoading;
setIsLoading(v){
  _isLoading=v;
  notifyListeners();
}


String? _employeeid;
get employeeid => _employeeid;
setEmployeeId()async{
  _employeeid=await SharedPreference().getStringValue(PrefKeys.EMPLOYEEID);
  notifyListeners();
}

String? _organizationid;
get organizationid => _organizationid;
setOrganizationId()async{
  _organizationid=await SharedPreference().getStringValue(PrefKeys.ORGANIGATIONID);
  notifyListeners();
}

String? _employeeName;
get employeeName => _employeeName;
setEmployeeName()async{
  _employeeName=await SharedPreference().getStringValue(PrefKeys.NAME);
  notifyListeners();
}

String? _reportingAuth;
get reportingAuth => _reportingAuth;
setReportingAuth()async{
  _reportingAuth=await SharedPreference().getStringValue(PrefKeys.REPORTAUTH);
  notifyListeners();
}

String? _leaveAuth;
get leaveAuth => _leaveAuth;
setLeaveAuth()async{
  _leaveAuth=await SharedPreference().getStringValue(PrefKeys.LEAVEAUTH);
  notifyListeners();
}

LeaveTypeModel? _leaveTypes;
LeaveTypeModel? get leaveTypes =>_leaveTypes;
setLeaveTypes(v){
  _leaveTypes=v;
  notifyListeners();
}

//GET leave types
Future<Map<String, dynamic>> getEmployeeLeaveTypes(context) async {
  await setEmployeeId();
  await setOrganizationId();
  _isLoading=true;
  int? flag;
  try {
    var parameter = {
      EMPLOYEE_ID : employeeid,
      ORGANIZATION_ID: organizationid
    };
    var result = await LeaveRepository.EmployeeLeaveTypes(parameter: parameter);
    setIsLoading(false);
    flag = result['flag'];
    String errorMsg=result['message'];


    if (flag==1) {
      await setLeaveTypes(LeaveTypeModel.fromJson(result['response']));
      //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_successfull_msg':type=='logout'?'clockout_successfull_msg':'')!, Colors.green);
      //var getdata = result['data'][0];
      //type=='logout'?Routes.navigateToMainDashBoardAgain(context):null;
      return result;
    } else {
      //await setEmployeeAttendanceGraphReport(EmployeeAttendanceGraphReportModel.fromJson(result['response']));
      //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_error_msg':type=='logout'?'clockout_error_msg':errorMsg)!, Colors.red);
      return {};
    }
  } catch (e) {
    return {};
  }
}


int? _leaveTypeId;
get leaveTypeId => _leaveTypeId;
setLeaveTypeId(v){
  _leaveTypeId=v;
  notifyListeners();
}

String? _leaveReason;
get leaveReason => _leaveReason;
setLeaveReason(){
  _leaveReason=reason.text;
  notifyListeners();
}

TextEditingController reason=TextEditingController();
//new Leave Application
  Future<Map<String, dynamic>> employeeNewLeaveApplication(context) async {
    await setEmployeeId();
    await setOrganizationId();
    await setReportingAuth();
    await setLeaveAuth();
    await setEmployeeName();
    _isLoading=true;
    int? flag;
    try {
      var parameter = {
        EMPLOYEE_ID : employeeid,
        ORGANIZATION_ID: organizationid,
        EMPLOYEENAME:employeeName,
        LEAVETYPE: leaveTypeId.toString(),
        REPORTINGAUTH: reportingAuth,
        LEAVEAUTH : leaveAuth,
        DATEFROM : fromDate,
        DATETO : toDate,
        LEAVEDAY : leaveType,
        REASON : leaveReason
      };
      var result = await LeaveRepository.EmployeeNewLeaveApplication(parameter: parameter);
      setIsLoading(false);
      flag = result['flag'];
      String errorMsg=result['message'];


      if (flag==1) {
        //await setLeaveTypes(LeaveTypeModel.fromJson(result['response']));
        ToastMsg().showToast('${Translation.of(context)!.translate('application_submit_successfull')}', Colors.green);
        setLeaveApplicationModuleWidget(const LeaveApplicationStatus());
        //var getdata = result['data'][0];
        //type=='logout'?Routes.navigateToMainDashBoardAgain(context):null;
        return result;
      } else {
        ToastMsg().showToast('${Translation.of(context)!.translate('application_submit_error')}', Colors.red);
        //await setEmployeeAttendanceGraphReport(EmployeeAttendanceGraphReportModel.fromJson(result['response']));
        //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_error_msg':type=='logout'?'clockout_error_msg':errorMsg)!, Colors.red);
        return {};
      }
    } catch (e) {
      return {};
    }
  }

String? _leaveStatusType;
  get leaveStatusType => _leaveStatusType;
  setLeaveStatusType(v){
    _leaveStatusType=v;
    notifyListeners();
  }

  EmployeeLeaveStatusModel? _employeeLeaveStatusData;
  EmployeeLeaveStatusModel? get employeeLeaveStatusData => _employeeLeaveStatusData;
  setEmployeeLeaveStatusData(v){
    _employeeLeaveStatusData = v;
    notifyListeners();
  }
  //employee leave application status
  Future<Map<String, dynamic>> employeeLeaveApplicationStatus(context) async {
    await setEmployeeId();
    await setOrganizationId();
    await setReportingAuth();
    await setLeaveAuth();
    await setEmployeeName();
    _isLoading=true;
    int? flag;
    try {
      var parameter = {
        EMPLOYEE_ID : employeeid,
        ORGANIZATION_ID : organizationid,
        LEAVETYPE : leaveStatusType
      };
      var result = await LeaveRepository.EmployeeLeaveApplicationStatus(parameter: parameter);
      setIsLoading(false);
      flag = result['flag'];
      String errorMsg=result['message'];


      if (flag==1) {
        await setEmployeeLeaveStatusData(EmployeeLeaveStatusModel.fromJson(result['response']));
        //ToastMsg().showToast('${Translation.of(context)!.translate('application_submit_successfull')}', Colors.green);
        //setLeaveApplicationModuleWidget(const LeaveApplicationStatus());
        //var getdata = result['data'][0];
        //type=='logout'?Routes.navigateToMainDashBoardAgain(context):null;
        return result;
      } else {
        await setEmployeeLeaveStatusData(EmployeeLeaveStatusModel.fromJson(result['response']));
        //ToastMsg().showToast('${Translation.of(context)!.translate('application_submit_error')}', Colors.red);
        //await setEmployeeAttendanceGraphReport(EmployeeAttendanceGraphReportModel.fromJson(result['response']));
        //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_error_msg':type=='logout'?'clockout_error_msg':errorMsg)!, Colors.red);
        return {};
      }
    } catch (e) {
      return {};
    }
  }


}