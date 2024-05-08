import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';


class AppbarActions{

  notification(){
    return Stack(
      children: [
            IconButton(
            onPressed: (){},
            icon: Icon(Icons.notifications,color: Colors.black,size: 40.h,)),
        Positioned(
          top: 5,
          left: 25,
          child: Container(
            height:25.h,
            width: 25.h,
            decoration: const BoxDecoration(
              color: notificationNumberColor,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: FittedBox(child: Text('10',style: TextStyle(color: Colors.white),)),
            ),
          ),
        )
          ],
    );
  }

}