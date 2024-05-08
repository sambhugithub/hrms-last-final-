import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/model/employer/organization_profile/organization_profile_model.dart';


class EmployeesAccordingToRti extends StatefulWidget {
  final List<CompanyRti> data;
  const EmployeesAccordingToRti({
    required this.data,
    super.key});

  @override
  State<EmployeesAccordingToRti> createState() => _EmployeesAccordingToRtiState();
}

class _EmployeesAccordingToRtiState extends State<EmployeesAccordingToRti> {

   List<CompanyRti> reportList=[];
  /*[
    {
      "employee_name":"Sambhu Mandal",
      "department":"Development",
      "job_type":"Mobile Application Development",
      "job_title":"Flutter Developer",
      "immigration_status":"Nope"
    },
    {
      "employee_name":"Boton Roy",
      "department":"Development",
      "job_type":"WEB Development",
      "job_title":"Web Developer",
      "immigration_status":"Nope"
    }
  ];*/

  final List<Map<String,String>> listOfColumns=[];

  getReportList(){
    reportList=widget.data;
    for(int i=0;i<reportList.length;i++){
      listOfColumns.add({
        'name':'${reportList[i].name}',
        'department':'${reportList[i].department}',
        'job_type':'${reportList[i].jobType}',
        'job_title':'${reportList[i].designation}',
        'immigration_status':'${reportList[i].immigration}'
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
    return Scaffold(
      backgroundColor: appscaffoldcolor1,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('Employees According to RTI',style: TextStyle(fontSize: 20.sp),),
      ),
      body: Container(
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
                DataColumn(label: Text('Employee Name')),
                DataColumn(label: Text('Department')),
                DataColumn(label: Text('Job Type')),
                DataColumn(label: Text('Job Title')),
                DataColumn(label: Text('Immigration Status')),
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
                    DataCell(Text(item["department"]!)),
                    DataCell(Text(item["job_type"]!)),
                    DataCell(Text(item["job_title"]!)),
                    DataCell(Text(item["immigration_status"]!)),
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
      ),
    );
  }
}
