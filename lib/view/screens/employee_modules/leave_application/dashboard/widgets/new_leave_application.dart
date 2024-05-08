import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/localizations/app_localizations.dart';
import 'package:hrms/model/employee/leave/leave_type_model.dart';
import 'package:hrms/provider/leave_application/leave_application_provider.dart';
import 'package:hrms/view/widgets/asset_image_fetch.dart';
import 'package:hrms/view/widgets/loader.dart';
import 'package:hrms/view/widgets/popups.dart';
import 'package:hrms/view/widgets/toast_msg.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


class NewLeaveApplication extends StatefulWidget {
  const NewLeaveApplication({super.key});

  @override
  State<NewLeaveApplication> createState() => _NewLeaveApplicationState();
}

class _NewLeaveApplicationState extends State<NewLeaveApplication> {

  getDate(d){
    return showDialog(
        context: context,
        builder: (_){
          return AlertDialog(
            content: Container(
              height: 400.h,
              width: 300.w,
              child: SfDateRangePicker(
                onSelectionChanged: (v){
                  //WidgetsBinding.instance.addPostFrameCallback((v){});
                  Navigator.pop(context);
                  print(v.value);
                  d=='fd'?context.read<LeaveApplicationProvider>().setFromDate(v.value):context.read<LeaveApplicationProvider>().setToDate(v.value);
                },
                selectionMode: DateRangePickerSelectionMode.single,
                view: DateRangePickerView.month,
              ),
            ),
          );
        }
    );
  }
  List<String> leaveTypesData=[];
  setLeaveTypes()async{
    var leaveTypes=context.read<LeaveApplicationProvider>().leaveTypes!.data!;
    print('leavvvvvvvvvvv$leaveTypes');
    for(int i=0;i<leaveTypes.length;i++){
      leaveTypesData.add(leaveTypes[i].leaveTypeName!);
    }
  }

  apiCall()async{
    await context.read<LeaveApplicationProvider>().getEmployeeLeaveTypes(context);
    setLeaveTypes();
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
        return instance.isLoading?Loader(containerColor: appscaffoldcolor1,):SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 1000.h,
                width: 550.w,
                decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    Container(
                        height: 80.h,
                        decoration: const BoxDecoration(
                            color: appcolor1,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                        ),
                        child:Center(
                          child: Text('${Translation.of(context)!.translate('new_leave_application')}',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w500,color: Colors.white),),
                        )
                    ),
                    //daytype select
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 80.h,
                        width: 550.w,
                        decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white
                        ),
                        child: Row(
                          children: [
                            //half day
                            Radio(
                                value: instance.halfDay,
                                activeColor: appcolor2,
                                groupValue: instance.dayType,
                                onChanged: (v){
                                  instance.setDayType(v);
                                }
                            ),
                            Text('${Translation.of(context)!.translate(instance.halfDay)}',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18.sp)),
                            SizedBox(width: 30.w,),
          
                            //full day
                            Radio(
                                value: instance.fullday,
                                //fillColor: MaterialStateColor.resolveWith((states) =>instance.dayType!=instance.fullday?appcolor1:appcolor2),
                                activeColor: appcolor2,
                                groupValue: instance.dayType,
                                onChanged: (v){
                                  instance.setDayType(v);
                                }
                            ),
                            Text('${Translation.of(context)!.translate(instance.fullday)}',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18.sp),),
          
          
                          ],
                        ),
                      ),
                    ),
          
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Text("${Translation.of(context)!.translate('leave_type')}",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w400),),
                        ],
                      ),
                    ),
          
                    //leave type select
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      child: Container(
                        height: 80.h,
                        width: 550.w,
                        decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(instance.leaveType ?? '${Translation.of(context)!.translate('select_leave_type')}',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18.sp,color: instance.leaveType==null?Colors.grey:Colors.black),),
                              DropdownButton<String>(
                                icon: Icon(Icons.arrow_drop_down_sharp,size: 40.h,color: appcolor2,),
                                items: leaveTypesData.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (v) {
                                  instance.setLeaveType(v);
                                  instance.setLeaveTypeId(instance.leaveTypes!.data![leaveTypesData.indexOf(v!)].id);
                                  print(instance.leaveTypeId);
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
          
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Text("${Translation.of(context)!.translate('leave_duration')}",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w400),),
                        ],
                      ),
                    ),
          
          
                    //from date to date
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      child: Container(
                        height: 80.h,
                        width: 550.w,
                        decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Icon(Icons.calendar_today_outlined,color: Colors.black,size: 20.h,),
                              SizedBox(width: 10.w,),
                              InkWell(
                                onTap: (){
                                  WidgetsBinding.instance.addPostFrameCallback((_){

                                    // Add Your Code here.
                                    getDate('fd');

                                  });
                                },
                                  child: Text(instance.fromDate?? Translation.of(context)!.translate('from_date'),style: TextStyle(color: instance.fromDate==null?Colors.grey:Colors.black),)
                              ),
          
          
                              SizedBox(width: 70.w,),
                              Icon(Icons.calendar_today_outlined,color: Colors.black,size: 20.h,),
                              SizedBox(width: 10.w,),
                              InkWell(
                                onTap: (){
                                  WidgetsBinding.instance.addPostFrameCallback((_){

                                    // Add Your Code here.
                                    getDate('td');
                                  });

                                },
                                  child: Text(instance.toDate?? Translation.of(context)!.translate('to_date'),style: TextStyle(color: instance.toDate==null?Colors.grey:Colors.black),)
                              )
                            ],
          
                          ),
                        ),
                      ),
                    ),
          
                    //reason
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Text("${Translation.of(context)!.translate('reason')}",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w400),),
                        ],
                      ),
                    ),
          
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      child: Container(
                        height: 120.h,
                        width: 550.w,
                        decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          controller: instance.reason,
                          cursorColor: appcolor1,
                          minLines: 2,
                          maxLines: 5,
                          style: TextStyle(fontSize: 20.sp),
                          decoration: InputDecoration(
                            hintText: 'Write a Reason..',
                              contentPadding:const EdgeInsets.symmetric(horizontal: 10),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  borderSide: const BorderSide(color: Colors.transparent,width: 0,style: BorderStyle.none)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  borderSide: const BorderSide(color: Colors.transparent,width: 0,style: BorderStyle.none)
                              )
                          ),
                          onChanged: ((v){
                            instance.setLeaveReason();
                          }),
                        ),
          
                      ),
                    ),
          
          
                    //image
                    /*const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Text("${Translation.of(context)!.translate('document')}",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w400),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      child: Row(
                        children: [
                          Stack(alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              Container(
                                height: 150.h,
                                width: 150.w,
                                decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white
                                ),
                                 child: ClipRRect(
                                   borderRadius: BorderRadius.circular(5),
                                   child: Image(
                                     fit: BoxFit.fill,
                                     image: instance.image!=null?FileImage(File(instance.image!.path))as ImageProvider:AssetImage('${const AssetImages(imgName: 'no_image').getAssetImagePath()}'),
                                   ),
                                 ),
          
                                  //instance.image!=null?FileImage(File(instance.image!.path)):
                                  //AssetImage('${const AssetImages(imgName: 'no_image').getAssetImagePath()}')
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: InkWell(
                                      onTap: (){
                                        instance.image==null?
                                            PopUps(context: context).selectCameraGallery():
                                            instance.setImage(null);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          color: appcolor2
                                        ),
                                        child: Center(
                                          child: Icon(instance.image==null?Icons.add:Icons.delete,color: Colors.white,),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),*/
                    SizedBox(height: 20.h,),
          
                    InkWell(
                      onTap: ()async{
                        int day= DateTime.parse(instance.toDate).difference(DateTime.parse(instance.fromDate)).inDays;
                        print('how much day....$day');
                        if(instance.dayType!=null && instance.leaveTypeId!=null && instance.fromDate!=null && instance.toDate!=null && instance.leaveReason!=null){
                          if(DateTime.parse(instance.toDate).difference(DateTime.parse(instance.fromDate)).inDays>=0){
                            await instance.employeeNewLeaveApplication(context);
                          }
                          else{
                            ToastMsg().showToast('${Translation.of(context)!.translate('todate_is_lesser_than_fromdate')}', Colors.red);
                          }
                        }
                        else{
                          ToastMsg().showToast('${Translation.of(context)!.translate('please_fill_all_the_fields')}', Colors.red);
                        }
                      },
                      child: Container(
                        height: 68.h,
                        width: 507.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: appcolor2
                        ),
                        child: Center(
                          child: Text('${Translation.of(context)!.translate('submit')}',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w400,color: Colors.white),),
                        ),
                      ),
                    )
          
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
