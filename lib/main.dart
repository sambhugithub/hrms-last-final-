import 'dart:io';

import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/provider/announcement/announcement_provider.dart';
import 'package:hrms/provider/attendance/attendance_provider.dart';
import 'package:hrms/provider/auth/auth_provider.dart';
import 'package:hrms/provider/birthday_reminder/birthday_reminder_provider.dart';
import 'package:hrms/provider/holiday/holiday_provider.dart';
import 'package:hrms/provider/leave_application/leave_application_provider.dart';
import 'package:hrms/provider/organization_providers/attendance/organization_attendance_provider.dart';
import 'package:hrms/provider/organization_providers/employee/employee_provider.dart';
import 'package:hrms/provider/organization_providers/leave_approver/leave_approver_provider.dart';
import 'package:hrms/provider/organization_providers/organization_profile/organization_profile_provider.dart';
import 'package:hrms/provider/organization_providers/performance_management/performance_requestlist_provider.dart';
import 'package:hrms/provider/organization_providers/requirement/organization_requiretment_dashboard_provider.dart';
import 'package:hrms/provider/organization_providers/rota/rota_provider.dart';
import 'package:hrms/provider/organization_providers/task/organization_task_provider.dart';
import 'package:hrms/provider/payslip/payslip_provider.dart';
import 'package:hrms/provider/profile/profile_provider.dart';
import 'package:hrms/provider/task/task_provider.dart';
import 'package:hrms/provider/user_management/user_provider.dart';
import 'package:hrms/view/splashScreen/splash_screen.dart';
import 'package:hrms/view/widgets/meeting_events/secrates.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';

import 'localizations/app_localizations.dart';
import 'localizations/language_model.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:googleapis/calendar/v3.dart' as cal;
import 'package:googleapis_auth/auth_io.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp().then((value) => print('firebase initialized'));
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    await Hive.openBox('mama').then(
          (value) =>
          runApp(ScopedModel<LangModel>(
            model: LangModel(),
            child: const MyApp(),
          )),
    );
  }


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /*SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor:appcolor1,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark
    ));*/
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: appcolor1,statusBarIconBrightness: Brightness.light));
    return ScreenUtilInit(
      designSize: const Size(561, 1122),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child)  {
        return  MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context)=>AttendanceProvider()),
            ChangeNotifierProvider(create: (context)=>AuthProvider()),
            ChangeNotifierProvider(create: (context)=>LeaveApplicationProvider()),
            ChangeNotifierProvider(create: (context)=>HolidayProvider()),
            ChangeNotifierProvider(create: (context)=>PayslipProvider()),
            ChangeNotifierProvider(create: (context)=>ProfileProvider()),
            ChangeNotifierProvider(create: (context)=>BirthdayReminderProvider()),
            ChangeNotifierProvider(create: (context)=>AnnouncementProvider()),
            ChangeNotifierProvider(create: (context)=>TaskProvider()),
            ChangeNotifierProvider(create: (context)=>UserProvider()),
            ChangeNotifierProvider(create: (context)=>LeaveApproverProvider()),
            ChangeNotifierProvider(create: (context)=>OrganizationEmployeeProvider()),
            ChangeNotifierProvider(create: (context)=>RotaProvider()),
            ChangeNotifierProvider(create: (context)=>OrganizationAttendanceProvider()),
            ChangeNotifierProvider(create: (context)=>OrganizationRequiretmentDashboardProvider()),
            ChangeNotifierProvider(create: (context)=>OrganizationProfileProvider()),
            ChangeNotifierProvider(create: (context)=>PerformanceRequestListProvider()),
            ChangeNotifierProvider(create: (context)=>OrganizationTaskProvider()),
          ],
          child: ConnectivityAppWrapper(
            app: MaterialApp(
              locale: LangModel().appLocal,
              supportedLocales:LangModel().supportedLocales,
              localizationsDelegates: const [
                Translation.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                //FallbackCupertinoLocalisationsDelegate(),
              ],
              title: 'EIT AttTrack',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                radioTheme: RadioThemeData(
                  fillColor: MaterialStateColor.resolveWith((states) => appcolor1),
                )
              ),
              home: const SplashScreen(),
            ),
          ),
        );
      },
    );
  }
}
