import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/model/employer/attendance/organization_attendance_list_model.dart';
import 'package:hrms/provider/organization_providers/attendance/organization_attendance_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../helper/color.dart';



class OrganizationAttendanceList extends StatefulWidget {
  final List<Data> reportList;
  const OrganizationAttendanceList({
    required this.reportList,
    super.key});

  @override
  State<OrganizationAttendanceList> createState() => _OrganizationAttendanceListState();
}

class _OrganizationAttendanceListState extends State<OrganizationAttendanceList> {
  //final List<Data>? reportList=context.read<OrganizationAttendanceProvider>().organizationAttendanceListData.data;
  /*[
    {
      "name":"Sambhu Mandal",
      "day":"Monday",
      "date":"27-03-2024",
      "time_in":"10:10 am",
      "time_out":"07:30 pm",
      "time_in_location":"kolkata",
      "time_out_location":"kolkata",
      "duration":"9 hours",
      "work_report":"hrms organization module"
    },
    {
      "name":"Boton Roy",
      "day":"Monday",
      "date":"27-03-2024",
      "time_in":"10:10 am",
      "time_out":"07:30 pm",
      "time_in_location":"kolkata",
      "time_out_location":"kolkata",
      "duration":"9 hours",
      "work_report":"web development"}
  ];*/


  final List<Map<String,String>> listOfColumns=[];

  getReportList(){
    for(int i=0;i<widget.reportList.length;i++){
      listOfColumns.add({
        'name':'${widget.reportList[i].employeeName}',
        'Day':'${widget.reportList[i].day}',
        'date':'${widget.reportList[i].date}',
        'time_in':'${widget.reportList[i].timeIn}',
        'time_out':'${widget.reportList[i].timeOut}',
        'time_in_location':'${widget.reportList[i].timeInLocation}',
        'time_out_location':'${widget.reportList[i].timeOutLocation}',
        'duration':'${widget.reportList[i].dutyHours}',
        'work_report':'${widget.reportList[i].workReport}',
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          //columnSpacing: 10,
          headingRowColor: MaterialStateColor.resolveWith((states) {return appcolor1.withOpacity(.8);},),
          headingTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 22.sp),
          columns: [
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Day')),
            DataColumn(label: Text('Date')),
            DataColumn(label: Text('Time In')),
            DataColumn(label: Text('Time Out')),
            DataColumn(label: Text('Time In Location')),
            DataColumn(label: Text('Time Out Location')),
            DataColumn(label: Text('Duration')),
            DataColumn(label: Text('Work Report')),
          ],
          rows:
          List.generate(listOfColumns.length, (index) {
            final item = listOfColumns[index];
            return DataRow(
              color: index % 2 == 0
                  ? MaterialStateProperty.resolveWith(getGreyColor)
                  : MaterialStateProperty.resolveWith(getWhiteColor),
              cells: [
                DataCell(Text(item["name"]!)), //Extracting from Map element the value
                DataCell(Text(item["Day"]!)),
                DataCell(Text(item["date"]!)),
                DataCell(Text(item["time_in"]!)),
                DataCell(Text(item["time_out"]!)),
                DataCell(Text(item["time_in_location"]!)),
                DataCell(Text(item["time_out_location"]!)),
                DataCell(Text(item["duration"]!)),
                DataCell(Text(item["work_report"]!)),
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
    );
  }
}
