import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/view/dashboard/payslip/payslip.dart';

import '../../../widgets/appbar.dart';
import '../../../widgets/appbar_actions.dart';
import '../../../widgets/appdrawer.dart';
import '../../../widgets/asset_image_fetch.dart';
import '../../../widgets/drawer_widgets.dart';



class PayslipDashboard extends StatefulWidget {
  const PayslipDashboard({super.key});

  @override
  State<PayslipDashboard> createState() => _PayslipDashboardState();
}

class _PayslipDashboardState extends State<PayslipDashboard> {
  @override
  Widget build(BuildContext context) {
    return const Payslip();
      /*Scaffold(
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
          *//*DrawerWidgets().drawerEmployeeLeaveApplicationDashBoard(context,
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
          )*//*
        ],
      ),
      body: const Payslip(),
    );*/
  }
}

