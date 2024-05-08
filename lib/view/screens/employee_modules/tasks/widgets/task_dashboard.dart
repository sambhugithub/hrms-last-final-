import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/provider/task/task_provider.dart';
import 'package:hrms/view/widgets/loader.dart';
import 'package:provider/provider.dart';


class TaskDashboard extends StatefulWidget {
  const TaskDashboard({super.key});

  @override
  State<TaskDashboard> createState() => _TaskDashboardState();
}

class _TaskDashboardState extends State<TaskDashboard> {

  apiCall()async{
    WidgetsBinding.instance.addPostFrameCallback((_)async{
      await context.read<TaskProvider>().getEmployeeTaskDashboardData(context);

    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiCall();
  }
  
  
 MaterialColor getColor(int i){
    switch (i){
      case 0:
       return Colors.red; 
       break;

      case 1:
        return Colors.green;
        break;

      case 2:
        return Colors.blue;
        break;

      case 3:
        return Colors.purple;
        break;

      case 4:
        return Colors.orange;
        break;

      case 5:
        return Colors.orange;
        break;
        
      default:
        return Colors.amber;
    }
  }
  
  getText(int i){
    switch (i){
      case 0:
        return 'Projects';
        break;

      case 1:
        return 'Tasks';
        break;

      case 2:
        return 'ToDo Work';
        break;

      case 3:
        return 'InProgress Work';
        break;

      case 4:
        return 'Done Work';
        break;

      default:
        return '';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (_,instance,child){
        return instance.isLoading?Loader(containerColor: appscaffoldcolor1,):Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Wrap(
                      children: List.generate(5, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(30.r),
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.r),
                                  color: Colors.white,
                                ),
                                height: 180.h,
                                width: 240.w,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height:100.h,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: getColor(index)
                                        ),
                                        child: Center(
                                          child: Text(instance.taskDashboardData?.data!.length.toString()??'0',style: TextStyle(fontFamily: 'SailStyle',fontWeight: FontWeight.w800,fontSize: 50.sp,color: Colors.white),),
                                        ),
                                      ),
                                      SizedBox(height: 10.h,),
                                      Text(getText(index),style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600),)

                                    ],
                                  ),
                                )
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              )
          ),
        );
      },
    );
  }
}

