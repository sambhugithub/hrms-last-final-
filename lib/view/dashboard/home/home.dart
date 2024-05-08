import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/localizations/app_localizations.dart';
import 'package:hrms/provider/attendance/attendance_provider.dart';
import 'package:hrms/provider/birthday_reminder/birthday_reminder_provider.dart';
import 'package:hrms/provider/user_management/user_provider.dart';
import 'package:hrms/view/dashboard/home/widgets/home_grid_section.dart';
import 'package:hrms/view/dashboard/home/widgets/home_profile_section.dart';
import 'package:hrms/view/widgets/appbar.dart';
import 'package:hrms/view/widgets/appbar_actions.dart';
import 'package:hrms/view/widgets/asset_image_fetch.dart';
import 'package:hrms/view/widgets/loader.dart';
import 'package:hrms/view/widgets/popups.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  getBirthdayPopup(){
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<BirthdayReminderProvider>().getBirthdayList(context);
      if(context.read<BirthdayReminderProvider>().birthdayList!.data!.isEmpty){

      }
      else{
        var data=context.read<BirthdayReminderProvider>().birthdayList!.data;
        for(int i=0;i<data!.length;i++){
          PopUps(context: context).birthdayPopup('${data[i].empFname![0].toUpperCase()+data[i].empFname!.substring(1).toLowerCase()} ${(data[i].empMname != null && data[i].empMname!.isNotEmpty) ? data[i].empMname![0].toUpperCase() + data[i].empMname!.substring(1).toLowerCase() : data[i].empMname} ${data[i].empLname![0].toUpperCase()+data[i].empLname!.substring(1).toLowerCase()}','${data[i].emPhone}','${data[i].profileimage}');
        }
      }

    });
  }


  @override
  void initState() {
    getBirthdayPopup();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print('????????????????????? ${context.read<UserProvider>().employee}');
    return Scaffold(
      backgroundColor: appscaffoldcolor1,
      appBar: AppBars(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image(image: AssetImage(const AssetImages(imgName: 'appbar_leading').getAssetImagePath()),fit: BoxFit.contain,),
        ),
        leadingWidth: MediaQuery.of(context).size.width*.35,
        actions: [
          AppbarActions().notification()
        ],
      ),
      body: ConnectivityWidgetWrapper(
        disableInteraction: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //profile section
            context.watch<UserProvider>().employee? const HomeProfileSection():Container(),
            SizedBox(height: 20.h,),
            HomeGridSection()
          ],
        )
      ),
    );
  }
}
