import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/view/screens/employee_modules/leave_application/dashboard/widgets/approved_application.dart';
import 'package:hrms/view/screens/employee_modules/leave_application/dashboard/widgets/pending_application.dart';
import 'package:hrms/view/screens/employee_modules/leave_application/dashboard/widgets/reject_application.dart';

import '../../../../../../helper/color.dart';
import '../../../../../../localizations/app_localizations.dart';



class LeaveApplicationStatus extends StatelessWidget {
  const LeaveApplicationStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Tab> _tabs=[
      Tab(
        child: Container(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(Translation.of(context)!.translate('pending')!,style: const TextStyle(fontSize: 14),),
          ),
        ),
      ),

      Tab(
        child: Container(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(Translation.of(context)!.translate('approved')!,style: const TextStyle(fontSize: 14),),
          ),
        ),
      ),

      Tab(
        child: Container(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(Translation.of(context)!.translate('reject')!,style: const TextStyle(fontSize: 14),),
          ),
        ),
      ),
    ];
    return
      //Container();
      DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
                unselectedLabelColor: Colors.black,
                labelStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 18.sp),
                labelColor: appcolor2,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 1,
                indicatorColor: appcolor2,
                isScrollable: true,
                tabs: _tabs
            ),
            const Expanded(
              flex: 1,
              child: TabBarView(
                children: [
                  PendingApplication(),
                  ApprovedApplication(),
                  RejectApplication()
                ],
              ),
            )
          ],
        ),
      );


  }
}
