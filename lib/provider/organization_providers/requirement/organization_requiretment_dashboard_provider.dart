import 'package:flutter/cupertino.dart';
import 'package:hrms/model/employer/requiretment/organization_requiretment_dashboard_model.dart';
import 'package:hrms/repository/organization_repositories/requirement/organization_requirement_repository.dart';

class OrganizationRequiretmentDashboardProvider extends ChangeNotifier{


  bool _isLoading=true;
  bool get isLoading =>_isLoading;
  setIsLoading(value){
    _isLoading=value;
    notifyListeners();
  }


  OrganizationRequiretmentDashboardModel? _organizationRequiretmentDashboardData;
  OrganizationRequiretmentDashboardModel? get organizationRequiretmentDashboardData => _organizationRequiretmentDashboardData;
  setOrganizationRequiretmentDashboardData(value){
    _organizationRequiretmentDashboardData=value;
    notifyListeners();
  }




  //GET requiretment dashboard data
  Future<Map<String, dynamic>>  getOrganizationRequiretmentDashboardData(context) async {
    //await setEmployeeId();
    //await setOrganizationId();
    _isLoading=true;
    int? flag;
    try {
      /*var parameter = {
        EMPLOYEE_ID : employeeid,
        PROJECTSTATUS: projectStatus
      };*/
      var result = await OrganizationRequirementRepository.OrganizationRequirementDashboard();
      setIsLoading(false);
      flag = result['flag'];
      String errorMsg=result['message'];


      if (flag==1) {
        await setOrganizationRequiretmentDashboardData(OrganizationRequiretmentDashboardModel.fromJson(result));
        //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_successfull_msg':type=='logout'?'clockout_successfull_msg':'')!, Colors.green);
        //var getdata = result['data'][0];
        //type=='logout'?Routes.navigateToMainDashBoardAgain(context):null;
        return result;
      } else {
        await setOrganizationRequiretmentDashboardData(OrganizationRequiretmentDashboardModel.fromJson(result));
        //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_error_msg':type=='logout'?'clockout_error_msg':errorMsg)!, Colors.red);
        return {};
      }
    } catch (e) {
      return {};
    }
  }
}