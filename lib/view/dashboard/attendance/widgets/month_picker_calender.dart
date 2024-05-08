import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/provider/attendance/attendance_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


class MonthPickerCalender extends StatelessWidget {
  const MonthPickerCalender({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AttendanceProvider>(
        builder: (_,AttendanceProviderInstance,child){
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black.withOpacity(.5),
        child: Center(
          child: Container(
            height: 600.h,
            width: 500.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color:Colors.white,
            ),
            child: SfDateRangePicker(
              onSelectionChanged: (v){
                print(v.value);
                context.read<AttendanceProvider>().setCurrentMonthYear(v.value);
                AttendanceProviderInstance.setShowCalender(!AttendanceProviderInstance.showCalender);
                AttendanceProviderInstance.getEmployeeAttendanceReport(context);
              },
              selectionMode: DateRangePickerSelectionMode.single,
              view: DateRangePickerView.year,
            ),
          ),
        ),
      );
    });
  }
}
