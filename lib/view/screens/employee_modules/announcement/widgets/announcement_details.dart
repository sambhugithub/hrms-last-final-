import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/const.dart';

import '../../../../../helper/color.dart';
import '../../../../../localizations/app_localizations.dart';
import '../../../../widgets/appbar.dart';
import '../../../../widgets/appbar_actions.dart';
import '../../../../widgets/asset_image_fetch.dart';



class AnnouncementDetails extends StatefulWidget {
  final String title;
  final String description;
  final String imgUrl;
  const AnnouncementDetails(
      @required this.title,
      @required this.description,
      this.imgUrl,
      {super.key});

  @override
  State<AnnouncementDetails> createState() => _AnnouncementDetailsState();
}

class _AnnouncementDetailsState extends State<AnnouncementDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appscaffoldcolor1,
      appBar: AppBars(
        centerTitle: true,
        autoImplyLeading: true,
        leadingWidth: 150.w,
        leading:Image(image: AssetImage(const AssetImages(imgName: 'appbar_leading').getAssetImagePath()),fit: BoxFit.contain,height: 59.h,width: 200.w,),
        //leadingWidth: MediaQuery.of(context).size.width*.35,
        title:  Text('${Translation.of(context)!.translate('announcement_details')}',style: const TextStyle(color: Colors.white,fontSize: 20),),
        actions: [
          AppbarActions().notification()
        ],
      ),
      body: SingleChildScrollView(
        child: Align(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('${widget.title}',style: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                SizedBox(height: 20.h,),
                widget.imgUrl!=null || widget.imgUrl!=''?
                    Container(
                      height: 300.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.white
                      ),
                      child: Center(
                        child: ClipRect(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image(image: NetworkImage('$announcementImagePath${widget.imgUrl}')),
                          ),
                        ),
                      ),
                    ):
                    const SizedBox(),
                SizedBox(height: 10.h,),
                Text(widget.description,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w400),textAlign: TextAlign.justify,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
