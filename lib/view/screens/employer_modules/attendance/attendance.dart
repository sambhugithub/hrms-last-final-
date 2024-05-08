import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/localizations/app_localizations.dart';
import 'package:hrms/provider/organization_providers/attendance/organization_attendance_provider.dart';
import 'package:hrms/view/screens/employee_modules/attendance/dashboard/widgets/attendance_report.dart';
import 'package:hrms/view/screens/employer_modules/attendance/widgets/attendance_list.dart';
import 'package:hrms/view/screens/employer_modules/attendance/widgets/attendance_report.dart';
import 'package:hrms/view/widgets/loader.dart';
import 'package:provider/provider.dart';

import '../../../widgets/appbar.dart';
import '../../../widgets/appbar_actions.dart';
import '../../../widgets/asset_image_fetch.dart';



class OrganizationAttendance extends StatefulWidget {
  const OrganizationAttendance({super.key});

  @override
  State<OrganizationAttendance> createState() => _OrganizationAttendanceState();
}

class _OrganizationAttendanceState extends State<OrganizationAttendance> {

  apiCall()async{
    context.read<OrganizationAttendanceProvider>().getOrganizationAttendanceList(context);
  }



  @override
  void initState() {
    apiCall();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

      body: Consumer<OrganizationAttendanceProvider>(
        builder: (_,instance,child){
          return instance.isLoading?Loader(containerColor: appscaffoldcolor1,):instance.organizationAttendanceListData!.data!.isEmpty?Container(
            child: Center(
              child: Center(
                child: Text(Translation.of(context)!.translate('no_data').toString()),
              ),
            ),
          )
              :SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const OrganizationAttendanceReport(),
                OrganizationAttendanceList(reportList: instance.organizationAttendanceListData!.data!,)
              ],
            ),
          );
        },
      )
    );
  }
}
