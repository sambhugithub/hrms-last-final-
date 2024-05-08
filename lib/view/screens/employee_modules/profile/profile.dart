import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/provider/auth/auth_provider.dart';

import 'package:hrms/provider/profile/profile_provider.dart';
import 'package:hrms/view/screens/employee_modules/profile/widgets/personal_details.dart';
import 'package:hrms/view/screens/employee_modules/profile/widgets/profesional_details.dart';
import 'package:provider/provider.dart';

import '../../../../helper/color.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/appbar_actions.dart';
import '../../../widgets/appdrawer.dart';
import '../../../widgets/asset_image_fetch.dart';
import '../../../widgets/drawer_widgets.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
          DrawerWidgets().drawerEmployeePersonalProfileDetails(context,
                (){
              Navigator.pop(context);
              context.read<ProfileProvider>().setEmpProfileModuleWidget(const PersonalDetails());
            },
          ),
          DrawerWidgets().drawerEmployeeProfesionalProfileDetails(context,
                  (){
                Navigator.pop(context);
                context.read<ProfileProvider>().setEmpProfileModuleWidget(const ProfesionalDetails());
              }

          ),

          DrawerWidgets().drawerEmployeeLogOut(context,
                  (){
                Navigator.pop(context);
                context.read<AuthProvider>().userLogOut(context);
              }
          )
        ],
      ),

      body: Consumer<ProfileProvider>(
        builder: (_,instant,child){
          return instant.empProfileModuleWidget;
        },
      ),
    );
  }
}
