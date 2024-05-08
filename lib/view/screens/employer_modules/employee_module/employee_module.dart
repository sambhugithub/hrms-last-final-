import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';

import 'package:hrms/view/screens/employer_modules/employee_module/widgets/employee_list.dart';
import 'package:hrms/view/screens/employer_modules/employee_module/widgets/employee_searchbar.dart';
import 'package:hrms/view/widgets/appbar.dart';


import 'package:hrms/localizations/app_localizations.dart';
import 'package:hrms/view/screens/employer_modules/employee_module/widgets/employee_list.dart';
import 'package:hrms/view/screens/employer_modules/employee_module/widgets/employee_searchbar.dart';
import 'package:hrms/view/widgets/appbar.dart';
import 'package:hrms/view/widgets/loader.dart';
import 'package:provider/provider.dart';

import '../../../../provider/organization_providers/employee/employee_provider.dart';

import '../../../widgets/appbar_actions.dart';
import '../../../widgets/asset_image_fetch.dart';


class EmployeeModule extends StatefulWidget {
  const EmployeeModule({super.key});

  @override
  State<EmployeeModule> createState() => _EmployeeModuleState();
}

class _EmployeeModuleState extends State<EmployeeModule> {



  apiCall()async{
    await context.read<OrganizationEmployeeProvider>().getOrganizationEmployeeList(context);
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

      /*body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: appcolor1,
          child:  Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const EmployeeSearchBar(),
                SizedBox(height:20.h,),
                Expanded(child: const EmployeeList())

              ],
            ),
          ),
        ),*/

      body: Consumer<OrganizationEmployeeProvider>(
        builder: (_,instance,child){
          return instance.isLoading?Loader(containerColor: appscaffoldcolor1,):Center(
            child: instance.organizationEmployeeListData!.data!.isEmpty?Text(Translation.of(context)!.translate('no_data').toString()):Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: appcolor1,
              child:  Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const EmployeeSearchBar(),
                    SizedBox(height:20.h,),
                    Expanded(child: const EmployeeList())

                  ],
                ),
              ),
            ),
          );
        },
      )
    );
  }
}
