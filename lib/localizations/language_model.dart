import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:scoped_model/scoped_model.dart';


class LangModel extends Model {
  static const Locale enLocale = Locale('en');
  static const Locale arLocale = Locale('fr');

  String? localeStr;

  Future<Locale?> appModel() {
    return handleLocale();
  }

  late Locale _appLocale = const Locale('en');

  Locale get appLocal {
    handleLocale();
    notifyListeners();
    return _appLocale;
  }

  List<Locale> get supportedLocales => [
    arLocale,
    enLocale,
  ];

  Future<Locale?> handleLocale() async {
    try {
      final pref = await Hive.openBox('patientapp');
      if (pref.get('locale') == 'fr') {
        AppLanguage.appLanguage = 'fr';
        return _appLocale = arLocale;
      } else {
        AppLanguage.appLanguage = 'en';
        return _appLocale = enLocale;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<String> localeString() async {
    final pref = await Hive.openBox('finfix');
    return pref.get('locale');
  }

  String getLocalStr() {
    print(appLocal);
    if (appLocal == arLocale) {
      return 'fr';
    } else {
      return 'en';
    }
  }

  void changeLanguage(String lang) {
    if (lang == 'fr') {
      _appLocale = arLocale;
      saveLocale('fr');
      AppLanguage.appLanguage = 'fr';
    } else {
      _appLocale = enLocale;
      saveLocale('en');
      AppLanguage.appLanguage = 'en';
    }
    notifyListeners();
  }

  Future<void> saveLocale(String loc) async {
    final pref = await Hive.openBox('patientapp');
    pref.put('locale', loc);
    AppLanguage.appLanguage = loc;
    return;
  }
}

class AppLanguage {
  static String appLanguage = '';
}