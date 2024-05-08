import 'package:flutter/cupertino.dart';
import 'package:hrms/helper/string.dart';
import 'package:hrms/model/employer/leave_approver/approved_leave_list.dart';
import 'package:hrms/model/employer/leave_approver/not_approved_leave_list.dart';
import 'package:hrms/repository/organization_repositories/leave_approver/leave_approver_repository.dart';

import '../../../helper/prefkeys.dart';
import '../../../view/widgets/shared_preference.dart';

class LeaveApproverProvider extends ChangeNotifier{

  bool _isLoading=true;
  get isLoading => _isLoading;
  setIsLoading(value){
    _isLoading=value;
    notifyListeners();
  }

  String? _employeeid;
  get employeeid => _employeeid;
  setEmployeeId()async{
    _employeeid=await SharedPreference().getStringValue(PrefKeys.EMPLOYEEID);
    notifyListeners();
  }


  String _projectStatus='Not Approved';
  get projectStatus =>_projectStatus;
  setProjectStatus(value){
    _projectStatus=value;
    notifyListeners();
  }
  
  NotApprovedLeaveList? _notApprovedLeaveListData;
  NotApprovedLeaveList? get notApprovedLeaveListData => _notApprovedLeaveListData;
  setNotApprovedLeaveListData(value){
    _notApprovedLeaveListData=value;
    notifyListeners();
  }


  ApprovedLeaveList? _approvedLeaveListData;
  ApprovedLeaveList? get approvedLeaveListData =>_approvedLeaveListData;
  setApprovedLeaveListData(value){
    _approvedLeaveListData=value;
    notifyListeners();
  }
  
  






  //GET leave types
  Future<Map<String, dynamic>>  getOrganizationLeaveApproverList(context) async {
    await setEmployeeId();
    //await setOrganizationId();
    _isLoading=true;
    int? flag;
    try {
      var parameter = {
        EMPLOYEE_ID : employeeid,
        PROJECTSTATUS: projectStatus
      };
      var result = await LeaveApproverRepository.OrganizationLeaveList(parameter: parameter);
      setIsLoading(false);
      flag = result['flag'];
      String errorMsg=result['message'];


      if (flag==1) {
        if(projectStatus=='Not Approved'){
          await setNotApprovedLeaveListData(NotApprovedLeaveList.fromJson(result));
        }
        else if(projectStatus=='Approved'){
          await setApprovedLeaveListData(ApprovedLeaveList.fromJson(result));
        }
        else
          null;
        //await setLeaveTypes(LeaveTypeModel.fromJson(result['response']));
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
}