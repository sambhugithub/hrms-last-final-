import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/provider/organization_providers/organization_profile/organization_profile_provider.dart';
import 'package:hrms/view/screens/employer_modules/organization_profile/widgets/authorizing_officer.dart';
import 'package:hrms/view/screens/employer_modules/organization_profile/widgets/employees_according_to_rti.dart';
import 'package:hrms/view/screens/employer_modules/organization_profile/widgets/key_contacts.dart';
import 'package:hrms/view/screens/employer_modules/organization_profile/widgets/level1_users.dart';
import 'package:hrms/view/widgets/loader.dart';
import 'package:provider/provider.dart';

import '../../../../helper/color.dart';
import '../../../../provider/auth/auth_provider.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/appbar_actions.dart';
import '../../../widgets/asset_image_fetch.dart';



class OrganizationProfile extends StatefulWidget {
  const OrganizationProfile({super.key});

  @override
  State<OrganizationProfile> createState() => _OrganizationProfileState();
}

class _OrganizationProfileState extends State<OrganizationProfile> {






  makeSections(value,text,VoidCallback onTap){
    return Container(
        height: 80.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 80.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                      color: appcolor1,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Center(
                      child: Text(value,style: TextStyle(color: Colors.white,fontSize: 35.sp,fontWeight: FontWeight.w600),),
                    ),
                  ),
                ),
                SizedBox(width: 20.w,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(text,style: TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.w600),),
                    Text(value,style: TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.w600))
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: onTap,
                child: CircleAvatar(
                  radius: 30.r,
                  backgroundColor: appcolor2,
                  child: Center(
                    child: Icon(Icons.arrow_forward,color: Colors.white,size: 20.h,),
                  ),
                ),
              ),
            )
          ],
        )
    );
  }


  apiCall()async{
    await context.read<OrganizationProfileProvider>().getOrganizationProfileData(context);
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

      body: Consumer<OrganizationProfileProvider>(
        builder: (_,instance,child){
          return instance.isLoading?Loader(containerColor: appscaffoldcolor1,):SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: appcolor1
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                      radius: 50.r,
                                      backgroundColor: Colors.white,
                                      backgroundImage: AssetImage(const AssetImages(imgName: 'ux').getAssetImagePath())
                                  ),
                                  SizedBox(width: 15.w,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Organization Profile Status',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18.sp),),
                                      Text('100%',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 25.sp),)
                                    ],
                                  )
                                ],
                              ),
                              
                              //logout
                              InkWell(
                                onTap: (){
                                  context.read<AuthProvider>().userLogOut(context);
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.logout,color: Colors.red,),
                                    Text('Log Out',style: TextStyle(color: Colors.white),)
                                  ],
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  Text('Organization Profile Status',style: TextStyle(color: Colors.white,),),
                                  Text('Completed (100%)',style: TextStyle(color: Colors.white,),),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 10.h,),
                  makeSections(instance.organizationProfileDashboardData!.data!.companyRtiCount.toString(), 'Employees According to RTI',(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>  EmployeesAccordingToRti(data: instance.organizationProfileDashboardData!.data!.companyRti!,)));
                  }),
                  SizedBox(height: 10.h,),
                  makeSections(instance.organizationProfileDashboardData!.data!.authorizingOfficerCount.toString(),'Authorizing Officer',(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> AuthorizingOfficerPage(data: instance.organizationProfileDashboardData!.data!.authorizingOfficer!)));
                  }),
                  SizedBox(height: 10.h,),
                  makeSections(instance.organizationProfileDashboardData!.data!.employeeKeyLinkCount.toString(),'Key Contact',(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>  KeyContacts(data: instance.organizationProfileDashboardData!.data!.employeeKeyLink!,)));
                  }),
                  SizedBox(height: 10.h,),
                  makeSections(instance.organizationProfileDashboardData!.data!.authorizingOfficerCount.toString(),'Level 1 User',(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>  Lebel1Users(data: instance.organizationProfileDashboardData!.data!.authorizingOfficer!)));
                  }),
                ],
              ),
            ),
          );
        },
      )

    );
  }
}
