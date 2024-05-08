import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../helper/color.dart';
import '../../../../../../provider/attendance/attendance_provider.dart';
import '../../../../../dashboard/attendance/widgets/attendance_report_list.dart';
import '../../../../../dashboard/attendance/widgets/monthShowSection.dart';
import '../../../../../dashboard/attendance/widgets/month_picker_calender.dart';
import '../../../../../dashboard/attendance/widgets/monthly_report_box.dart';
import '../../../../../widgets/loader.dart';


class AttendanceReport extends StatelessWidget {
  const AttendanceReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AttendanceProvider>(
      builder: (_,attendanceProviderInstance,child){
        return ConnectivityWidgetWrapper(
          disableInteraction: true,
          child: attendanceProviderInstance.isLoading?Loader(containerColor: appscaffoldcolor1,):Stack(
            children: [
              Column(
                children: [
                  const MonthShowSection(),
                  MonthlyReportBox(
                    totoalWorkingDay: attendanceProviderInstance.employeeAttendanceReport!.report==null?'':attendanceProviderInstance.employeeAttendanceReport!.report!.totalWorkingDay.toString(),
                    fullDay: attendanceProviderInstance.employeeAttendanceReport!.report==null?'':attendanceProviderInstance.employeeAttendanceReport!.report!.fullDay.toString(),
                    halfDay: attendanceProviderInstance.employeeAttendanceReport!.report==null?'':attendanceProviderInstance.employeeAttendanceReport!.report!.halfDay.toString(),
                    absent: attendanceProviderInstance.employeeAttendanceReport!.report==null?'':attendanceProviderInstance.employeeAttendanceReport!.report!.absent.toString(),
                  ),
                  SizedBox(height: 10.h,),
                  AttendanceReportList(reportList: attendanceProviderInstance.employeeAttendanceReport!.data!,)
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
    );
  }
}
