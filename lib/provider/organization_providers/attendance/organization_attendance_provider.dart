import 'package:flutter/cupertino.dart';
import 'package:hrms/model/employer/attendance/organization_attendance_list_model.dart';
import 'package:hrms/repository/organization_repositories/attendance/organization_attendance_repository.dart';
import 'package:hrms/view/screens/employer_modules/attendance/widgets/attendance_report.dart';

class OrganizationAttendanceProvider extends ChangeNotifier{


  bool _isLoading=true;
  bool get isLoading =>_isLoading;
  setIsLoading(value){
    _isLoading=value;
    notifyListeners();
  }
  
  OrganizationAttendanceListModel? _organizationAttendanceListData;
  OrganizationAttendanceListModel? get organizationAttendanceListData => _organizationAttendanceListData;
  setOrganizationAttendanceListData(value){
    _organizationAttendanceListData=value;
    notifyListeners();
  }




  //GET organization attendance list
  Future<Map<String, dynamic>>  getOrganizationAttendanceList(context) async {
    //await setEmployeeId();
    //await setOrganizationId();
    _isLoading=true;
    int? flag;
    try {
      var parameter = {
        "":""
        //ORGANIZATION_ID : employeeid,
      };
      var result = await OrganizationAttendanceRepository.OrganizationAttendanceList(parameter: parameter);
      setIsLoading(false);
      flag = result['flag'];
      String errorMsg=result['message'];


      if (flag==1) {
        await setOrganizationAttendanceListData(OrganizationAttendanceListModel.fromJson(result));
        //await setOrganizationEmployeeListData(OrganizationEmployeeListModel.fromJson(result));
        //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_successfull_msg':type=='logout'?'clockout_successfull_msg':'')!, Colors.green);
        //var getdata = result['data'][0];
        //type=='logout'?Routes.navigateToMainDashBoardAgain(context):null;
        return result;
      } else {
        await setOrganizationAttendanceListData(OrganizationAttendanceListModel.fromJson(result));
        //await setOrganizationEmployeeListData(OrganizationEmployeeListModel.fromJson(result));
        //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_error_msg':type=='logout'?'clockout_error_msg':errorMsg)!, Colors.red);
        return {};
      }
    } catch (e) {
      return {};
    }
  }
}