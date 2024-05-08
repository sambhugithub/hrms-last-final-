import 'package:flutter/material.dart';
import 'package:hrms/model/employer/employee/organization_employee_list_model.dart';
import 'package:hrms/repository/organization_repositories/employee/employee_repository.dart';

import '../../../helper/prefkeys.dart';
import '../../../helper/string.dart';
import '../../../view/widgets/shared_preference.dart';



class OrganizationEmployeeProvider extends ChangeNotifier{


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
  
  OrganizationEmployeeListModel? _organizationEmployeeListData;
  OrganizationEmployeeListModel? get organizationEmployeeListData =>_organizationEmployeeListData;
  setOrganizationEmployeeListData(value){
    _organizationEmployeeListData =value;
    notifyListeners();
  }



  //GET organization employee list
  Future<Map<String, dynamic>>  getOrganizationEmployeeList(context) async {
    await setEmployeeId();
    //await setOrganizationId();
    _isLoading=true;
    int? flag;
    try {
      var parameter = {
        ORGANIZATION_ID : employeeid,
      };
      var result = await EmployeeRepository.OrganizationEmployeeList(parameter: parameter);
      setIsLoading(false);
      flag = result['flag'];
      String errorMsg=result['message'];


      if (flag==1) {
        await setOrganizationEmployeeListData(OrganizationEmployeeListModel.fromJson(result));
        //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_successfull_msg':type=='logout'?'clockout_successfull_msg':'')!, Colors.green);
        //var getdata = result['data'][0];
        //type=='logout'?Routes.navigateToMainDashBoardAgain(context):null;
        return result;
      } else {
        await setOrganizationEmployeeListData(OrganizationEmployeeListModel.fromJson(result));
        //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_error_msg':type=='logout'?'clockout_error_msg':errorMsg)!, Colors.red);
        return {};
      }
    } catch (e) {
      return {};
    }
  }
}

