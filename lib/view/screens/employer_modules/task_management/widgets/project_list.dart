import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/routes.dart';
import 'package:hrms/model/employer/task/organization_task_model.dart';

import '../../../../../helper/color.dart';
import '../../../../../localizations/app_localizations.dart';



class OrganizationProjectList extends StatefulWidget {
  final List<Data> data;
  const OrganizationProjectList({
    required this.data,
    super.key});

  @override
  State<OrganizationProjectList> createState() => _OrganizationProjectListState();
}

class _OrganizationProjectListState extends State<OrganizationProjectList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: widget.data.length,
        itemBuilder: (context,index){
          return InkWell(
            onTap: (){
              Routes.navigateToEmployerTaskList(context,widget.data[index].taskList!);
            },
            child: SizedBox(
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
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(5.r),topRight: Radius.circular(5.r)),
                          color: appcolor1
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(widget.data[index].title.toString(),style: TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.w600),),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${Translation.of(context)!.translate('owner')} :',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18.sp),),
                                Text(widget.data[index].owner.toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16.sp),)
                              ],
                            ),
                          ),
                          const Divider(height: .5,thickness: .5,color: Colors.grey,),

                          //start date
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${Translation.of(context)!.translate('start_date')} :',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18.sp),),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: appcolor1
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                      child: Text(widget.data[index].createdAt.toString().substring(0,10),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16.sp),),
                                    ))
                              ],
                            ),
                          ),
                          const Divider(height: .5,thickness: .5,color: Colors.grey,),

                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height:85.h,
                                width: MediaQuery.of(context).size.width,
                                //color: Colors.red,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: widget.data[index].labels!.length,
                                  itemBuilder: (context,index1){
                                    return Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: InkWell(
                                        onTap: ()async{
                                          /*await instance.setProjectId(instance.taskDashboardData!.data![index].projectId.toString());
                                            await instance.setProjectStatus(instance.taskDashboardData!.data![index].tasks![index1].title);
                                            await instance.getEmployeeTaskListData(context);
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>TaskList(status: instance.projectStatus,taskListData: instance.employeeTaskList?.data,)));*/
                                        },
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
                                                  Text(widget.data[index].labels![index1].count.toString(),style: TextStyle(color: Colors.white,fontSize: 25.sp,fontWeight: FontWeight.w600),),
                                                  Text(widget.data[index].labels![index1].title.toString(),style: TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.w500)),
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
            ),
          );
        },
      ),
    );
  }
}
