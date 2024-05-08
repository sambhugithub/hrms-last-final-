import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/provider/leave_application/leave_application_provider.dart';
import 'package:hrms/view/screens/employee_modules/leave_application/dashboard/widgets/leave_application_status.dart';
import 'package:hrms/view/screens/employee_modules/leave_application/dashboard/widgets/new_leave_application.dart';
import 'package:hrms/view/widgets/appdrawer.dart';
import 'package:hrms/view/widgets/drawer_widgets.dart';
import 'package:provider/provider.dart';
import '../../../../../helper/color.dart';
import '../../../../widgets/appbar.dart';
import '../../../../widgets/appbar_actions.dart';
import '../../../../widgets/asset_image_fetch.dart';



class LeaveApplicationDashBoard extends StatefulWidget {
  const LeaveApplicationDashBoard({super.key});

  @override
  State<LeaveApplicationDashBoard> createState() => _LeaveApplicationDashBoardState();
}

class _LeaveApplicationDashBoardState extends State<LeaveApplicationDashBoard> {
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
      drawer: AppDrawer(
        widgetList: [
          DrawerWidgets().drawerHeader(),
          DrawerWidgets().drawerEmployeeLeaveApplicationDashBoard(context,
              (){
                Navigator.pop(context);
                context.read<LeaveApplicationProvider>().setLeaveApplicationModuleWidget(const LeaveApplicationStatus());
              },
          ),
          DrawerWidgets().drawerEmployeeNewLeaveApplication(context,
              (){
                Navigator.pop(context);
                context.read<LeaveApplicationProvider>().setLeaveApplicationModuleWidget(const NewLeaveApplication());
              }
          )
        ],
      ),
      body: Consumer<LeaveApplicationProvider>(
        builder: (_,instant,child){
          return instant.leaveApplicationModuleWidge;
        },
      ),
    );
  }
}

