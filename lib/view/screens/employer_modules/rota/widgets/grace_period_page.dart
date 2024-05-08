import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/model/employer/rota/organization_rota_model.dart';
import 'package:provider/provider.dart';

import '../../../../../helper/color.dart';
import '../../../../../provider/organization_providers/rota/rota_provider.dart';




class GracePeriodPage extends StatefulWidget {
  const GracePeriodPage({super.key});

  @override
  State<GracePeriodPage> createState() => _GracePeriodPageState();
}

class _GracePeriodPageState extends State<GracePeriodPage> {


  List<GracePeriod> reportList=[];
  /*[
    {
      "department":"12345",
      "designation":"This is a Shift Description",
      "shift_code":"10:00",
      "max_grace_period":"6:00",
      "no_of_days_allow":"1:00",
      "no_of_day_salary_deducted":"2:00"
    },
    {
      "department":"12345",
      "designation":"This is a Shift Description",
      "shift_code":"10:00",
      "max_grace_period":"6:00",
      "no_of_days_allow":"1:00",
      "no_of_day_salary_deducted":"2:00"
    }
  ];*/

  final List<Map<String,String>> listOfColumns=[];

  getReportList(){
    reportList=context.read<RotaProvider>().organizationRotaData!.data!.gracePeriod!;
    for(int i=0;i<reportList.length;i++){
      listOfColumns.add({
        'department':'${reportList[i].department}',
        'designation':'${reportList[i].designation}',
        'shift_name':'${reportList[i].shiftCode} (${reportList[i].shiftDes})',
        'work_in_time':'${reportList[i].timeIn}',
        'grace_period':'${reportList[i].graceTime}',
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
      child: context.read<RotaProvider>().organizationRotaData!.data!.latePolicy!.isEmpty?Center(
        child: Text('No Data'),
      ):SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            //columnSpacing: 10,
            headingRowColor: MaterialStateColor.resolveWith((states) {return appcolor1.withOpacity(.8);},),
            headingTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 22.sp),
            columns: [
              DataColumn(label: Text('Department')),
              DataColumn(label: Text('Designation')),
              DataColumn(label: Text('Shift Name')),
              DataColumn(label: Text('Work In Time')),
              DataColumn(label: Text('Grace Period')),
            ],
            rows:
            List.generate(listOfColumns.length, (index) {
              final item = listOfColumns[index];
              return DataRow(
                color: index % 2 == 0
                    ? MaterialStateProperty.resolveWith(getGreyColor)
                    : MaterialStateProperty.resolveWith(getWhiteColor),
                cells: [
                  DataCell(Text(item["department"]!)), //Extracting from Map element the value
                  DataCell(Text(item["designation"]!)),
                  DataCell(Text(item["shift_name"]!)),
                  DataCell(Text(item["work_in_time"]!)),
                  DataCell(Text(item["grace_period"]!)),
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
