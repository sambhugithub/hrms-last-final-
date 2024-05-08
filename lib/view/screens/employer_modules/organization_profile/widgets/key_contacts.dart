import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../helper/color.dart';
import '../../../../../model/employer/organization_profile/organization_profile_model.dart';



class KeyContacts extends StatefulWidget {
  final List<EmployeeKeyLink> data;
  const KeyContacts({
    required this.data,
    super.key});

  @override
  State<KeyContacts> createState() => _KeyContactsState();
}

class _KeyContactsState extends State<KeyContacts> {

  List<EmployeeKeyLink> reportList=[];
  /*[
    {
      "name":"Sambhu Mandal",
      "designation":"Development",
      "phone_number":"+91 8217869531",
      "email_id":"sambhumandal348@gmail.com",
      "criminal":"Nope",
      "proof":"nope"
    },
    {
      "name":"Sambhu Mandal",
      "designation":"Development",
      "phone_number":"+91 8217869531",
      "email_id":"sambhumandal348@gmail.com",
      "criminal":"Nope",
      "proof":"nope"
    }
  ];*/

  final List<Map<String,String>> listOfColumns=[];

  getReportList(){
    reportList=widget.data;
    for(int i=0;i<reportList.length;i++){
      listOfColumns.add({
        'name':'${reportList[i].fName} ${reportList[i].lName}',
        'designation':'${reportList[i].desig}',
        'phone_number':'${reportList[i].keyPhone}',
        'email_id':'${reportList[i].email}',
        'criminal':'${reportList[i].licence}',
        'proof':'${reportList[i].proof}'
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
        title: Text('Key Contacts',style: TextStyle(fontSize: 20.sp),),
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
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Designation')),
                DataColumn(label: Text('Phone Number')),
                DataColumn(label: Text('Email ID')),
                DataColumn(label: Text('Do you have a Criminal Conviction/Bankruptcy')),
                DataColumn(label: Text('Proof of ID')),
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
                    DataCell(Text(item["designation"]!)),
                    DataCell(Text(item["phone_number"]!)),
                    DataCell(Text(item["email_id"]!)),
                    DataCell(Text(item["criminal"]!)),
                    DataCell(Text(item["proof"]!)),
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
