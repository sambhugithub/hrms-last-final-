import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/localizations/app_localizations.dart';
import 'package:hrms/provider/task/task_provider.dart';
import 'package:hrms/view/screens/employee_modules/tasks/widgets/task_list.dart';
import 'package:hrms/view/widgets/loader.dart';
import 'package:provider/provider.dart';



class ProjectList extends StatefulWidget {
  const ProjectList({super.key});

  @override
  State<ProjectList> createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {


  getProjectStatusContainer(String status, int count) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: appcolor1
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(count.toString(), style: TextStyle(color: Colors.white,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w600),),
                Text(status, style: TextStyle(color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  apiCall() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<TaskProvider>().getEmployeeTaskDashboardData(context);
    });
  }

  @override
  void initState() {
    apiCall();
    // TODO: implement initState
    super.initState();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (_, instance, child) {
        return instance.isLoading
            ? Loader(containerColor: appscaffoldcolor1,)
            : SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Padding(
            padding: const EdgeInsets.all(5.0),

            child: instance.taskDashboardData?.data == null ? const Center(
              child: Text('No Data'),) : ListView.builder(
              itemCount: instance.taskDashboardData?.data!.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 550.w,
                  child: Card(
                    elevation: 5,
                    color: Colors.white,
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r)
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 40.h,
                          width: 550.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5.r),
                                  topRight: Radius.circular(5.r)),
                              color: appcolor1
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  instance.taskDashboardData?.data![index]
                                      .projectName! ?? '', style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600),),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //owner nmae
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text('${Translation.of(context)!.translate(
                                        'owner')} :', style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.sp),),
                                    Text(
                                      instance.taskDashboardData?.data![index]
                                          .createdByName! ?? '',
                                      style: TextStyle(color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.sp),)
                                  ],
                                ),
                              ),
                              const Divider(
                                height: .5, thickness: .5, color: Colors.grey,),

                              //start date
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text('${Translation.of(context)!.translate(
                                        'start_date')} :', style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.sp),),
                                    Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                5),
                                            color: appcolor1
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          child: Text(
                                            instance.taskDashboardData == null
                                                ? ''
                                                : '${DateTime
                                                .parse(
                                                instance.taskDashboardData!
                                                    .data![index].createdAt!)
                                                .day
                                                .toString()}-${DateTime
                                                .parse(
                                                instance.taskDashboardData!
                                                    .data![index].createdAt!)
                                                .month
                                                .toString()}-${DateTime
                                                .parse(
                                                instance.taskDashboardData!
                                                    .data![index].createdAt!)
                                                .year
                                                .toString()}', style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.sp),),
                                        ))
                                  ],
                                ),
                              ),
                              const Divider(
                                height: .5, thickness: .5, color: Colors.grey,),

                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 85.h,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    //color: Colors.red,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: instance.taskDashboardData
                                          ?.data![index].tasks!.length ?? 0,
                                      itemBuilder: (context, index1) {
                                        return Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: InkWell(
                                            onTap: () async {
                                              await instance.setProjectId(
                                                  instance.taskDashboardData!
                                                      .data![index].projectId
                                                      .toString());
                                              await instance.setProjectStatus(
                                                  instance.taskDashboardData!
                                                      .data![index]
                                                      .tasks![index1].title);
                                              await instance
                                                  .getEmployeeTaskListData(
                                                  context);
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          TaskList(
                                                            status: instance
                                                                .projectStatus,
                                                            taskListData: instance
                                                                .employeeTaskList
                                                                ?.data,)));
                                            },

                                            /*try {
                                              //print("Before setting project ID");
                                               await instance.setProjectId(instance.taskDashboardData!.data![index].projectId.toString());
                                              //print("Before setting project status");
                                               await instance.setProjectStatus(instance.taskDashboardData!.data![index].tasks![index1].title);
                                              //print("Before getting employee task list data");
                                               instance.getEmployeeTaskListData(context);
                                              //print("Before navigation");
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => TaskList(status: instance.projectStatus, taskListData: instance.employeeTaskList?.data)),);
                                            } catch (e) {
                                              print("Error during navigation: $e");
                                            }*/

                                            /*onTap: ()async{
                                            await instance.setProjectId(instance.taskDashboardData!.data![index].projectId.toString());
                                            await instance.setProjectStatus(instance.taskDashboardData!.data![index].tasks![index1].title);
                                            instance.getEmployeeTaskListData(context).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>TaskList(status: instance.projectStatus,taskListData: instance.employeeTaskList?.data,))));


                                            },*/
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .circular(8.r),
                                                  color: appcolor1
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                    8.0),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .center,
                                                    crossAxisAlignment: CrossAxisAlignment
                                                        .center,
                                                    children: [
                                                      Text(instance
                                                          .taskDashboardData ==
                                                          null ? '' : instance
                                                          .taskDashboardData!
                                                          .data![index]
                                                          .tasks![index1].count
                                                          .toString(),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 25.sp,
                                                            fontWeight: FontWeight
                                                                .w600),),
                                                      Text(instance
                                                          .taskDashboardData ==
                                                          null ? '' : instance
                                                          .taskDashboardData!
                                                          .data![index]
                                                          .tasks![index1].title
                                                          .toString(),
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white,
                                                              fontSize: 18.sp,
                                                              fontWeight: FontWeight
                                                                  .w500)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                              )

                              /*Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      getProjectStatusContainer('ToDo', 01),
                                      getProjectStatusContainer('Work In Progress', 05),
                                      getProjectStatusContainer('Testing', 01),
                                      getProjectStatusContainer('Completed', 01),
                                    ],
                                  ),
                                ),
                              )*/
                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
