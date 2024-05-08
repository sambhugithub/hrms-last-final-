import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OrganizationAttendanceReport extends StatefulWidget {
  const OrganizationAttendanceReport({super.key});

  @override
  State<OrganizationAttendanceReport> createState() => _OrganizationAttendanceReportState();
}

class _OrganizationAttendanceReportState extends State<OrganizationAttendanceReport> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total No. of Employee Present :',style: TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.w600),),
                Text('10',style: TextStyle(color: Colors.green,fontSize: 18.sp,fontWeight: FontWeight.w600),),
              ],
            ),
            SizedBox(height: 10.h,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total No. of Employee Absent :',style: TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.w600),),
                Text('0',style: TextStyle(color: Colors.red,fontSize: 18.sp,fontWeight: FontWeight.w600),),
              ],
            ),
            SizedBox(height: 10.h,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total No. of Employee On Leave :',style: TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.w600),),
                Text('1',style: TextStyle(color: Colors.grey,fontSize: 18.sp,fontWeight: FontWeight.w600),),
              ],
            )
          ],
        ),
      ),
    );
  }
}

