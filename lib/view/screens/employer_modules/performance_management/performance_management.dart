import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/provider/organization_providers/performance_management/performance_requestlist_provider.dart';
import 'package:hrms/view/screens/employer_modules/performance_management/widgets/perfomance_request_list.dart';
import 'package:hrms/view/widgets/loader.dart';
import 'package:provider/provider.dart';

import '../../../../helper/color.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/appbar_actions.dart';
import '../../../widgets/asset_image_fetch.dart';


class PerformanceManagement extends StatefulWidget {
  const PerformanceManagement({super.key});

  @override
  State<PerformanceManagement> createState() => _PerformanceManagementState();
}

class _PerformanceManagementState extends State<PerformanceManagement> {


  apiCall()async{
    await context.read<PerformanceRequestListProvider>().getOrganizationPerformanceRequestList(context);
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
      body: Consumer<PerformanceRequestListProvider>(
        builder: (_,instance,child){
          return instance.isLoading?Loader(containerColor: appscaffoldcolor1,):instance.organizationPerformanceRequestListData!.data!.performances!.isEmpty
              ? const Center(
                child: Text('No Data'),
              )
          :PerformanceRequestList(data: instance.organizationPerformanceRequestListData!.data!.performances!,);
        },
      ) ,
    );
  }
}
