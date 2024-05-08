import 'package:flutter/cupertino.dart';
import 'package:hrms/model/employer/organization_profile/organization_profile_model.dart';
import 'package:hrms/repository/organization_repositories/organization_profile/organization_profile_repository.dart';

class OrganizationProfileProvider extends ChangeNotifier{

  bool _isLoading=true;
  bool get isLoading=> _isLoading;
  setIsLoading(value){
    _isLoading=value;
    notifyListeners();
  }


  OrganizationProfileDashboardModel? _organizationProfileDashboardData;
  OrganizationProfileDashboardModel? get organizationProfileDashboardData => _organizationProfileDashboardData;
  setOrganizationProfileDashboardData(value){
    _organizationProfileDashboardData=value;
    notifyListeners();
  }





  //GET organization profile dashboard
  Future<Map<String, dynamic>>  getOrganizationProfileData(context) async {
    //await setEmployeeId();
    //await setOrganizationId();
    //_isLoading=true;
    int? flag;
    try {
      Map<String,dynamic> parameter = {
        /*EMPLOYEE_ID : employeeid,
        PROJECTSTATUS: projectStatus*/
      };
      var result = await OrganizationProfileRepository.OrganizationProfileDashboard(parameter: parameter);
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
        await setOrganizationProfileDashboardData(OrganizationProfileDashboardModel.fromJson(result));
        //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_successfull_msg':type=='logout'?'clockout_successfull_msg':'')!, Colors.green);
        //var getdata = result['data'][0];
        //type=='logout'?Routes.navigateToMainDashBoardAgain(context):null;
        return result;
      } else {
        await setOrganizationProfileDashboardData(OrganizationProfileDashboardModel.fromJson(result));
        //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_error_msg':type=='logout'?'clockout_error_msg':errorMsg)!, Colors.red);
        return {};
      }
    } catch (e) {
      return {};
    }
  }



}