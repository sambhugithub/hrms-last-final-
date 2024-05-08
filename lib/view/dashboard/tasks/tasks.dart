import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/localizations/app_localizations.dart';
import 'package:hrms/view/dashboard/tasks/widgets/done_work.dart';
import 'package:hrms/view/dashboard/tasks/widgets/pending_work.dart';
import 'package:hrms/view/dashboard/tasks/widgets/to_do.dart';
import 'package:hrms/view/screens/employee_modules/tasks/widgets/project_list.dart';
import 'package:hrms/view/widgets/appbar.dart';

import '../../widgets/appbar_actions.dart';
import '../../widgets/asset_image_fetch.dart';



class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {


  @override
  Widget build(BuildContext context) {

    final List<Tab> _tabs=[
      Tab(
        child: Container(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(Translation.of(context)!.translate('to_do')!,style: TextStyle(fontSize: 14),),
          ),
        ),
      ),

      Tab(
        child: Container(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(Translation.of(context)!.translate('pending_work')!,style: TextStyle(fontSize: 14),),
          ),
        ),
      ),

      Tab(
        child: Container(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(Translation.of(context)!.translate('done_work')!,style: TextStyle(fontSize: 14),),
          ),
        ),
      ),
    ];

    return
      Scaffold(
      backgroundColor: appscaffoldcolor1,
      appBar: AppBars(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image(image: AssetImage(const AssetImages(imgName: 'appbar_leading').getAssetImagePath()),fit: BoxFit.contain,),
        ),
        leadingWidth: MediaQuery.of(context).size.width*.35,
        actions: [
          AppbarActions().notification()
        ],
      ),
      body: const ProjectList()
      /*DefaultTabController(
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
                  ToDo(),
                  PendingWork(),
                  DoneWork()
                ],
              ),
            )
          ],
        ),
      ),*/

    );
  }
}




