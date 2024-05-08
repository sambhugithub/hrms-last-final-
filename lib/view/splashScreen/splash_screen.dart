import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/helper/prefkeys.dart';
import 'package:hrms/helper/routes.dart';
import 'package:hrms/view/auth/login/login.dart';
import 'package:hrms/view/widgets/asset_image_fetch.dart';
import 'package:hrms/view/widgets/shared_preference.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  NavigateTo()async{
    bool newUser=await SharedPreference().getBoolValue(PrefKeys.NEWUSER) ?? true;
    Timer(
        const Duration(seconds: 6),
            (){
          newUser?
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LogIn()))
              :Routes.navigateToDashboard(context);
        }
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NavigateTo();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: appcolor1,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:<Widget> [
          Container(
            height: 135.h,
            width: 390.w,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50)
            ),
            child: Center(
              child: Image(
                image:  AssetImage(const AssetImages(imgName: 'appbar_leading').getAssetImagePath()),
                height: 92.h,
                width: 374.w,
                fit: BoxFit.contain,
              ),
            ),
          ),
            SizedBox(
             height: MediaQuery.of(context).size.height*.6,
             width: MediaQuery.of(context).size.width,
             child:  Center(
               child: Image(
                 image: AssetImage(const AssetImages(imgName: 'splash_img').getAssetImagePath()),
                 fit: BoxFit.contain,
               ),
             ),
           ),

        ],
      ),

    );
  }
}
