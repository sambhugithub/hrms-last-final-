import 'package:flutter/cupertino.dart';
import 'package:hrms/model/employee/birthday_reminder/birthday_reminder_model.dart';
import 'package:hrms/repository/birthday_reminder/birthday_reminder_repository.dart';

import '../../helper/prefkeys.dart';
import '../../helper/string.dart';
import '../../view/widgets/shared_preference.dart';

class BirthdayReminderProvider extends ChangeNotifier{

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

  BirthdayReminderModel? _birthdayList;
  BirthdayReminderModel? get birthdayList => _birthdayList;
  setBirthdayList(v){
    _birthdayList=v;
    notifyListeners();
  }


  //get birthday list
  //GET employee holiday list
  Future<Map<String, dynamic>> getBirthdayList(context) async {
    await setEmployeeId();
    await setOrganizationId();
    _isLoading=true;
    int? flag;
    try {
      var parameter = {
        EMPLOYEE_ID : employeeid,
        ORGANIZATION_ID: organizationid
      };
      var result = await BirthdayReminderRepository.BirthdayReminderList(parameter: parameter);
      setIsLoading(false);
      flag = result['flag'];
      String errorMsg=result['message'];


      if (flag==1) {
        await setBirthdayList(BirthdayReminderModel.fromJson(result['response']));
        //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_successfull_msg':type=='logout'?'clockout_successfull_msg':'')!, Colors.green);
        //var getdata = result['data'][0];
        //type=='logout'?Routes.navigateToMainDashBoardAgain(context):null;
        return result;
      } else {
        await setBirthdayList(BirthdayReminderModel.fromJson(result['response']));
        //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_error_msg':type=='logout'?'clockout_error_msg':errorMsg)!, Colors.red);
        return {};
      }
    } catch (e) {
      return {};
    }
  }

}