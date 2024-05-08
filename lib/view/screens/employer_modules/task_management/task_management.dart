import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/provider/organization_providers/task/organization_task_provider.dart';
import 'package:hrms/view/screens/employer_modules/task_management/widgets/project_list.dart';
import 'package:hrms/view/widgets/loader.dart';
import 'package:provider/provider.dart';

import '../../../../localizations/app_localizations.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/appbar_actions.dart';
import '../../../widgets/asset_image_fetch.dart';




class OrganizationTaskManagement extends StatefulWidget {
  const OrganizationTaskManagement({super.key});

  @override
  State<OrganizationTaskManagement> createState() => _OrganizationTaskManagementState();
}

class _OrganizationTaskManagementState extends State<OrganizationTaskManagement> {

  apiCall()async{
    await context.read<OrganizationTaskProvider>().getOrganizationTaskData(context);
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
        appbarColor: Colors.white,
        centerTitle: false,
        autoImplyLeading: true,
        title:Image(image: AssetImage(const AssetImages(imgName: 'appbar_leading').getAssetImagePath()),fit: BoxFit.contain,height: 59.h,width: 217.w,),
        //leadingWidth: MediaQuery.of(context).size.width*.35,
        actions: [
          AppbarActions().notification()
        ],
      ),

      body:Consumer<OrganizationTaskProvider>(
        builder: (_,instance,child){
          return instance.isLoading?Loader(containerColor: appscaffoldcolor1,):instance.organizationTaskData!.data!.isEmpty?
              const Center(
                child: Text('No Data'),
              )
              :OrganizationProjectList(data: instance.organizationTaskData!.data!,);
        },
      )


    );
  }
}
