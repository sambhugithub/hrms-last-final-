import 'package:flutter/cupertino.dart';
import 'package:hrms/helper/prefkeys.dart';
import 'package:hrms/view/widgets/shared_preference.dart';

class UserProvider extends ChangeNotifier{



bool _isLoading=false;
get isLoading =>_isLoading;
setIsLoading(v){
  _isLoading=v;
  notifyListeners();
}


  bool? _employee=true;
  get employee =>_employee;
  setEmployee(v){
    _employee=v;
    notifyListeners();
  }


  checkUserType()async{
    setIsLoading(true);
    String userType=await SharedPreference().getStringValue(PrefKeys.USERTYPE);
    print('>>>>>>>>>>>>>>> userType:$userType');
    if(userType=='employee'){
      setEmployee(true);
    }
    else{
      setEmployee(false);
    }
    setIsLoading(false);
  }
}