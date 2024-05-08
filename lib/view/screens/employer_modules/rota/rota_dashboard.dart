import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/provider/organization_providers/rota/rota_provider.dart';
import 'package:hrms/view/screens/employer_modules/rota/widgets/day_off.dart';
import 'package:hrms/view/screens/employer_modules/rota/widgets/grace_period_page.dart';
import 'package:hrms/view/screens/employer_modules/rota/widgets/late_policy.dart';
import 'package:hrms/view/screens/employer_modules/rota/widgets/shift_management.dart';
import 'package:hrms/view/widgets/loader.dart';
import 'package:provider/provider.dart';

import '../../../../helper/color.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/appbar_actions.dart';
import '../../../widgets/appdrawer.dart';
import '../../../widgets/asset_image_fetch.dart';
import '../../../widgets/drawer_widgets.dart';


class RotaDashboard extends StatefulWidget {
  const RotaDashboard({super.key});

  @override
  State<RotaDashboard> createState() => _RotaDashboardState();
}

class _RotaDashboardState extends State<RotaDashboard> {

  apiCall()async{
    await context.read<RotaProvider>().getOrganizationRotaData(context);
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
          DrawerWidgets().drawerOrganizationShiftManagement(context,
                (){
              Navigator.pop(context);
              context.read<RotaProvider>().setRotaDashBoardWidget(const ShiftManagementPage());
            },
          ),
          DrawerWidgets().drawerOrganizationLatePolicy(context,
                  (){
                Navigator.pop(context);
                context.read<RotaProvider>().setRotaDashBoardWidget(const LatePolicyPage());
              }
          ),

          DrawerWidgets().drawerOrganizationDayOff(context,
                  (){
                Navigator.pop(context);
                context.read<RotaProvider>().setRotaDashBoardWidget(const DayOff());
              }
          ),

          DrawerWidgets().drawerOrganizationGracePeriod(context,
                  (){
                Navigator.pop(context);
                context.read<RotaProvider>().setRotaDashBoardWidget(const GracePeriodPage());
              }
          ),

        ],
      ),

      body: Consumer<RotaProvider>(
        builder: (_,instant,child){
          return instant.isLoading?Loader(containerColor: appscaffoldcolor1,):instant.rotaDashBoardWidget;
        },
      ),

    );
  }
}
