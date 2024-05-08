import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/provider/attendance/attendance_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


class MonthShowSection extends StatelessWidget {
  const MonthShowSection({
    super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AttendanceProvider>(
        builder: (_,AttendanceProviderInstance,child){
          return Container(
            height: 66.h,
            width: 561.w,
            decoration:  BoxDecoration(
                color: homeProfileContainerColor,
              //borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.r),bottomLeft: Radius.circular(10.r))
            ),
            child: Stack( alignment: AlignmentDirectional.centerEnd,
              children: [
                Positioned(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                        onPressed: (){
                          context.read<AttendanceProvider>().setShowCalender(!context.read<AttendanceProvider>().showCalender);
                        },
                        icon: const Icon(Icons.calendar_today_outlined,color: appcolor1,),
                      ),
                    )),
                Center(
                  child: Text(
                    AttendanceProviderInstance.currentMonthYear,
                    style: TextStyle(color: appcolor2,fontSize: 24.sp,fontWeight: FontWeight.w500),
                  ),
                ),

              ],
            ),
          );
        });
  }
}


