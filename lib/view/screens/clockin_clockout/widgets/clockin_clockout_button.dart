import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';



class ClockinClockoutButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String title;
  final List<Color> buttonColor;
  final String currentTime;
  final String? loginTime;
  //final bool isLogin;
  //final bool isLogout;

  const ClockinClockoutButton({
    required this.onPressed,
    required this.title,
    required this.buttonColor,
    required this.currentTime,
    //required this.isLogin,
    //required this.isLogout,
    this.loginTime,
    super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      width: 400.h,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
          gradient: RadialGradient(center: Alignment(-0.2, -0.8),
          radius: 1.0,
          colors: clockinClockoutOutsideColors
        )
      ),
      child: Center(
        child: Container(
          height: 320.h,
          width: 320.h,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(center: Alignment(-0.2, -0.8),
                  radius: 1.0,
                  colors: clockinClockoutOutsideColors
              )
          ),
          child: Center(
            child: InkWell(
              onTap: onPressed,
              child: Container(
                height: 240.h,
                width: 240.h,
                decoration:  BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(center: Alignment(-0.2, -0.8),
                        radius: 2.0,
                        colors: buttonColor
                    )
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //title
                      Text(title,style: TextStyle(color: Colors.white,fontSize: 35.sp),),

                      //current time
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.access_time_outlined,color: Colors.white,size: 30.h,),
                          SizedBox(width: 4.w,),
                          Text(currentTime,style: TextStyle(color: Colors.white,fontSize: 20.sp),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
