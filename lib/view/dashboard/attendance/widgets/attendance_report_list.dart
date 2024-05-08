import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/localizations/app_localizations.dart';

import '../../../../model/employee/employee_attendance_report_model.dart';



class AttendanceReportList extends StatelessWidget {
  final List<Data> reportList;
   AttendanceReportList({
    required this.reportList,
    super.key});


  final List<Map<String,String>> listOfColumns=[];

    getReportList(){
      for(int i=0;i<reportList.length;i++){
        listOfColumns.add({
          'Date':'${reportList[i].date}',
          'Day':'${reportList[i].day}',
          'clockin':'${reportList[i].timeIn}',
          'clockout':'${reportList[i].timeOut}',
          'totalhour':'${reportList[i].dutyHours}'
        });
      }
    }

  @override
  Widget build(BuildContext context) {

    Color getGreyColor(Set<MaterialState> states) {
      return appscaffoldcolor1;
    }

    Color getWhiteColor(Set<MaterialState> states) {
      return Colors.white;
    }

    getReportList();

    /*final List<Map<String, String>> listOfColumns = [
      {"Date": "01-11-2023", "Day": "Mon", "clockin": "11:00 AM",  "clockout":"07:30 PM", "totalhour": "9 Hours"},
      {"Date": "01-11-2023", "Day": "Mon", "clockin": "11:00 AM",  "clockout":"07:30 PM", "totalhour": "9 Hours"},
      {"Date": "01-11-2023", "Day": "Mon", "clockin": "11:00 AM",  "clockout":"07:30 PM", "totalhour": "9 Hours"},
      {"Date": "01-11-2023", "Day": "Mon", "clockin": "11:00 AM",  "clockout":"07:30 PM", "totalhour": "9 Hours"},
      {"Date": "01-11-2023", "Day": "Mon", "clockin": "11:00 AM",  "clockout":"07:30 PM", "totalhour": "9 Hours"},
      {"Date": "01-11-2023", "Day": "Mon", "clockin": "11:00 AM",  "clockout":"07:30 PM", "totalhour": "9 Hours"},
      {"Date": "01-11-2023", "Day": "Mon", "clockin": "11:00 AM",  "clockout":"07:30 PM", "totalhour": "9 Hours"},
      {"Date": "01-11-2023", "Day": "Mon", "clockin": "11:00 AM",  "clockout":"07:30 PM", "totalhour": "9 Hours"},
      {"Date": "01-11-2023", "Day": "Mon", "clockin": "11:00 AM",  "clockout":"07:30 PM", "totalhour": "9 Hours"},
      {"Date": "01-11-2023", "Day": "Mon", "clockin": "11:00 AM",  "clockout":"07:30 PM", "totalhour": "9 Hours"},
      {"Date": "01-11-2023", "Day": "Mon", "clockin": "11:00 AM",  "clockout":"07:30 PM", "totalhour": "9 Hours"},
      {"Date": "01-11-2023", "Day": "Mon", "clockin": "11:00 AM",  "clockout":"07:30 PM", "totalhour": "9 Hours"},
      {"Date": "01-11-2023", "Day": "Mon", "clockin": "11:00 AM",  "clockout":"07:30 PM", "totalhour": "9 Hours"},
      {"Date": "01-11-2023", "Day": "Mon", "clockin": "11:00 AM",  "clockout":"07:30 PM", "totalhour": "9 Hours"},
    ];*/
    return Expanded(
      flex: 1,
      child: reportList.isEmpty?Center(child: Text(Translation.of(context)!.translate('no_employee_attendance_list')!),)
          :
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            //columnSpacing: 10,
            headingRowColor: MaterialStateColor.resolveWith((states) {return appcolor1.withOpacity(.8);},),
              headingTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 22.sp),
              columns: [
                DataColumn(label: Text(Translation.of(context)!.translate('date')!)),
                DataColumn(label: Text(Translation.of(context)!.translate('day')!)),
                DataColumn(label: Text(Translation.of(context)!.translate('clock_in')!)),
                DataColumn(label: Text(Translation.of(context)!.translate('clock_out')!)),
                DataColumn(label: Text(Translation.of(context)!.translate('total_hour')!)),
              ],
              rows:
              List.generate(listOfColumns.length, (index) {
                final item = listOfColumns[index];
                return DataRow(
                  color: index % 2 == 0
                      ? MaterialStateProperty.resolveWith(getGreyColor)
                      : MaterialStateProperty.resolveWith(getWhiteColor),
                  cells: [
                    DataCell(Text(item["Date"]!)), //Extracting from Map element the value
                    DataCell(Text(item["Day"]!)),
                    DataCell(Text(item["clockin"]!)),
                    DataCell(Text(item["clockout"]!)),
                    DataCell(Text(item["totalhour"]!)),
                  ],
                );
              }),
              /*listOfColumns // Loops through dataColumnText, each iteration assigning the value to element
                  .map(
                ((element) => DataRow(
                  color: element.length % 2 == 0
                      ? MaterialStateProperty.resolveWith(getGreyColor)
                      : MaterialStateProperty.resolveWith(getWhiteColor),
                  cells: <DataCell>[
                    DataCell(Text(element["Date"]!)), //Extracting from Map element the value
                    DataCell(Text(element["Day"]!)),
                    DataCell(Text(element["clockin"]!)),
                    DataCell(Text(element["clockout"]!)),
                    DataCell(Text(element["totalhour"]!)),
                  ],
                )),
              )
                  .toList(),*/
          ),
        ),
      ),
    );

      /*Expanded(
      flex: 1,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 70.h,
              width: 561.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Mon',style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.w400),),
                      Text('01-10-2023',style:TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w400))
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Clock In',style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.w400),),
                      Text('11:05 AM',style:TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w400))
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Clock Out',style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.w400),),
                      Text('07:30 PM',style:TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w400))
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Total ',style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.w400),),
                      Text('8 Hours',style:TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w400))
                    ],
                  ),

                 *//* //clockin container
                  Container(
                    height: 45.h,
                    width: 165.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: attendanceClockinContainerColor
                      )
                    ),
                    child: Center(
                      child: Text('${Translation.of(context)!.translate('clock_in')} 11:05 AM',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 17.sp),),
                    ),
                  ),

                  //clockout container
                  Container(
                    height: 45.h,
                    width: 165.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: attendanceClockoutContainerColor
                        )
                    ),
                    child: Center(
                      child: Text('${Translation.of(context)!.translate('clock_out')} 07:30 PM',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 17.sp),),
                    ),
                  ),

                  //visibility icon
                  Container(
                    height: 45.h,
                    width: 45.w,
                    decoration: const BoxDecoration(
                      color: appcolor2,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.visibility_outlined,color: Colors.white,size: 24.h,),
                      ),
                    ),
                  )*//*
                ],
              ),
            ),
          );
        },
      ),
    );*/
  }
}
