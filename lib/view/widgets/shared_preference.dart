import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference{

  sharedPreferenceInitialization()async{
    SharedPreferences sharedPreference;
    sharedPreference=await SharedPreferences.getInstance();
    return sharedPreference;
  }

  getStringValue(value)async{
    SharedPreferences sp=await sharedPreferenceInitialization();
    String? str=sp.getString(value);
    return str;
  }

  getIntValue(value)async{
    SharedPreferences sp=await sharedPreferenceInitialization();
    int? num=sp.getInt(value);
    return num;
  }

  getBoolValue(value)async{
    SharedPreferences sp=await sharedPreferenceInitialization();
    bool? val=sp.getBool(value);
    return val;
  }

  getDoubleValue(value)async{
    SharedPreferences sp=await sharedPreferenceInitialization();
    double? val=sp.getDouble(value);
    return val;
  }

  setStringValue(key,value)async{
    SharedPreferences sp=await sharedPreferenceInitialization();
    sp.setString(key, value);
  }

  setDoubleValue(key,value)async{
    SharedPreferences sp=await sharedPreferenceInitialization();
    sp.setDouble(key, value);
  }

  setBoolvalue(key,value)async{
    SharedPreferences sp=await sharedPreferenceInitialization();
    sp.setBool(key, value);
  }

  setIntValue(key,value)async{
    SharedPreferences sp=await sharedPreferenceInitialization();
    sp.setInt(key, value);
  }



  clearPreferences()async{
    SharedPreferences sp=await sharedPreferenceInitialization();
    sp.clear();
  }


}