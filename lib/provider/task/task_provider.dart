import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/helper/string.dart';
import 'package:hrms/model/employee/task/employee_project_labels_model.dart';
import 'package:hrms/model/employee/task/employee_task_dashboard_model.dart';
import 'package:hrms/model/employee/task/employee_task_list_model.dart';
import 'package:hrms/repository/task/task_repository.dart';
import 'package:hrms/view/screens/employee_modules/tasks/widgets/task_dashboard.dart';

import '../../helper/prefkeys.dart';
import '../../localizations/app_localizations.dart';
import '../../view/widgets/shared_preference.dart';
import '../../view/widgets/toast_msg.dart';

class TaskProvider extends ChangeNotifier{



Widget _employeeTaskModuleWidget =const TaskDashboard();
get employeeTaskModuleWidget => _employeeTaskModuleWidget;
setEmployeeTaskModuleWidget(value){
  _employeeTaskModuleWidget=value;
  notifyListeners();
}

bool _isLoading=false;
get isLoading => _isLoading;
setIsLoading(value){
  _isLoading=value;
  notifyListeners();
}

String? _userPrimaryId;
get userPrimaryId => _userPrimaryId;
setUserPrimaryId()async{
  int value =await SharedPreference().getIntValue(PrefKeys.USERPRIMARYID);
  _userPrimaryId=value.toString();
  notifyListeners();
}

String? _employeePrimaryid;
get employeePrimaryId =>_employeePrimaryid;
setEmployeePrimaryId()async{
  int value =await SharedPreference().getIntValue(PrefKeys.EMPLOYEEPRIMARYID);
  _employeePrimaryid=value.toString();
  notifyListeners();
}


EmployeeTaskDashboardModel? _taskDashboardData;
EmployeeTaskDashboardModel? get taskDashboardData => _taskDashboardData;

setTaskDashboardData(value){
  _taskDashboardData = value;
  notifyListeners();
}




//taskdashboard data get
  Future<Map<String, dynamic>> getEmployeeTaskDashboardData(context) async {
    setIsLoading(true);
    //await setUserPrimaryId();
    await setEmployeePrimaryId();
    int? flag;
    try {
      print(userPrimaryId);
      var parameter = {
        //USERPRIMARYID : userPrimaryId
        EMPLOYEEPRIMARYID:employeePrimaryId
      };
      var result = await TaskRepository.EmployeeTaskDashboardData(parameter: parameter);
      flag = result['flag'];
      String errorMsg=result['message'];


      if (flag==1) {
        await setTaskDashboardData(EmployeeTaskDashboardModel.fromJson(result));
        setIsLoading(false);
        //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_successfull_msg':type=='logout'?'clockout_successfull_msg':'')!, Colors.green);
        //var getdata = result['data'][0];
        //type=='logout'?Routes.navigateToMainDashBoardAgain(context):null;
        return result;
      } else {
        await setTaskDashboardData(EmployeeTaskDashboardModel.fromJson(result));
        setIsLoading(false);
        //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_error_msg':type=='logout'?'clockout_error_msg':errorMsg)!, Colors.red);
        return {};
      }
    } catch (e) {
      print('end');
      return {};
    }
  }


  String? _projectId;
get projectId =>_projectId;
setProjectId(value){
  _projectId=value;
  notifyListeners();
}

String? _projectStatus;
get projectStatus => _projectStatus;
setProjectStatus(value){
  _projectStatus=value;
  notifyListeners();
}


EmployeeTaskListModel? _employeeTaskList;
EmployeeTaskListModel? get employeeTaskList =>_employeeTaskList;
setEmployeeTaskList(value){
  _employeeTaskList=value;
  notifyListeners();
}

//get employee task list
  Future<Map<String, dynamic>> getEmployeeTaskListData(context) async {
    setIsLoading(true);
    //await setUserPrimaryId();
    await setEmployeePrimaryId();
    int? flag;
    try {
      print(userPrimaryId);
      var parameter = {
        //USERPRIMARYID : userPrimaryId
        PROJECTID:projectId,
        EMPLOYEE_ID:employeePrimaryId,
        PROJECTSTATUS:projectStatus
      };
      var result = await TaskRepository.EmployeeTaskListData(parameter: parameter);
      flag = result['flag'];
      String errorMsg=result['message'];


      if (flag==1) {
        await setEmployeeTaskList(EmployeeTaskListModel.fromJson(result));
        setIsLoading(false);
        //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_successfull_msg':type=='logout'?'clockout_successfull_msg':'')!, Colors.green);
        //var getdata = result['data'][0];
        //type=='logout'?Routes.navigateToMainDashBoardAgain(context):null;
        return result;
      } else {
        await setEmployeeTaskList(EmployeeTaskListModel.fromJson(result));
        setIsLoading(false);
        //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_error_msg':type=='logout'?'clockout_error_msg':errorMsg)!, Colors.red);
        return {};
      }
    } catch (e) {
      return {};
    }
  }


  String? _taskId;
get taskId => _taskId;
setTaskId(value){
  _taskId=value;
  notifyListeners();
}

String _taskComment ='';
get taskComment => _taskComment;
setTaskComment(value){
  _taskComment=value;
  notifyListeners();
}



  //employee task status update
  Future<Map<String, dynamic>> getEmployeeTaskStatusUpdate(context) async {
    setIsLoading(true);
    await setUserPrimaryId();
    //await setEmployeePrimaryId();
    print('task id: $taskId');
    int? flag;
    try {
      print('userPrimaryId: $userPrimaryId');
      var parameter = {
        USERPRIMARYID1: userPrimaryId.toString(),
        TASKID: taskId.toString(),
        PROJECTSTATUS: projectCurrentStatus,
        TASKCOMMENT: taskComment
      };
      var result = await TaskRepository.EmployeeTaskUpdate(parameter: parameter);
      flag = result['flag'];
      String errorMsg=result['message'];


      if (flag==1) {
        //await setEmployeeTaskList(EmployeeTaskListModel.fromJson(result));
        await getEmployeeTaskDashboardData(context);
        setIsLoading(false);
        Navigator.pop(context);
        ToastMsg().showToast(Translation.of(context)!.translate('task_update_successfull')!, Colors.green);
        //var getdata = result['data'][0];
        //type=='logout'?Routes.navigateToMainDashBoardAgain(context):null;
        return result;
      } else {
        //await setEmployeeTaskList(EmployeeTaskListModel.fromJson(result));
        setIsLoading(false);
        ToastMsg().showToast(Translation.of(context)!.translate('task_update_error')!, Colors.red);
        return {};
      }
    } catch (e) {
      return {};
    }
  }


EmployeeProjectLabelsModel? _projectLabels;
EmployeeProjectLabelsModel? get projectLabels => _projectLabels;
setProjectLabels(value){
  _projectLabels = value;
  notifyListeners();
}

  //employee project label
  Future<Map<String, dynamic>> getEmployeeProjectLabel(context) async {
    setIsLoading(true);
    //await setUserPrimaryId();
    await setEmployeePrimaryId();
    int? flag;
    try {
      print(userPrimaryId);
      var parameter = {
        PROJECTID1 : projectId,
        EMPLOYEEPRIMARYID:employeePrimaryId
      };
      var result = await TaskRepository.EmployeeTaskLabel(parameter: parameter);
      flag = result['flag'];
      String errorMsg=result['message'];


      if (flag==1) {
        await setProjectLabels(EmployeeProjectLabelsModel.fromJson(result));
        setIsLoading(false);
        //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_successfull_msg':type=='logout'?'clockout_successfull_msg':'')!, Colors.green);
        //var getdata = result['data'][0];
        //type=='logout'?Routes.navigateToMainDashBoardAgain(context):null;
        return result;
      } else {
        await setProjectLabels(EmployeeProjectLabelsModel.fromJson(result));
        setIsLoading(false);
        //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_error_msg':type=='logout'?'clockout_error_msg':errorMsg)!, Colors.red);
        return {};
      }
    } catch (e) {
      return {};
    }
  }


  String? _projectCurrentStatus;
get projectCurrentStatus => _projectCurrentStatus;
setProjectCurrentStatus(value){
  _projectCurrentStatus =value;
  notifyListeners();
}



}
