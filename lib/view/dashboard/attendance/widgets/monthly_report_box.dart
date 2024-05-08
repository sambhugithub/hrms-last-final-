import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/localizations/app_localizations.dart';



class MonthlyReportBox extends StatelessWidget {
  final String? totoalWorkingDay;
  final String? fullDay;
  final String? halfDay;
  final String? absent;
  const MonthlyReportBox({
    this.totoalWorkingDay,
    this.fullDay,
    this.halfDay,
    this.absent,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 561.w,
      //height: 100.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.r),bottomLeft: Radius.circular(10.r)),
          color: homeProfileContainerColor
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //total working day
                SizedBox(
                  //color: Colors.white,
                  width: 250.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200.w,
                        child: Text(Translation.of(context)!.translate('total_working_days')!,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w500,),),
                      ),
                      SizedBox(
                        width: 50.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 35.h,
                              width: 35.h,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white
                              ),
                              child: Center(
                                child: Container(
                                  height: 32.h,
                                  width: 32.h,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green
                                  ),
                                  child: Center(
                                    child: Text('$totoalWorkingDay',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w500,),),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),


                //full days
                SizedBox(
                  //color: Colors.white,
                  width: 250.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200.w,
                        child: Text(Translation.of(context)!.translate('full_day')!,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w500,),),
                      ),
                      SizedBox(
                        width: 50.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 35.h,
                              width: 35.h,
                              decoration:const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white
                              ),
                              child: Center(
                                child: Container(
                                  height: 32.h,
                                  width: 32.h,
                                  decoration:const  BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: appcolor1
                                  ),
                                  child: Center(
                                    child: Text('$fullDay',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w500,),),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //total working day
                SizedBox(
                  //color: Colors.white,
                  width: 250.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200.w,
                        child: Text(Translation.of(context)!.translate('half_day')!,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w500,),),
                      ),
                      SizedBox(
                        width: 50.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 35.h,
                              width: 35.h,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white
                              ),
                              child: Center(
                                child: Container(
                                  height: 32.h,
                                  width: 32.h,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.yellow
                                  ),
                                  child: Center(
                                    child: Text('$halfDay',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w500,),),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),


                //full days
                SizedBox(
                  //color: Colors.white,
                  width: 250.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200.w,
                        child: Text(Translation.of(context)!.translate('absent')!,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w500,),),
                      ),
                      SizedBox(
                        width: 50.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 35.h,
                              width: 35.h,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white
                              ),
                              child: Center(
                                child: Container(
                                  height: 32.h,
                                  width: 32.h,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red
                                  ),
                                  child: Center(
                                    child: Text('$absent',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w500,color: Colors.white),),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.h,)
        ],

      ),
    );
  }
}
