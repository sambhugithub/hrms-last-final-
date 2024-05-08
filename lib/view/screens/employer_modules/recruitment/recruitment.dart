import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/provider/organization_providers/requirement/organization_requiretment_dashboard_provider.dart';
import 'package:hrms/view/screens/employer_modules/recruitment/widgets/candidate_list.dart';
import 'package:hrms/view/widgets/loader.dart';
import 'package:provider/provider.dart';

import '../../../widgets/appbar.dart';
import '../../../widgets/appbar_actions.dart';
import '../../../widgets/asset_image_fetch.dart';



class Recruitment extends StatefulWidget {
  const Recruitment({super.key});

  @override
  State<Recruitment> createState() => _RecruitmentState();
}

class _RecruitmentState extends State<Recruitment> {



  makeSections(value,text,data){
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
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CandidateList(text,data)));
              },
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
    await context.read<OrganizationRequiretmentDashboardProvider>().getOrganizationRequiretmentDashboardData(context);
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

      body: Consumer<OrganizationRequiretmentDashboardProvider>(
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
                                  Text('Total Applied CV',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18.sp),),
                                  Text(instance.organizationRequiretmentDashboardData!.data!.countJobApplied.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 25.sp),)
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  Text('Total Applied CV',style: TextStyle(color: Colors.white,),),
                                  Text(instance.organizationRequiretmentDashboardData!.data!.countJobApplied.toString(),style: TextStyle(color: Colors.white,),),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 10.h,),
                  makeSections(instance.organizationRequiretmentDashboardData!.data!.countJobApplied.toString(),'JOB APPLIED',instance.organizationRequiretmentDashboardData!.data!.jobApplied),
                  SizedBox(height: 10.h,),
                  makeSections(instance.organizationRequiretmentDashboardData!.data!.countShortListed.toString(),'SHORTLISTED',instance.organizationRequiretmentDashboardData!.data!.shortListed),
                  SizedBox(height: 10.h,),
                  makeSections(instance.organizationRequiretmentDashboardData!.data!.countInterview.toString(),'INTERVIEW',instance.organizationRequiretmentDashboardData!.data!.candidateInterview),
                  SizedBox(height: 10.h,),
                  makeSections(instance.organizationRequiretmentDashboardData!.data!.countHired.toString(),'HIERED',instance.organizationRequiretmentDashboardData!.data!.candidateHired),
                  SizedBox(height: 10.h,),
                  makeSections(instance.organizationRequiretmentDashboardData!.data!.countOfferletter.toString(),'OFFER LETTER',instance.organizationRequiretmentDashboardData!.data!.candidateOffer),
                  SizedBox(height: 10.h,),
                  makeSections(instance.organizationRequiretmentDashboardData!.data!.countReject.toString(),'REJECTED',instance.organizationRequiretmentDashboardData!.data!.candidateRej),


                ],
              ),
            ),
          );
        },
      )
    );
  }
}
