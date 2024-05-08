import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/helper/routes.dart';
import 'package:hrms/localizations/app_localizations.dart';
import 'package:hrms/view/widgets/appbar.dart';

import '../../../widgets/appbar_actions.dart';
import '../../../widgets/asset_image_fetch.dart';



class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appscaffoldcolor1,
      appBar: AppBars(
      centerTitle: true,
      autoImplyLeading: true,
      leadingWidth: 150.w,
      leading:Image(image: AssetImage(const AssetImages(imgName: 'appbar_leading').getAssetImagePath()),fit: BoxFit.contain,height: 100.h,width: 300.w,),
      //leadingWidth: MediaQuery.of(context).size.width*.35,
        title:  Text('${Translation.of(context)!.translate('notification')}',style: const TextStyle(color: Colors.white,fontSize: 20),),
      actions: [
        //AppbarActions().notification()
      ],
    ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 5),
                    child: InkWell(
                      onTap: (){
                        Routes.navigateToEmployeeNotificationDetails(context,'title','description');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white
                        ),
                        child: ListTile(
                          leading: Container(
                            height: 50.h,
                            width: 50.h,
                            decoration: BoxDecoration(
                              //color: Colors.red,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey,width: .5)
                            ),
                            child: Center(
                              child: Image(image: AssetImage('${const AssetImages(imgName: 'app_icon').getAssetImagePath()}')),
                            ),
                          ),
                          title: const Text('Notification Title'),
                          subtitle: const Text('This is a Notification Description'),

                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
      ),
    );
  }
}
