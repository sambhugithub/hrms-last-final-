import 'package:flutter/cupertino.dart';
import 'package:hrms/model/employer/performance_management/organization_performance_request_list_model.dart';

import '../../../repository/organization_repositories/performance_management/performance_management_repository.dart';

class PerformanceRequestListProvider extends ChangeNotifier{

bool _isLoading=true;
bool get isLoading=>_isLoading;
setIsLoading(value){
  _isLoading=value;
  notifyListeners();
}


OrganizationPerformanceRequestListModel? _organizationPerformanceRequestListData;
OrganizationPerformanceRequestListModel? get organizationPerformanceRequestListData => _organizationPerformanceRequestListData;
 setOrganizationPerformanceRequestListData(value){
  _organizationPerformanceRequestListData =value;
  notifyListeners();
}


//get organization performance request list
  Future<Map<String, dynamic>>  getOrganizationPerformanceRequestList(context) async {
    //await setEmployeeId();
    //await setOrganizationId();
    _isLoading=true;
    int? flag;
    try {
      Map<String,dynamic> parameter = {
        /*EMPLOYEE_ID : employeeid,
        PROJECTSTATUS: projectStatus*/
      };
      var result = await PerformanceManagementRepository.OrganizationPerformanceReqList(parameter: parameter);
      setIsLoading(false);
      flag = result['flag'];
      String errorMsg=result['message'];


      if (flag==1) {
        /*if(projectStatus=='Not Approved'){
          await setNotApprovedLeaveListData(NotApprovedLeaveList.fromJson(result));
        }
        else if(projectStatus=='Approved'){
          await setApprovedLeaveListData(ApprovedLeaveList.fromJson(result));
        }
        else
          null;*/
        await setOrganizationPerformanceRequestListData(OrganizationPerformanceRequestListModel.fromJson(result));
        //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_successfull_msg':type=='logout'?'clockout_successfull_msg':'')!, Colors.green);
        //var getdata = result['data'][0];
        //type=='logout'?Routes.navigateToMainDashBoardAgain(context):null;
        return result;
      } else {
        await setOrganizationPerformanceRequestListData(OrganizationPerformanceRequestListModel.fromJson(result));
        //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_error_msg':type=='logout'?'clockout_error_msg':errorMsg)!, Colors.red);
        return {};
      }
    } catch (e) {
      return {};
    }
  }
}