import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/model/employee/employee_attendance_report_model.dart';
import 'package:hrms/provider/attendance/attendance_provider.dart';
import 'package:hrms/view/dashboard/attendance/widgets/attendance_report_list.dart';
import 'package:hrms/view/dashboard/attendance/widgets/monthShowSection.dart';
import 'package:hrms/view/dashboard/attendance/widgets/month_picker_calender.dart';
import 'package:hrms/view/dashboard/attendance/widgets/monthly_report_box.dart';
import 'package:hrms/view/widgets/appbar.dart';
import 'package:hrms/view/widgets/loader.dart';
import 'package:provider/provider.dart';

import '../../widgets/appbar_actions.dart';
import '../../widgets/asset_image_fetch.dart';



class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {

  getEmployeeAttendanceReport(){
    context.read<AttendanceProvider>().getEmployeeAttendanceReport(context);
  }

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      getEmployeeAttendanceReport();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appscaffoldcolor1,
      appBar: AppBars(
        leading:Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image(image: AssetImage(const AssetImages(imgName: 'appbar_leading').getAssetImagePath()),fit: BoxFit.contain,),
        ),
        leadingWidth: MediaQuery.of(context).size.width*.35,
        actions: [
          AppbarActions().notification()
        ],
      ),
      body: Consumer<AttendanceProvider>(
        builder: (_,attendanceProviderInstance,child){
          return ConnectivityWidgetWrapper(
            disableInteraction: true,
            child: attendanceProviderInstance.isLoading?Loader(containerColor: appscaffoldcolor1,):Stack(
              children: [
                Column(
                  children: [
                    const MonthShowSection(),
                     MonthlyReportBox(
                       totoalWorkingDay: attendanceProviderInstance.employeeAttendanceReport?.report==null?'':attendanceProviderInstance.employeeAttendanceReport!.report!.totalWorkingDay.toString(),
                       fullDay: attendanceProviderInstance.employeeAttendanceReport?.report==null?'':attendanceProviderInstance.employeeAttendanceReport!.report!.fullDay.toString(),
                       halfDay: attendanceProviderInstance.employeeAttendanceReport?.report==null?'':attendanceProviderInstance.employeeAttendanceReport!.report!.halfDay.toString(),
                       absent: attendanceProviderInstance.employeeAttendanceReport?.report==null?'':attendanceProviderInstance.employeeAttendanceReport!.report!.absent.toString(),
                     ),
                    SizedBox(height: 10.h,),
                    AttendanceReportList(reportList: attendanceProviderInstance.employeeAttendanceReport==null?[]:attendanceProviderInstance.employeeAttendanceReport!.data!,)
                  ],
                ),
                Center(
                  child: attendanceProviderInstance.showCalender?
                  const MonthPickerCalender()
                      :Container(),
                )
              ],
            ),
          );
            /*SingleChildScrollView(
            child: Column(
              children: [
                const MonthShowSection(month: 'OCTOBER 2023',),
                attendanceProviderInstance.showCalender? CalenderShow().getDate():Container()
              ],
            ),
          );*/
        },
      ),



    );
  }
}
