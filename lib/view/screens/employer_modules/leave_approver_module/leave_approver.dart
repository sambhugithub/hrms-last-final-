import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/localizations/app_localizations.dart';

import 'package:hrms/provider/organization_providers/leave_approver/leave_approver_provider.dart';
import 'package:hrms/view/screens/employer_modules/leave_approver_module/widgets/approved.dart';
import 'package:hrms/view/screens/employer_modules/leave_approver_module/widgets/not_approved.dart';
import 'package:hrms/view/widgets/loader.dart';
import 'package:provider/provider.dart';


import '../../../widgets/appbar.dart';
import '../../../widgets/appbar_actions.dart';
import '../../../widgets/asset_image_fetch.dart';



class LeaveApprover extends StatefulWidget {
  const LeaveApprover({super.key});

  @override
  State<LeaveApprover> createState() => _LeaveApproverState();
}

class _LeaveApproverState extends State<LeaveApprover> {
    apiCall() async {
      context.read<LeaveApproverProvider>().getOrganizationLeaveApproverList(
          context);
    }


    @override
    void initState() {
      //apiCall();
      // TODO: implement initState
      super.initState();
    }
    @override
    Widget build(BuildContext context) {
      final List<Tab> _tabs = [
        Tab(
          child: Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(Translation.of(context)!.translate('not_approved')!,
                style: const TextStyle(fontSize: 14),),
            ),
          ),
        ),

        Tab(
          child: Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(Translation.of(context)!.translate('approved')!,
                style: const TextStyle(fontSize: 14),),
            ),
          ),
        ),
      ];

      return Scaffold(
          backgroundColor: appscaffoldcolor1,
          appBar: AppBars(
            appbarColor: Colors.white,
            centerTitle: false,
            autoImplyLeading: true,
            title: Image(image: AssetImage(
                const AssetImages(imgName: 'appbar_leading')
                    .getAssetImagePath()),
              fit: BoxFit.contain,
              height: 59.h,
              width: 217.w,),
            //leadingWidth: MediaQuery.of(context).size.width*.35,
            actions: [
              AppbarActions().notification()
            ],
          ),


          body: Container(

              child:
              DefaultTabController(
                initialIndex: 0,
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      /*onTap: (inx)async {
                      if(inx==0){
                        await context.read<LeaveApproverProvider>().setProjectStatus('Not Approved');
                        apiCall();
                      }
                      else if(inx==1){
                        await context.read<LeaveApproverProvider>().setProjectStatus('Approved');
                        apiCall();
                      }
                      else
                        null;
                    },*/
                        tabAlignment: TabAlignment.center,
                        unselectedLabelColor: Colors.black,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18.sp),
                        labelColor: appcolor2,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorWeight: 1,
                        indicatorColor: appcolor2,
                        isScrollable: false,
                        tabs: _tabs
                    ),
                    const Expanded(
                      flex: 1,
                      child: TabBarView(
                        children: [
                          NotApproved(),
                          Approved()
                        ],
                      ),
                    )
                  ],
                ),
              )
            /*Container(
>>>>>>> 9b80c9b (second commit)
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.audio_file_sharp,color: appcolor2,),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text('${Translation.of(context)!.translate('leave_application')}',style: TextStyle(fontWeight: FontWeight.w600),),
                      )
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.calendar_month_outlined,color: appcolor2,),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text('25 OCT 2023',style: TextStyle(fontWeight: FontWeight.w600),),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      )

      )*/

          )
      );
    }
  }