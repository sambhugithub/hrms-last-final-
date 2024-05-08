import 'package:flutter/cupertino.dart';
import 'package:hrms/model/employer/rota/organization_rota_model.dart';
import 'package:hrms/repository/organization_repositories/rota/organization_rota_repository.dart';
import 'package:hrms/view/screens/employer_modules/rota/widgets/shift_management.dart';

class RotaProvider extends ChangeNotifier{



  Widget _rotaDashBoardWidget = const ShiftManagementPage();
  Widget get rotaDashBoardWidget => _rotaDashBoardWidget;
  setRotaDashBoardWidget(value){
    _rotaDashBoardWidget=value;
    notifyListeners();
  }

  bool _isLoading=false;
  bool get isLoading=> _isLoading;
  setIsLoading(value){
    _isLoading=value;
    notifyListeners();
  }


  OrganizationRotaModel? _organizationRotaData;
  OrganizationRotaModel? get organizationRotaData =>_organizationRotaData;
  setOrganizationRotaData(value){
    _organizationRotaData=value;
    notifyListeners();
  }


  //GET organization rota data
  Future<Map<String, dynamic>>  getOrganizationRotaData(context) async {
    //await setEmployeeId();
    //await setOrganizationId();
    _isLoading=true;
    int? flag;
    try {
      /*var parameter = {
        EMPLOYEE_ID : employeeid,
        PROJECTSTATUS: projectStatus
      };*/
      var result = await OrganizationRotaRepository.OrganizationRota();
      setIsLoading(false);
      flag = result['flag'];
      String errorMsg=result['message'];


      if (flag==1) {
        await setOrganizationRotaData(OrganizationRotaModel.fromJson(result));
        //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_successfull_msg':type=='logout'?'clockout_successfull_msg':'')!, Colors.green);
        //var getdata = result['data'][0];
        //type=='logout'?Routes.navigateToMainDashBoardAgain(context):null;
        return result;
      } else {
        await setOrganizationRotaData(OrganizationRotaModel.fromJson(result));
        //ToastMsg().showToast(Translation.of(context)!.translate(type=='login'?'clockin_error_msg':type=='logout'?'clockout_error_msg':errorMsg)!, Colors.red);
        return {};
      }
    } catch (e) {
      return {};
    }
  }





  }