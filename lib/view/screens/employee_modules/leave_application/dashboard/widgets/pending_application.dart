import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/localizations/app_localizations.dart';
import 'package:hrms/provider/leave_application/leave_application_provider.dart';
import 'package:hrms/view/widgets/loader.dart';
import 'package:provider/provider.dart';


class PendingApplication extends StatefulWidget {
  const PendingApplication({super.key});

  @override
  State<PendingApplication> createState() => _PendingApplicationState();
}

class _PendingApplicationState extends State<PendingApplication> {
  apiCall()async{
    WidgetsBinding.instance.addPostFrameCallback((_)async {
      await context.read<LeaveApplicationProvider>().setLeaveStatusType('NOT APPROVED');
      await context.read<LeaveApplicationProvider>().employeeLeaveApplicationStatus(context);
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
    return Consumer<LeaveApplicationProvider>(
      builder: (_,instance,child){
        return
          instance.isLoading?
           Loader(containerColor: appscaffoldcolor1,)
        :instance.employeeLeaveStatusData!.data!.isEmpty?
              Center(
                child: Text('${Translation.of(context)!.translate('no_data')}'),
              )
              :ListView.builder(
          itemCount: instance.employeeLeaveStatusData!.data!.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
              child: Card(
                elevation: 5,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      //leave type
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 200.w,
                            child: Text('${Translation.of(context)!.translate('leave_type')}',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20.sp),),
                          ),
                          SizedBox(
                            width: 300.w,
                            child: Text('${instance.employeeLeaveStatusData!.data![index].leaveTypeName}',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20.sp,color: appcolor2),),
                          )
                        ],
                      ),

                      const Divider(color: Colors.grey,thickness: .5,height: 20,),

                      //period
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 200.w,
                            child: Text('${Translation.of(context)!.translate('period')}',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20.sp),),
                          ),
                          SizedBox(
                            width: 300.w,
                            child: Text('${instance.employeeLeaveStatusData!.data![index].fromDate}   -  ${instance.employeeLeaveStatusData!.data![index].toDate}',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20.sp,),),
                          )
                        ],
                      ),

                      const Divider(color: Colors.grey,thickness: .5,height: 20,),

                      //duration
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 200.w,
                            child: Text('${Translation.of(context)!.translate('duration')}',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20.sp),),
                          ),
                          SizedBox(
                            width: 300.w,
                            child: Text('${instance.employeeLeaveStatusData!.data![index].noOfLeave} Day(s)',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20.sp,),),
                          )
                        ],
                      ),

                      const Divider(color: Colors.grey,thickness: .5,height: 20,),
                      //note
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 200.w,
                            child: Text('${Translation.of(context)!.translate('note')}',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20.sp),),
                          ),
                          SizedBox(
                            width: 300.w,
                            child: Text('${instance.employeeLeaveStatusData!.data![index].statusRemarks}',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20.sp,),),
                          )
                        ],
                      ),

                      const Divider(color: Colors.grey,thickness: .5,height: 20,),
                      //leave entry at
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 200.w,
                            child: Text('${Translation.of(context)!.translate('leave_entry_at')}',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20.sp),),
                          ),
                          SizedBox(
                            width: 300.w,
                            child: Text('${instance.employeeLeaveStatusData!.data![index].dateOfApply}',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20.sp,),),
                          )
                        ],
                      ),

                      /*const Divider(color: Colors.grey,thickness: .5,height: 20,),
                      //leave approved at
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 200.w,
                            child: Text('${Translation.of(context)!.translate('leave_approved_at')}',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20.sp),),
                          ),
                          SizedBox(
                            width: 300.w,
                            child: Text('12 march 2023 - 7:30PM',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20.sp,),),
                          )
                        ],
                      ),*/

                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
