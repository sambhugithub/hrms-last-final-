import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/helper/routes.dart';
import 'package:hrms/provider/announcement/announcement_provider.dart';
import 'package:hrms/view/widgets/loader.dart';
import 'package:provider/provider.dart';

import '../../../../localizations/app_localizations.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/appbar_actions.dart';
import '../../../widgets/asset_image_fetch.dart';



class Announcements extends StatefulWidget {
  const Announcements({super.key});

  @override
  State<Announcements> createState() => _AnnouncementsState();
}

class _AnnouncementsState extends State<Announcements> {

  apiCall()async{
    await context.read<AnnouncementProvider>().getEmployeeAnnouncementList(context);
  }

  @override
  void initState() {
    apiCall();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appscaffoldcolor1,
      appBar: AppBars(
        centerTitle: true,
        autoImplyLeading: true,
        leadingWidth: 150.w,
        leading:Image(image: AssetImage(const AssetImages(imgName: 'appbar_leading').getAssetImagePath()),fit: BoxFit.contain,height: 59.h,width: 217.w,),
        //leadingWidth: MediaQuery.of(context).size.width*.35,
        title:  Text('${Translation.of(context)!.translate('announcement')}',style: const TextStyle(color: Colors.white,fontSize: 20),),
        actions: [
          AppbarActions().notification()
        ],
      ),
      body: Consumer<AnnouncementProvider>(
        builder: (_,instance,child){
          return instance.isLoading?Loader(containerColor: appscaffoldcolor1,)
          :
          SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: instance.empAnnouncementList?.data==null || instance.empAnnouncementList!.data!.isEmpty ?
                      Center(
                        child: Text('${Translation.of(context)!.translate('no_data')}'),
                      )
                  :ListView.builder(
                    itemCount: instance.empAnnouncementList?.data!.length,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onTap: (){
                            Routes.navigateToEmployeeAnnouncementDetails(
                                context,
                                '${instance.empAnnouncementList?.data![index].announcementTitle}',
                                '${instance.empAnnouncementList?.data![index].announcementDesc}',
                                '${instance.empAnnouncementList?.data![index].image}'
                            );
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
                              title:  Text('${instance.empAnnouncementList?.data![index].announcementTitle}',style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.w600),),
                              subtitle:  Text(instance.empAnnouncementList!.data![index].announcementDesc!.length > 100?'${instance.empAnnouncementList?.data![index].announcementDesc!.substring(0,100)}...':'${instance.empAnnouncementList?.data![index].announcementDesc}',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w400)),

                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
          );
        },
      )

    );
  }
}
