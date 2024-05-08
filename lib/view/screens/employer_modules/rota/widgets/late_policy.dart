import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/model/employer/rota/organization_rota_model.dart';
import 'package:provider/provider.dart';

import '../../../../../helper/color.dart';
import '../../../../../provider/organization_providers/rota/rota_provider.dart';


class LatePolicyPage extends StatefulWidget {
  const LatePolicyPage({super.key});

  @override
  State<LatePolicyPage> createState() => _LatePolicyPageState();
}

class _LatePolicyPageState extends State<LatePolicyPage> {

  List<LatePolicy> reportList=[];
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
    reportList=context.read<RotaProvider>().organizationRotaData!.data!.latePolicy!;
    for(int i=0;i<reportList.length;i++){
      listOfColumns.add({
        'department':'${reportList[i].department}',
        'designation':'${reportList[i].designation}',
        'shift_code':'${reportList[i].shiftCode} ${reportList[i].shiftDes}',
        'max_grace_period':'${reportList[i].maxGrace} min',
        'no_of_days_allow':'${reportList[i].noAllow}',
        'no_of_day_salary_deducted':'${reportList[i].noDayRed}'
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
              DataColumn(label: Text('Shift Code')),
              DataColumn(label: Text('Max Grace Period')),
              DataColumn(label: Text('No. of Days Allow')),
              DataColumn(label: Text('No. of Day Salary Deducted')),
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
                  DataCell(Text(item["shift_code"]!)),
                  DataCell(Text(item["max_grace_period"]!)),
                  DataCell(Text(item["no_of_days_allow"]!)),
                  DataCell(Text(item["no_of_day_salary_deducted"]!)),
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
