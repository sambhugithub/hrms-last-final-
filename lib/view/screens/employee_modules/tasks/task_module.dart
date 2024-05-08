import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/provider/task/task_provider.dart';
import 'package:hrms/view/screens/employee_modules/tasks/widgets/project_list.dart';
import 'package:hrms/view/screens/employee_modules/tasks/widgets/task_dashboard.dart';
import 'package:hrms/view/screens/employee_modules/tasks/widgets/task_list.dart';
import 'package:provider/provider.dart';

import '../../../../helper/color.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/appbar_actions.dart';
import '../../../widgets/appdrawer.dart';
import '../../../widgets/asset_image_fetch.dart';
import '../../../widgets/drawer_widgets.dart';



class TaskModule extends StatefulWidget {
  const TaskModule({super.key});

  @override
  State<TaskModule> createState() => _TaskModuleState();
}

class _TaskModuleState extends State<TaskModule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appscaffoldcolor1,
      appBar: AppBars(
        centerTitle: false,
        autoImplyLeading: true,
        title:Image(image: AssetImage(const AssetImages(imgName: 'appbar_leading').getAssetImagePath()),fit: BoxFit.contain,height: 59.h,width: 217.w,),
        //leadingWidth: MediaQuery.of(context).size.width*.35,
        actions: [
          AppbarActions().notification()
        ],
      ),
      drawer: AppDrawer(
        widgetList: [
          DrawerWidgets().drawerHeader(),
          DrawerWidgets().drawerEmployeeTaskDashboard(context,
                (){
              Navigator.pop(context);
              context.read<TaskProvider>().setEmployeeTaskModuleWidget(const TaskDashboard());
            },
          ),
          DrawerWidgets().drawerEmployeeTaskProjectList(context,
                  (){
                Navigator.pop(context);
                context.read<TaskProvider>().setEmployeeTaskModuleWidget(const ProjectList());
              }
          ),

          /*DrawerWidgets().drawerEmployeeTaskTaskList(context,
                  (){
                Navigator.pop(context);
                context.read<TaskProvider>().setEmployeeTaskModuleWidget(const TaskList());
              }
          )*/
        ],
      ),


      body: Consumer<TaskProvider>(
        builder: (_,instance,child){
          return instance.employeeTaskModuleWidget;
        },
      ),
    );
  }
}

