import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/provider/organization_providers/rota/rota_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../helper/color.dart';
import '../../../../../model/employer/rota/organization_rota_model.dart';


class DayOff extends StatefulWidget {
  const DayOff({super.key});

  @override
  State<DayOff> createState() => _DayOffState();
}

class _DayOffState extends State<DayOff> {

  List<EmployeeTypeOffDay> reportList=[];
  /*[
    {
      "department":"12345",
      "designation":"This is a Shift Description",
      "shift_name":"10:00",
      "sunday":"6:00",
      "monday":"1:00",
      "tuesday":"2:00",
      "wednesday":"",
      "thursday":"",
      "friday":"",
      "saturday":""
    },
    {
      "department":"12345",
      "designation":"This is a Shift Description",
      "shift_name":"10:00",
      "sunday":"6:00",
      "monday":"1:00",
      "tuesday":"2:00",
      "wednesday":"",
      "thursday":"",
      "friday":"",
      "saturday":""
    }
  ];*/

  final List<Map<String,dynamic>> listOfColumns=[];

  getReportList(){
    reportList=context.read<RotaProvider>().organizationRotaData!.data!.employeeTypeOffDay!;
    for(int i=0;i<reportList.length;i++){
      listOfColumns.add({
        'department':'${reportList[i].department}',
        'designation':'${reportList[i].designation}',
        'shift_name':'${reportList[i].shiftCode}',
        'sunday':reportList[i].sun=='1'?const Icon(Icons.close,color: Colors.red,):const Icon(Icons.done,color: Colors.green,),
        'monday':reportList[i].mon=='1'?const Icon(Icons.close,color: Colors.red,):const Icon(Icons.done,color: Colors.green,),
        'tuesday':reportList[i].tue=='1'?const Icon(Icons.close,color: Colors.red,):const Icon(Icons.done,color: Colors.green,),
        'wednesday':reportList[i].wed=='1'?const Icon(Icons.close,color: Colors.red,):const Icon(Icons.done,color: Colors.green,),
        'thursday':reportList[i].thu=='1'?const Icon(Icons.close,color: Colors.red,):const Icon(Icons.done,color: Colors.green,),
        'friday':reportList[i].fri=='1'?const Icon(Icons.close,color: Colors.red,):const Icon(Icons.done,color: Colors.green,),
        'saturday':reportList[i].sat=='1'?const Icon(Icons.close,color: Colors.red,):const Icon(Icons.done,color: Colors.green,),
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
      child: context.read<RotaProvider>().organizationRotaData!.data!.employeeTypeOffDay!.isEmpty?Center(
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
              DataColumn(label: Text('Sunday')),
              DataColumn(label: Text('Monday')),
              DataColumn(label: Text('Tuesday')),
              DataColumn(label: Text('Wednesday')),
              DataColumn(label: Text('Thursday')),
              DataColumn(label: Text('Friday')),
              DataColumn(label: Text('Saturday')),
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
                  DataCell(item["sunday"]!),
                  DataCell(item["monday"]!),
                  DataCell(item["tuesday"]!),
                  DataCell(item["wednesday"]!),
                  DataCell(item["thursday"]!),
                  DataCell(item["friday"]!),
                  DataCell(item["saturday"]!),
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
