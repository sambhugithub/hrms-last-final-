import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../helper/color.dart';
import '../../../../../model/employer/performance_management/organization_performance_request_list_model.dart';


class PerformanceRequestList extends StatefulWidget {
  final List<Performances> data;
  const PerformanceRequestList({
    required this.data,
    super.key});

  @override
  State<PerformanceRequestList> createState() => _PerformanceRequestListState();
}

class _PerformanceRequestListState extends State<PerformanceRequestList> {

   List<Performances> reportList=[];
  /*[
    {
      "employee":"sambhu mandal",
      "reporting_auth":"chandana bhowmic",
      "department":"development",
      "start":"01/04/24",
      "end":"20/04/24",
      "rating":"10",
      "status":"N/A"
    },
    {
      "employee":"sambhu mandal",
      "reporting_auth":"chandana bhowmic",
      "department":"development",
      "start":"01/04/24",
      "end":"20/04/24",
      "rating":"10",
      "status":"N/A"
    }
  ];*/

  final List<Map<String,String>> listOfColumns=[];

  getReportList(){
    reportList =widget.data;
    for(int i=0;i<reportList.length;i++){
      listOfColumns.add({
        'employee':'${reportList[i].empFname} ${reportList[i].empMname} ${reportList[i].empLname}',
        'reporting_auth':'${reportList[i].empReportingAuth}',
        'department':'${reportList[i].empDepartment}',
        'start':'${reportList[i].apprisalPeriodStart}',
        'end':'${reportList[i].apprisalPeriodEnd}',
        'rating':'${reportList[i].rating}',
        'status':'${reportList[i].status}'
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
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            //columnSpacing: 10,
            headingRowColor: MaterialStateColor.resolveWith((states) {return appcolor1.withOpacity(.8);},),
            headingTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 22.sp),
            columns: [
              DataColumn(label: Text('Employee')),
              DataColumn(label: Text('Reporting Auth')),
              DataColumn(label: Text('Department')),
              DataColumn(label: Text('Apprisal Period Start')),
              DataColumn(label: Text('Apprisal Period End')),
              DataColumn(label: Text('Rating')),
              DataColumn(label: Text('Status')),
            ],
            rows:
            List.generate(listOfColumns.length, (index) {
              final item = listOfColumns[index];
              return DataRow(
                color: index % 2 == 0
                    ? MaterialStateProperty.resolveWith(getGreyColor)
                    : MaterialStateProperty.resolveWith(getWhiteColor),
                cells: [
                  DataCell(Text(item["employee"]!)), //Extracting from Map element the value
                  DataCell(Text(item["reporting_auth"]!)),
                  DataCell(Text(item["department"]!)),
                  DataCell(Text(item["start"]!)),
                  DataCell(Text(item["end"]!)),
                  DataCell(Text(item["rating"]!)),
                  DataCell(Text(item["status"]!)),
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
  }
}
