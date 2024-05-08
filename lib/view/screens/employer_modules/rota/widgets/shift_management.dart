import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/provider/organization_providers/rota/rota_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../helper/color.dart';
import '../../../../../model/employer/rota/organization_rota_model.dart';


class ShiftManagementPage extends StatefulWidget {
  const ShiftManagementPage({super.key});

  @override
  State<ShiftManagementPage> createState() => _ShiftManagementPageState();
}

class _ShiftManagementPageState extends State<ShiftManagementPage> {


  List<ShiftManagemant> reportList=[];
  /*[
    {
      "shift_code":"12345",
      "shift_desc":"This is a Shift Description",
      "work_in_time":"10:00",
      "work_out_time":"6:00",
      "break_time_from":"1:00",
      "break_time_to":"2:00"
    },
    {
      "shift_code":"12345",
      "shift_desc":"This is a Shift Description",
      "work_in_time":"10:00",
      "work_out_time":"6:00",
      "break_time_from":"1:00",
      "break_time_to":"2:00"
    }
  ];*/

  List listOfColumns=[];

  getReportList(){
    reportList=context.read<RotaProvider>().organizationRotaData!.data!.shiftManagemant!;
    for(int i=0;i<reportList.length;i++){
      listOfColumns.add({
        'shift_code':'${reportList[i].shiftCode}',
        'shift_desc':'${reportList[i].shiftDes}',
        'work_in_time':'${reportList[i].timeIn}',
        'work_out_time':'${reportList[i].timeOut}',
        'break_time_from':'${reportList[i].recTimeIn}',
        'break_time_to':'${reportList[i].recTimeOut}'
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
      child: context.read<RotaProvider>().organizationRotaData!.data!.shiftManagemant!.isEmpty?Center(
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
              DataColumn(label: Text('Shift Code')),
              DataColumn(label: Text('Shift Description')),
              DataColumn(label: Text('Work In Time')),
              DataColumn(label: Text('Work Out Time')),
              DataColumn(label: Text('Break Time From')),
              DataColumn(label: Text('Break Time To')),
            ],
            rows:
            List.generate(listOfColumns.length, (index) {
              final item = listOfColumns[index];
              return DataRow(
                color: index % 2 == 0
                    ? MaterialStateProperty.resolveWith(getGreyColor)
                    : MaterialStateProperty.resolveWith(getWhiteColor),
                cells: [
                  DataCell(Text(item["shift_code"]!)), //Extracting from Map element the value
                  DataCell(Text(item["shift_desc"]!)),
                  DataCell(Text(item["work_in_time"]!)),
                  DataCell(Text(item["work_out_time"]!)),
                  DataCell(Text(item["break_time_from"]!)),
                  DataCell(Text(item["break_time_to"]!)),
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

