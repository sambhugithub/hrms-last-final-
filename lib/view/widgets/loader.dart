

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../helper/color.dart';



class Loader extends StatelessWidget {
   double? containerHeight;
   double? containerWidth;
   double? sizedboxHeight;
   double? sizedboxWidth;
   Color? containerColor;
   Color? sizeboxColor;
   Color? loaderColor;
   double? strockWidth;
   Indicator? indicatorType;


   Loader({
    this.containerHeight,
    this.containerWidth,
    this.sizedboxHeight,
    this.sizedboxWidth,
    this.containerColor,
    this.sizeboxColor,
    this.loaderColor,
    this.strockWidth,
    this.indicatorType
   });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight ?? MediaQuery.of(context).size.height,
      width: containerWidth ?? MediaQuery.of(context).size.width,
      color: containerColor ?? Colors.black.withOpacity(.5),
      child: Center(
        child: Container(
          height: 100.h,
          width: 100.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.r)),
          child: LoadingIndicator(
            indicatorType: indicatorType??Indicator.ballClipRotateMultiple,
            colors:  [appcolor2],
            strokeWidth: 4.h,
            backgroundColor: Colors.white,
            pathBackgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
