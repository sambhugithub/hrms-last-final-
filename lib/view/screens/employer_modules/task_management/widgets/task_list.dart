import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../helper/color.dart';
import '../../../../../model/employer/task/organization_task_model.dart';
import '../../../../widgets/appbar.dart';
import '../../../../widgets/appbar_actions.dart';
import '../../../../widgets/asset_image_fetch.dart';


class OrganizationTaskiList extends StatefulWidget {
  final List<TaskList> taskData;
  const OrganizationTaskiList({
    required this.taskData,
    super.key});

  @override
  State<OrganizationTaskiList> createState() => _OrganizationTaskiListState();
}

class _OrganizationTaskiListState extends State<OrganizationTaskiList> {

  List<TaskList> reportList=[];
  /*[
    {
      "task":"task1",
      "assign_to":"Sambhu Mandal",
      "description":"This is a Description",
      "start_date":"01/04/24",
      "due_date":"20/04/24",
      "status":"N/A"
    },
    {
      "task":"task1",
      "assign_to":"Sambhu Mandal",
      "description":"This is a Description",
      "start_date":"01/04/24",
      "due_date":"20/04/24",
      "status":"N/A"
    }
  ];*/

  final List<Map<String,String>> listOfColumns=[];

  getReportList(){
    reportList=widget.taskData;
    for(int i=0;i<reportList.length;i++){
      listOfColumns.add({
        'task':'${reportList[i].taskName}',
        'assign_to':'${reportList[i].fname} ${reportList[i].mname} ${reportList[i].lname}',
        'description':'${reportList[i].taskDesc}',
        'start_date':'${reportList[i].startDate}',
        'due_date':'${reportList[i].expectedEndDate}',
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
    return Scaffold(
      backgroundColor: appscaffoldcolor1,
      appBar: AppBars(
        appbarColor: Colors.white,
        centerTitle: false,
        autoImplyLeading: true,
        title:Image(image: AssetImage(const AssetImages(imgName: 'appbar_leading').getAssetImagePath()),fit: BoxFit.contain,height: 59.h,width: 217.w,),
        //leadingWidth: MediaQuery.of(context).size.width*.35,
        actions: [
          AppbarActions().notification()
        ],
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: widget.taskData.isEmpty?Center(
          child: Text('No Task'),
        ):SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: DataTable(
              //columnSpacing: 10,
              headingRowColor: MaterialStateColor.resolveWith((states) {return appcolor1.withOpacity(.8);},),
              headingTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 22.sp),
              columns: [
                DataColumn(label: Text('Tasks')),
                DataColumn(label: Text('Assign To')),
                DataColumn(label: Text('Description')),
                DataColumn(label: Text('Start Date')),
                DataColumn(label: Text('Due Date')),
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
                    DataCell(Text(item["task"]!)), //Extracting from Map element the value
                    DataCell(Text(item["assign_to"]!)),
                    DataCell(Text(item["description"]!)),
                    DataCell(Text(item["start_date"]!)),
                    DataCell(Text(item["due_date"]!)),
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
      ),
    );
  }
}
