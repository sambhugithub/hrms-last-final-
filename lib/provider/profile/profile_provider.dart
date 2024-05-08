import 'package:flutter/cupertino.dart';
import 'package:hrms/view/screens/employee_modules/profile/widgets/personal_details.dart';

import '../../helper/prefkeys.dart';
import '../../view/widgets/shared_preference.dart';

class ProfileProvider extends ChangeNotifier{



  Widget _empProfileModuleWidget= const PersonalDetails();
  get empProfileModuleWidget => _empProfileModuleWidget;
  setEmpProfileModuleWidget(v){
    _empProfileModuleWidget=v;
    notifyListeners();
  }
//employee name
  String? _empName;
  get empName => _empName;
  setEmpName()async{
    _empName=await SharedPreference().getStringValue(PrefKeys.NAME);
    notifyListeners();
  }

//date of birth
  String? _dob;
  get dob => _dob;
  setDob()async{
    _dob=await SharedPreference().getStringValue(PrefKeys.DOB);
    notifyListeners();
  }

  //email
String? _email;
  get email => _email;
  setEmail()async{
    _email=await SharedPreference().getStringValue(PrefKeys.EMAIL);
    notifyListeners();
  }

  //phone
String? _phone;
  get phone =>_phone;
  setPhone()async{
    _phone=await SharedPreference().getStringValue(PrefKeys.PHONE);
    notifyListeners();
  }

  //emr phone
String? _emrPhone;
  get emrPhone =>_emrPhone;
  setEmrPhone()async{
    _emrPhone=await SharedPreference().getStringValue(PrefKeys.EMRGPHONE);
    notifyListeners();
  }

  //address
String? _address;
  get address => _address;
  setAddress()async{
    _address=await SharedPreference().getStringValue(PrefKeys.ADDRESS);
    notifyListeners();
  }

  //company
String? _compName;
  get compName => _compName;
  setCompName()async{
    _compName=await SharedPreference().getStringValue(PrefKeys.ORGANIGATIONNAME);
    notifyListeners();
  }

  //department
  String? _department;
  get department => _department;
  setDepartment()async{
    _department=await SharedPreference().getStringValue(PrefKeys.DEPARTMENT);
    notifyListeners();
  }

  //emp id
  String? _empId;
  get empId => _empId;
  setEmpId()async{
    _empId=await SharedPreference().getStringValue(PrefKeys.EMPLOYEEID);
    notifyListeners();
  }

  //designation
  String? _designation;
  get designation => _designation;
  setDesignation()async{
    _designation=await SharedPreference().getStringValue(PrefKeys.DESIGNATION);
    notifyListeners();
  }

  //emp type
  String? _empType;
  get empType => _empType;
  setEmpType()async{
    _empType=await SharedPreference().getStringValue(PrefKeys.EMPLOYEETYPE);
    notifyListeners();
  }

  //authority
  String? _authority;
  get authority => _authority;
  setAuthority()async{
    _authority=await SharedPreference().getStringValue(PrefKeys.REPORTAUTH);
    notifyListeners();
  }

  //bank details
  String? _bankDetails;
  get bankDetails => _bankDetails;
  setBankDetails()async{
    _bankDetails=await SharedPreference().getStringValue(PrefKeys.BANKDETAILS);
    notifyListeners();
  }

  //employee image
  String? _empImage;
  get empImage => _empImage;
  setEmpImage()async{
    _empImage=await SharedPreference().getStringValue(PrefKeys.EMPIMAGEURL);
    notifyListeners();
  }

}