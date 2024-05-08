import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/prefkeys.dart';
import 'package:hrms/helper/routes.dart';
import 'package:hrms/model/employee/employee_details_model.dart';
import 'package:hrms/provider/attendance/attendance_provider.dart';
import 'package:hrms/provider/auth/auth_provider.dart';
import 'package:hrms/view/widgets/loader.dart';
import 'package:hrms/view/widgets/shared_preference.dart';
import 'package:provider/provider.dart';

import '../../../../helper/color.dart';
import '../../../../helper/const.dart';
import '../../../../localizations/app_localizations.dart';

class HomeProfileSection extends StatefulWidget {
   const HomeProfileSection({super.key});

  @override
  State<HomeProfileSection> createState() => _HomeProfileSectionState();
}

class _HomeProfileSectionState extends State<HomeProfileSection> {

  getSharedPreferencesData()async{
    await context.read<AttendanceProvider>().setEmpName();
    await context.read<AttendanceProvider>().setDesignation();
    await context.read<AttendanceProvider>().setEmpImage();

  }
  @override
  void initState() {
    getSharedPreferencesData();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<AttendanceProvider>(
        builder: (_,AttendanceProviderInstance,child){
          return Container(
            decoration: const BoxDecoration(
                color: homeProfileContainerColor,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //profile image
                        CircleAvatar(
                          radius: 60.r,
                          backgroundColor: Colors.white,
                          child: Center(
                            child: AttendanceProviderInstance.empImage=='' || AttendanceProviderInstance.empImage==null?Icon(Icons.person,color: Colors.grey,size: 110.h,)
                                : ClipRect(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(60.r),
                                    child: Image(image: NetworkImage('$imagePath${AttendanceProviderInstance.empImage}'),)))
                          ),
                        ),
                        SizedBox(width: 15.w,),
                        //name designation
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width:200.w,child: FittedBox(child: Text('${AttendanceProviderInstance.empName}'.toUpperCase(),style: TextStyle(color: Colors.black,fontSize: 25.sp),))),
                            SizedBox(width:200.w,child: FittedBox(child: Text('${AttendanceProviderInstance.designation}',style: TextStyle(color: Colors.black,fontSize: 16.sp),maxLines: 3,)),),
                          ],
                        )
                      ],
                    ),
                    // clockin button
                    InkWell(
                      onTap: !AttendanceProviderInstance.isLoading?()async{
                        context.read<AttendanceProvider>().setType('');
                         await context.read<AttendanceProvider>().clockInClockOut(context);
                        AttendanceProviderInstance.isHoliday || AttendanceProviderInstance.todaylogout?null:Routes.navigateToClockinClockout(context);
                      }:(){},
                      hoverColor: Colors.white,
                      child: Container(
                        height: 170.h,
                        width: 170.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            center: Alignment(-0.8, -0.6),
                            colors: clockinClockoutOutsideColors,
                            radius: 1.0,
                          ),
                        ),
                        child: Center(
                          child: Container(
                            height: 140.h,
                            width: 140.h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                center: Alignment(-0.2, -0.8),
                                colors: clockinClockoutInsideColors,
                                radius: 2.0,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.access_time_outlined,color: Colors.white,size: 35.h,),
                                  Text(Translation.of(context)!.translate('clock_in_clock_out')!,style: TextStyle(color: Colors.white,fontSize: 20.sp),textAlign: TextAlign.center,)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
