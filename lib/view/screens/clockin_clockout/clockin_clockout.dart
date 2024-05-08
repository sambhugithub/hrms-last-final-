import 'dart:async';

import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/helper/googleMap_plusCode_to_address.dart';
import 'package:hrms/helper/routes.dart';
import 'package:hrms/localizations/app_localizations.dart';
import 'package:hrms/model/employee/clockin_clockout_model.dart';
import 'package:hrms/provider/attendance/attendance_provider.dart';
import 'package:hrms/view/screens/clockin_clockout/widgets/clockin_clockout_button.dart';
import 'package:hrms/view/widgets/asset_image_fetch.dart';
import 'package:hrms/view/widgets/current_location.dart';
import 'package:hrms/view/widgets/loader.dart';
import 'package:hrms/view/widgets/popups.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../widgets/toast_msg.dart';


class ClockinClockout extends StatefulWidget {
  const ClockinClockout({super.key});

  @override
  State<ClockinClockout> createState() => _ClockinClockoutState();
}

class _ClockinClockoutState extends State<ClockinClockout> {
  bool isLogin=false;
  bool isLogout= true;
  String? loginTime;

  Widget getLogo(){
    return SizedBox(
      height: 100.h,
      width: 250.w,
      child: Image(
        image: AssetImage(const AssetImages(imgName: 'appbar_leading').getAssetImagePath()),
      ),
    );
  }

  Widget getText(){
    return Text("ATTENDANCE",style: TextStyle(color: Colors.white,fontSize: 30.sp),);
  }

  String time=DateFormat.Hm().format(DateTime.now());

  getCurrenttime(){
    Timer.periodic(Duration(seconds: 1), (v) {
      String tdata = DateFormat.Hms().format(DateTime.now());
      if(mounted){
        setState(() {
          time=tdata;
        });
      }
    });
    return Text(time!,style: TextStyle(color: Colors.white,fontSize: 40.sp,fontWeight: FontWeight.bold),);
  }

  getDay(){
    String cdate1 = DateFormat("EEEEE").format(DateTime.now());
    return Text(cdate1,style: const TextStyle(color: Colors.white),);
  }

  getDate(){
    String cdate2 = DateFormat("MMMM, dd, yyyy").format(DateTime.now());
    return Text(cdate2,style: TextStyle(color: Colors.white,fontSize: 25.h),);
  }

  getImage(){
    return SizedBox(
      height: 521.h,
      width: 385.w,
      child: Image(
        image: AssetImage(AssetImages(imgName: 'splash_img').getAssetImagePath()),
        fit: BoxFit.contain,
      ),
    );
  }

  todayLoginOrNot()async{
    await context.read<AttendanceProvider>().clockInClockOut(context);
  }

  @override
  void initState() {
    todayLoginOrNot();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          backgroundColor: appcolor1,
          elevation: 0,
          toolbarHeight: 0,
        ),
      backgroundColor: appscaffoldcolor1,
      body: Consumer<AttendanceProvider>(
        builder: (_,AttendanceProviderInstance,child){
          return SafeArea(
              child: ConnectivityWidgetWrapper(
                disableInteraction: true,
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: clockinClockoutPageColor
                          )
                      ),
                      child: Align(
                        child: SingleChildScrollView(
                          child: Stack(

                            alignment: AlignmentDirectional.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //logo
                                  getLogo(),
                                  SizedBox(height: 10.h,),
                                  //getText(),
                                  //SizedBox(height: 20.h,),
                                  getCurrenttime(),
                                  getDay(),
                                  SizedBox(height: 10.h,),
                                  getDate(),
                                  SizedBox(height: 20.h,),
                                  SizedBox(height: 300.h,),

                                  getImage()
                                ],
                              ),
                              //clockin clockout button
                              Padding(
                                padding: const EdgeInsets.only(bottom: 150),
                                child: ClockinClockoutButton(
                                      onPressed:(){
                                        AttendanceProviderInstance.setIsLoading(true);
                                         CurrentLocation().getCurrentLoc(context).then((value){
                                           print('raw name ${value['name']}');
                                           AttendanceProviderInstance.isClockIn?AttendanceProviderInstance.setType('logout'):AttendanceProviderInstance.setType('login');
                                           AttendanceProviderInstance.setTimeIn(time);
                                           AttendanceProviderInstance.setTimeInLocation('${value['name']}, ${value['street']}, ${value['thoroughfare']}, ${value['locality']}, ${value['subLocality']}, ${value['subAdminiArea']}, ${value['postalCode']}, ${value['state']}, ${value['country']}');
                                           AttendanceProviderInstance.setLatitude('${value['lat']}');
                                           AttendanceProviderInstance.setLongitude('${value['long']}');
                                           AttendanceProviderInstance.isClockIn? PopUps(context: context).clockOutWorkReportSubmit().then((vl){
                                             print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> popup value $vl');
                                             if(vl !=null){
                                               AttendanceProviderInstance.clockInClockOut(context).then((value){
                                                 AttendanceProviderInstance.type=='logout'?Routes.navigateToMainDashBoardAgain(context):null;
                                                 AttendanceProviderInstance.type=='logout'?AttendanceProviderInstance.setType(''):null;
                                               });
                                             }
                                             else {
                                               AttendanceProviderInstance.setIsLoading(false);
                                             }
                                           }):
                                           AttendanceProviderInstance.clockInClockOut(context).then((value){
                                             AttendanceProviderInstance.type=='logout'?Routes.navigateToMainDashBoardAgain(context):null;
                                             AttendanceProviderInstance.type=='logout'?AttendanceProviderInstance.setType(''):null;
                                           });

                                        });
                                      },
                                      title: AttendanceProviderInstance.isClockIn?Translation.of(context)!.translate('clock_out')! : Translation.of(context)!.translate('clock_in')!,
                                      buttonColor: AttendanceProviderInstance.isClockIn?clockinClockoutLogoutColor:clockinClockoutInsideColors,
                                      currentTime:time,
                                      //isLogin: false,
                                      //isLogout:  true,
                                      loginTime: ClockInClockOutModel().timeIn,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    AttendanceProviderInstance.isLoading?Loader():const SizedBox()
                  ],
                ),
              )
          );
        },
      )

    );
  }
}

