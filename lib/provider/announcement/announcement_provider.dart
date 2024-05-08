import 'package:flutter/cupertino.dart';
import 'package:hrms/helper/string.dart';
import 'package:hrms/model/employee/announcement/employee_announcement_list_model.dart';
import 'package:hrms/repository/announcement/announcement_repository.dart';
import '../../helper/prefkeys.dart';
import '../../view/widgets/shared_preference.dart';

class AnnouncementProvider extends ChangeNotifier{


  bool _isLoading=false;
  bool get isLoading =>_isLoading;
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

  String? _organizationid;
  get organizationid => _organizationid;
  setOrganizationId()async{
    _organizationid=await SharedPreference().getStringValue(PrefKeys.ORGANIGATIONID);
    notifyListeners();
  }

  EmployeeAnnouncementListModel? _empAnnouncementList;
  EmployeeAnnouncementListModel? get empAnnouncementList =>_empAnnouncementList;
  setEmpAnnouncementList(value){
    _empAnnouncementList=value;
    notifyListeners();
  }

  // employee announcement list
  Future<Map<String, dynamic>> getEmployeeAnnouncementList(context) async {
    await setEmployeeId();
    await setOrganizationId();
    _isLoading=true;
    int? flag;
    try {
      var parameter = {
        EMPLOYEE_ID : employeeid,
        ORGANIZATION_ID: organizationid
      };
      var result = await AnnouncementRepository.EmployeeAnnouncementList(parameter: parameter);
      setIsLoading(false);

      if (flag==1) {
        setEmpAnnouncementList(EmployeeAnnouncementListModel.fromJson(result['response']));
        //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_successfull_msg':type=='logout'?'clockout_successfull_msg':'')!, Colors.green);
        //setClockinClockoutDetails(ClockInClockOutModel.fromJson(result['data']));
        //var getdata = result['data'][0];
        //type=='logout'?Routes.navigateToMainDashBoardAgain(context):null;
        return result;
      } else {
        setEmpAnnouncementList(EmployeeAnnouncementListModel.fromJson(result['response']));
        //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_error_msg':type=='logout'?'clockout_error_msg':errorMsg)!, Colors.red);
        return {};
      }
    } catch (e) {
      return {};
    }
  }

}