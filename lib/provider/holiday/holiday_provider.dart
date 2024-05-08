import 'package:flutter/cupertino.dart';
import 'package:hrms/model/employee/holiday/holiday_model.dart';
import 'package:hrms/repository/holiday/holiday_repository.dart';
import 'package:intl/intl.dart';

import '../../helper/prefkeys.dart';
import '../../helper/string.dart';
import '../../view/screens/employee_modules/holiday/widgets/holiday_list_view.dart';
import '../../view/widgets/shared_preference.dart';

class HolidayProvider extends ChangeNotifier{



  Widget _holidayModuleWidget =const HolidayListView();
  get holidayModuleWidge => _holidayModuleWidget;

  setHolidayModuleWidget(value){
    _holidayModuleWidget=value;
    notifyListeners();
  }

  //selected month year
  String _correntMonthYear= DateFormat('MMMM - yyyy').format(DateTime.now());
  get currentMonthYear => _correntMonthYear;

  setCurrentMonthYear(DateTime curentDateTime){
    _correntMonthYear= DateFormat('MMMM - yyyy').format(curentDateTime);
    print(_correntMonthYear);
    notifyListeners();
  }

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

  EmployeeHolidayModel? _holidayList;
  EmployeeHolidayModel? get holidayList => _holidayList;
  setHolidayList(v){
    _holidayList=v;
    notifyListeners();
  }


  //GET employee holiday list
  Future<Map<String, dynamic>> getEmployeeHolidayList(context) async {
    await setEmployeeId();
    await setOrganizationId();
    _isLoading=true;
    int? flag;
    try {
      var parameter = {
        EMPLOYEE_ID : employeeid,
        ORGANIZATION_ID: organizationid
      };
      var result = await HolidayRepository.EmployeeHolidayList(parameter: parameter);
      setIsLoading(false);
      flag = result['flag'];
      String errorMsg=result['message'];


      if (flag==1) {
        await setHolidayList(EmployeeHolidayModel.fromJson(result['response']));
        //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_successfull_msg':type=='logout'?'clockout_successfull_msg':'')!, Colors.green);
        //var getdata = result['data'][0];
        //type=='logout'?Routes.navigateToMainDashBoardAgain(context):null;
        return result;
      } else {
        await setHolidayList(EmployeeHolidayModel.fromJson(result['response']));
        //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_error_msg':type=='logout'?'clockout_error_msg':errorMsg)!, Colors.red);
        return {};
      }
    } catch (e) {
      return {};
    }
  }


}