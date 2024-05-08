import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/view/screens/employee_modules/attendance/dashboard/widgets/Attendance_dashboard.dart';
import 'package:hrms/view/screens/employee_modules/attendance/dashboard/widgets/attendance_report.dart';
import 'package:hrms/view/widgets/appbar.dart';
import 'package:hrms/view/widgets/appdrawer.dart';
import 'package:hrms/view/widgets/drawer_widgets.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/attendance/attendance_provider.dart';
import '../../../../widgets/appbar_actions.dart';
import '../../../../widgets/asset_image_fetch.dart';


class Dashboard extends StatefulWidget {
  final Widget body;
  const Dashboard({
    required this.body,
    super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  apiCalls(){
    context.read<AttendanceProvider>().getEmployeeAttendanceReport(context);
  }
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      apiCalls();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appscaffoldcolor1,
      appBar: AppBars(
        centerTitle: false,
        autoImplyLeading: true,
        title:Image(image: AssetImage(const AssetImages(imgName: 'appbar_leading').getAssetImagePath()),fit: BoxFit.contain,height: 59.h,width: 217.w,),
        //leadingWidth: MediaQuery.of(context).size.width*.35,
        actions: [
          AppbarActions().notification()
        ],
      ),
      drawer: AppDrawer(widgetList: [
        DrawerWidgets().drawerHeader(),
        DrawerWidgets().drawerEmployeeAttendanceDashBoard(context,(){Navigator.pop(context);context.read<AttendanceProvider>().setEmployeeAttendanceDashboardWidget(const AttendanceDashboard());}),
        DrawerWidgets().drawerEmployeeAttendanceReport(context,(){Navigator.pop(context);context.read<AttendanceProvider>().setEmployeeAttendanceDashboardWidget(const AttendanceReport());})],
      ),
      body: Consumer<AttendanceProvider>(
        builder: (_,instant,child){
          return instant.employeeAttendanceDashboardWidget;
        },
      ),

    );
  }
}
