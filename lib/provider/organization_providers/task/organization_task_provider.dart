import 'package:flutter/cupertino.dart';
import 'package:hrms/model/employer/task/organization_task_model.dart';
import 'package:hrms/repository/organization_repositories/task/organization_task_repository.dart';

class OrganizationTaskProvider extends ChangeNotifier{


  bool _isLoading=false;
  bool get isLoading=>_isLoading;
  setIsLoading(value){
    _isLoading=value;
    notifyListeners();
  }


  OrganizationTaskModel? _organizationTaskData;
  OrganizationTaskModel? get organizationTaskData => _organizationTaskData;
  setOrganizationTaskData(value){
    _organizationTaskData=value;
    notifyListeners();
  }

  //GET organization task
  Future<Map<String, dynamic>>  getOrganizationTaskData(context) async {
    //await setEmployeeId();
    //await setOrganizationId();
    _isLoading=true;
    int? flag;
    try {
      /*var parameter = {
        EMPLOYEE_ID : employeeid,
        PROJECTSTATUS: projectStatus
      };*/
      var result = await OrganizationTaskRepository.OrganizationTask();
      setIsLoading(false);
      flag = result['flag'];
      String errorMsg=result['message'];


      if (flag==1) {
        await setOrganizationTaskData(OrganizationTaskModel.fromJson(result));
        //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_successfull_msg':type=='logout'?'clockout_successfull_msg':'')!, Colors.green);
        //var getdata = result['data'][0];
        //type=='logout'?Routes.navigateToMainDashBoardAgain(context):null;
        return result;
      } else {
        await setOrganizationTaskData(OrganizationTaskModel.fromJson(result));
        //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_error_msg':type=='logout'?'clockout_error_msg':errorMsg)!, Colors.red);
        return {};
      }
    } catch (e) {
      return {};
    }
  }



}