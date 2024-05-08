import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/view/widgets/loader.dart';
import 'package:provider/provider.dart';

import '../../../../../helper/color.dart';
import '../../../../../localizations/app_localizations.dart';
import '../../../../../provider/organization_providers/leave_approver/leave_approver_provider.dart';
import '../../../../widgets/asset_image_fetch.dart';


class Approved extends StatefulWidget {
  const Approved({super.key});

  @override
  State<Approved> createState() => _ApprovedState();
}

class _ApprovedState extends State<Approved> {

  apiCall()async{
    WidgetsBinding.instance.addPostFrameCallback((_)async{
      await context.read<LeaveApproverProvider>().setProjectStatus('Approved');
      await context.read<LeaveApproverProvider>().getOrganizationLeaveApproverList(context);
    });
  }

  @override
  void initState() {
    apiCall();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<LeaveApproverProvider>(
      builder: (_,instance,child){
        return instance.isLoading?Loader(containerColor: appscaffoldcolor1,):Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: instance.approvedLeaveListData!.data!.length,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 60.h,
                                  width: 60.h,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.grey)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Center(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image(
                                          image: AssetImage(const AssetImages(imgName: 'user_no_image').getAssetImagePath()),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.w,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(instance.approvedLeaveListData!.data![index].employeeName.toString().toUpperCase(),style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              radius: 8.r,
                                              backgroundColor: Colors.grey,
                                            ),
                                            Container(
                                              height: 15.h,
                                              width: 2.w,
                                              color: Colors.grey,
                                            ),
                                            CircleAvatar(
                                              radius: 8.r,
                                              backgroundColor: Colors.grey,
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 10.w,),

                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(instance.approvedLeaveListData!.data![index].fromDate.toString(),style: TextStyle(color: Colors.grey,fontSize: 16.sp),),
                                            SizedBox(height: 5.h,),
                                            Text(instance.approvedLeaveListData!.data![index].toDate.toString(),style: TextStyle(color: Colors.grey,fontSize: 16.sp)),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: appcolor2,
                                      borderRadius: BorderRadius.circular(20.r)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                    child: Center(
                                      child: Text(instance.approvedLeaveListData!.data![index].leaveTypeName.toString(),style: TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.w600),),
                                    ),
                                  ),
                                ),

                                Text('${instance.approvedLeaveListData!.data![index].noOfLeave.toString()} Days Off',style: TextStyle(color: appcolor2),),
                                Text(instance.approvedLeaveListData!.data![index].status.toString(),style: TextStyle(color:Colors.green,fontSize: 16.sp),)
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 5.h,),

                        Text(instance.approvedLeaveListData!.data![index].statusRemarks.toString(),textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16.sp),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
