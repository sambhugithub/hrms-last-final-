import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/model/employee/task/employee_task_list_model.dart';
import 'package:hrms/provider/task/task_provider.dart';
import 'package:hrms/view/widgets/loader.dart';
import 'package:provider/provider.dart';

import '../../../../../helper/color.dart';
import '../../../../../localizations/app_localizations.dart';
import '../../../../dashboard/tasks/widgets/done_work.dart';
import '../../../../dashboard/tasks/widgets/pending_work.dart';
import '../../../../dashboard/tasks/widgets/to_do.dart';
import '../../../../widgets/appbar.dart';
import '../../../../widgets/appbar_actions.dart';
import '../../../../widgets/asset_image_fetch.dart';
import '../../../../widgets/popups.dart';



class TaskList extends StatefulWidget {
  final String status;
  final List<Data>? taskListData;
  const TaskList({
    required this.status,
    this.taskListData,

    super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {



  @override
  Widget build(BuildContext context) {
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>${widget.taskListData}');
    /*final List<Tab> _tabs=[
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
    ];*/
    return Scaffold(
      backgroundColor: Colors.white,
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
      /*body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
        child: Container(
          decoration: BoxDecoration(
            color: appscaffoldcolor1,
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //header
                Container(
                  height: 68.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50.r),topRight: Radius.circular(50.r)),
                    color: appcolor2
                  ),
                  child: Center(
                    child: Text(widget.status,style: TextStyle(color: Colors.white,fontSize: 20.sp),),
                  ),
                ),

               Container(
                 decoration: BoxDecoration(
                   //color: Colors.red,
                   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.r),bottomRight: Radius.circular(50.r))
                 ),
                 height:880.h,
                 width: MediaQuery.of(context).size.width,
                 child: ListView.builder(
                   itemCount: widget.taskListData?.length,
                   itemBuilder: (BuildContext context,index){
                     return Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Container(
                         //height: 64.h,
                         width: 529.w,
                         decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(20.r)
                         ),
                         child: Padding(
                           padding: const EdgeInsets.all(10.0),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Container(
                                 //height:50.h,
                                 width: MediaQuery.of(context).size.width*.7,
                                 //color: Colors.red,
                                 child: Column(
                                   children: [
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: [
                                         CircleAvatar(
                                           radius: 15.r,
                                           backgroundColor: appcolor1,
                                           child: Center(
                                             child: Icon(Icons.done,color: Colors.white,size: 20.h,),
                                           ),
                                         ),
                                         SizedBox(width: 10.w,),
                                         Text(widget.taskListData![index].taskName!,style: TextStyle(color: Colors.black,fontSize: 25.sp,fontWeight: FontWeight.w400),)
                                       ],
                                     ),

                                     FittedBox(
                                       child: Padding(
                                         padding: const EdgeInsets.only(left: 20),
                                         child: Row(
                                           mainAxisAlignment: MainAxisAlignment.start,
                                           crossAxisAlignment: CrossAxisAlignment.center,
                                           children: [
                                             Icon(Icons.watch_later_outlined,size: 25.h,),
                                             SizedBox(width: 5.w,),
                                             Text('Start Date: ${widget.taskListData![index].startDate}',style: TextStyle(color: Colors.grey,fontSize: 16.sp),),
                                             SizedBox(width: 10.w,),
                                             Icon(Icons.watch_later_outlined,size: 25.h,),
                                             SizedBox(width: 5.w,),
                                             Text('End Date: ${widget.taskListData![index].expectedEndDate}',style: TextStyle(color: Colors.grey,fontSize: 16.sp),)
                                           ],
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                               ),

                               SizedBox(
                                 //height:50.h,
                                 width: MediaQuery.of(context).size.width*.12,
                                 //color: Colors.red,
                                 child: Center(
                                   child: Container(
                                     height: 45.h,
                                     decoration: const BoxDecoration(
                                       shape: BoxShape.circle,
                                       color: appscaffoldcolor1
                                     ),
                                     child: IconButton(
                                       onPressed: ()async{
                                         await context.read<TaskProvider>().setProjectCurrentStatus(widget.taskListData![index].status);
                                         PopUps(context: context).showEmployeeTaskStatus(widget.taskListData![index]).then((v)async{
                                           if(v==true){
                                             print('task update process starts');
                                             await context.read<TaskProvider>().setTaskId(widget.taskListData![index].id.toString());
                                             await context.read<TaskProvider>().setTaskId(widget.taskListData![index].id.toString());
                                             await context.read<TaskProvider>().getEmployeeTaskStatusUpdate(context);
                                           }
                                           else null;

                                         });
                                       },
                                       icon: Icon(Icons.visibility,color: appcolor2,size: 20.h,),
                                     ),
                                   ),
                                 ),
                               )
                             ],
                           ),
                         )
                       ),
                     );
                   },
                 ),
               )
              ],
            ),
          ),
        ),*/
      body:
      Consumer<TaskProvider>(
        builder: (_,instance,child){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
            child: Container(
              decoration: BoxDecoration(
                color: appscaffoldcolor1,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //header
                    Container(
                      height: 68.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(50.r),topRight: Radius.circular(50.r)),
                          color: appcolor2
                      ),
                      child: Center(
                        child: Text(widget.status,style: TextStyle(color: Colors.white,fontSize: 20.sp),),
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        //color: Colors.red,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.r),bottomRight: Radius.circular(50.r))
                      ),
                      height:880.h,
                      width: MediaQuery.of(context).size.width,
                      child: instance.employeeTaskList?.data==null?const Center(child: Text('No Task'),):ListView.builder(
                        itemCount: instance.employeeTaskList!.data!.length,
                        itemBuilder: (BuildContext context,index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              //height: 64.h,
                                width: 529.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.r)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        //height:50.h,
                                        width: MediaQuery.of(context).size.width*.7,
                                        //color: Colors.red,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                CircleAvatar(
                                                  radius: 15.r,
                                                  backgroundColor: appcolor1,
                                                  child: Center(
                                                    child: Icon(Icons.done,color: Colors.white,size: 20.h,),
                                                  ),
                                                ),
                                                SizedBox(width: 10.w,),
                                                Text(instance.employeeTaskList!.data![index].taskName!,style: TextStyle(color: Colors.black,fontSize: 25.sp,fontWeight: FontWeight.w400),)
                                              ],
                                            ),

                                            FittedBox(
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 20),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.watch_later_outlined,size: 25.h,),
                                                    SizedBox(width: 5.w,),
                                                    Text('Start Date: ${instance.employeeTaskList!.data![index].startDate}',style: TextStyle(color: Colors.grey,fontSize: 16.sp),),
                                                    SizedBox(width: 10.w,),
                                                    Icon(Icons.watch_later_outlined,size: 25.h,),
                                                    SizedBox(width: 5.w,),
                                                    Text('End Date: ${instance.employeeTaskList!.data![index].expectedEndDate}',style: TextStyle(color: Colors.grey,fontSize: 16.sp),)
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      SizedBox(
                                        //height:50.h,
                                        width: MediaQuery.of(context).size.width*.12,
                                        //color: Colors.red,
                                        child: Center(
                                          child: Container(
                                            height: 45.h,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: appscaffoldcolor1
                                            ),
                                            child: IconButton(
                                              onPressed: ()async{
                                                await context.read<TaskProvider>().setProjectCurrentStatus(instance.employeeTaskList!.data![index].status);
                                                PopUps(context: context).showEmployeeTaskStatus(instance.employeeTaskList!.data![index]).then((v)async{
                                                  if(v==true){
                                                    print('task update process starts');
                                                    await context.read<TaskProvider>().setTaskId(instance.employeeTaskList!.data![index].id.toString());
                                                    await context.read<TaskProvider>().setTaskId(instance.employeeTaskList!.data![index].id.toString());
                                                    await context.read<TaskProvider>().getEmployeeTaskStatusUpdate(context);
                                                  }
                                                  else null;

                                                });
                                              },
                                              icon: Icon(Icons.visibility,color: appcolor2,size: 20.h,),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      )
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
