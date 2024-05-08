import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/provider/holiday/holiday_provider.dart';
import 'package:hrms/view/screens/employee_modules/holiday/widgets/holiday_calender_view.dart';
import 'package:hrms/view/screens/employee_modules/holiday/widgets/holiday_list_view.dart';
import 'package:provider/provider.dart';

import '../../../../helper/color.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/appbar_actions.dart';
import '../../../widgets/appdrawer.dart';
import '../../../widgets/asset_image_fetch.dart';
import '../../../widgets/drawer_widgets.dart';



class HolidayDashboard extends StatefulWidget {
  const HolidayDashboard({super.key});

  @override
  State<HolidayDashboard> createState() => _HolidayDashboardState();
}

class _HolidayDashboardState extends State<HolidayDashboard> {
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
          DrawerWidgets().drawerEmployeeHolidayListView(context,
                (){
              Navigator.pop(context);
              context.read<HolidayProvider>().setHolidayModuleWidget(const HolidayListView());
            },
          ),
          DrawerWidgets().drawerEmployeeHolidayCalenderView(context,
                  (){
                Navigator.pop(context);
                context.read<HolidayProvider>().setHolidayModuleWidget(const HolidayCalenderView());
              }
          )
        ],
      ),

      body:Consumer<HolidayProvider>(
        builder: (_,instant,child){
          return instant.holidayModuleWidge;
        },
      ),
    );
  }
}

