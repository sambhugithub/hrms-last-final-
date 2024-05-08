import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/localizations/app_localizations.dart';
import 'package:hrms/model/employee/task/employee_task_list_model.dart';
import 'package:hrms/provider/attendance/attendance_provider.dart';
import 'package:hrms/provider/leave_application/leave_application_provider.dart';
import 'package:hrms/provider/task/task_provider.dart';
import 'package:hrms/view/widgets/asset_image_fetch.dart';
import 'package:hrms/view/widgets/do_contact.dart';
import 'package:hrms/view/widgets/image_file_picker.dart';
import 'package:hrms/view/widgets/shared_preference.dart';
import 'package:hrms/view/widgets/toast_msg.dart';
import 'package:provider/provider.dart';

import '../../helper/const.dart';



class PopUps{
  final BuildContext context;
  const PopUps({
    required this.context,
  });


  showEmployeeTaskStatus(Data taskData){
    GlobalKey<FormState> form =GlobalKey();
    context.read<TaskProvider>().getEmployeeProjectLabel(context);
    List<PopupMenuItem> itemList =[];
    TextEditingController remark=TextEditingController();
    return showDialog(
        context: context,
        builder: (_){
          return AlertDialog(
            backgroundColor: Colors.transparent,
            content: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 530.h,
                  width: 387.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Form(
                    key: form,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //title bar
                        Container(
                          height: 74.h,
                          width: 387.w,
                          decoration: BoxDecoration(
                            color: appcolor1,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(50.r),topRight: Radius.circular(50.r))
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(taskData.taskName!,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 25.sp),),
                              Text('${Translation.of(context)!.translate('assign_date')!}: ${taskData.startDate}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 16.sp),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: SizedBox(
                            child: Column(
                              children: [
                                //project details
                                Row(
                                  children: [
                                    Text(Translation.of(context)!.translate('task_details')!,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w400),),
                                  ],
                                ),
                                SizedBox(height: 5.h,),
                                Container(
                                  height: 90.h,
                                  width: 349.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color:taskpopupFieldColor
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 3),
                                    child: SingleChildScrollView(child: Text(taskData.taskDesc.toString(),style: TextStyle(fontSize: 16.sp),)),
                                  ),
                                ),

                                SizedBox(height: 15.h,),

                                //project status
                                Row(
                                  children: [
                                    Text(Translation.of(context)!.translate('project_status')!,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w400),),
                                  ],
                                ),
                                SizedBox(height: 5.h,),
                                Container(
                                  height: 46.h,
                                  width: 349.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color:taskpopupFieldColor
                                  ),
                                  child: Consumer<TaskProvider>(
                                    builder: (_,instance,child){
                                      return Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 27.h,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20.r),
                                                    color: Colors.red
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                                                  child: Center(
                                                    child: FittedBox(child: Text('${instance.projectCurrentStatus}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 25.sp),)),
                                                  ),
                                                ),
                                              ),
                                              PopupMenuButton(
                                                onOpened: ()async{
                                                  print('start');
                                                  //context.read<TaskProvider>().getEmployeeProjectLabel(context);
                                                },
                                                icon: const Icon(Icons.arrow_drop_down_sharp,color: Colors.black),
                                                iconSize: 20.h,
                                                onSelected: (item)async{
                                                  print(item);
                                                  await context.read<TaskProvider>().setProjectCurrentStatus(item);
                                                  //print('///////////////////////////////////${context.read<TaskProvider>().projectCurrentStatus}');
                                                },
                                                //initialValue: '${context.watch<TaskProvider>().projectCurrentStatus}',
                                                itemBuilder: (context)=>
                                                    context.read<TaskProvider>().projectLabels!.data!.map((item) => PopupMenuItem<String>(
                                                      value: item.title,
                                                      child: Text(
                                                        item.title!,
                                                      ),
                                                    ))
                                                        .toList(),

                                                /*[
                                              //to_do
                                              PopupMenuItem(
                                                value: 1,
                                                child: Container(
                                                  height: 27.h,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(20.r),
                                                      color: taskTodoStatusColor
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                                                    child: Center(
                                                      child: FittedBox(child: Text(Translation.of(context)!.translate('to_do')!,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 25.sp),)),
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              //inprogress
                                              PopupMenuItem(
                                                value: 2,
                                                child: Container(
                                                  height: 27.h,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(20.r),
                                                      color: taskInprogressStatusColor
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                                                    child: Center(
                                                      child: FittedBox(child: Text(Translation.of(context)!.translate('inprogress')!,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 25.sp),)),
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              //done
                                              PopupMenuItem(
                                                value: 3,
                                                child: Container(
                                                  height: 27.h,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(20.r),
                                                      color: taskDoneStatusColor
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                                                    child: Center(
                                                      child: FittedBox(child: Text(Translation.of(context)!.translate('done')!,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 25.sp),)),
                                                    ),
                                                  ),
                                                ),
                                              ),

                                            ]*/
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                ),

                                SizedBox(height: 15.h,),

                                //Remark
                                Row(
                                  children: [
                                    Text(Translation.of(context)!.translate('remark')!,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w400),),
                                  ],
                                ),
                                SizedBox(height: 5.h,),
                                SizedBox(
                                  height: 76.h,
                                  width: 349.w,
                                  child: TextFormField(
                                    onChanged: (v)async{
                                      //await context.read<TaskProvider>().setTaskComment(v);
                                      //print('><><>${context.read<TaskProvider>().taskComment}');
                                    },
                                    validator: (value){
                                      if(value!.isEmpty || value==''){
                                        return 'Input is Required';
                                      }
                                      else
                                        null;
                                    },
                                    keyboardType: TextInputType.multiline,
                                    controller: remark,
                                    cursorColor: appcolor1,
                                    minLines: 2,
                                    maxLines: 3,
                                    style: TextStyle(fontSize: 15.sp),
                                    decoration: InputDecoration(
                                      contentPadding:const EdgeInsets.symmetric(horizontal: 10),
                                      filled: true,
                                      fillColor: taskpopupFieldColor,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20.r),
                                        borderSide: const BorderSide(color: Colors.transparent,width: 0,style: BorderStyle.none)
                                      ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20.r),
                                            borderSide: const BorderSide(color: Colors.transparent,width: 0,style: BorderStyle.none)
                                        )
                                    ),
                                  ),
                                ),

                                SizedBox(height: 15.h,),
                                InkWell(
                                  onTap: ()async{
                                    if(form.currentState!.validate()){
                                      context.read<TaskProvider>().setTaskComment(remark.text);
                                      Navigator.pop(context,true);
                                    }
                                    else{
                                      null;
                                    }

                                  },
                                  child: Container(
                                    height: 53.h,
                                    width: 349.w,
                                    decoration: BoxDecoration(
                                        color: appcolor2,
                                        borderRadius: BorderRadius.circular(50.r)
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.save,color: Colors.white,size: 15.h,),
                                          SizedBox(width: 10.w,),
                                          Text(Translation.of(context)!.translate('save')!,style: TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.w400),)
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -8,
                  right: -8,
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                      ),
                      child: Center(
                        child: Icon(Icons.cancel,color: Colors.red,size: 31.h,),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
    );
  }

  selectCameraGallery(){
    return showDialog(
        context: context,
        builder: (_){
          return AlertDialog(
            content: Container(
              //height: 200.h,
              //width: 400.w,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: ()async{
                            Navigator.pop(context);
                            await ImageFilePicker().getImageFromCamera().then((v){
                              context.read<LeaveApplicationProvider>().setImage(v);
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: appcolor2,width: .5)
                            ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Center(child: Icon(Icons.camera_alt_outlined,color: appcolor1,size: 45.h,)),
                              )
                          ),
                        ),
                        SizedBox(height: 5.h,),
                        Text('Camera',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20.sp),)
                      ],
                    ),
                    SizedBox(width: 20.w,),

                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: ()async{
                            Navigator.pop(context);
                            await ImageFilePicker().getImageFromGallery().then((v){
                              context.read<LeaveApplicationProvider>().setImage(v);
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: appcolor2,width: .5)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Center(child: Icon(Icons.image_outlined,color: appcolor1,size: 45.h,)),
                              )
                          ),
                        ),
                        SizedBox(height: 5.h,),
                        Text('Gallery',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20.sp,),)
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }


  birthdayPopup(String name,String phone,String imgUrl){
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_){
          return AlertDialog(
            backgroundColor: Colors.transparent,
            content: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 530.h,
                  width: 479.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('${AssetImages(imgName: 'baloons').getAssetImagePath()}'),height: 120,
                        ),
                        Container(
                          height: 163.h,
                          width: 232.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Colors.white
                          ),
                          child: Center(
                            child: imgUrl=='' || imgUrl==null?Icon(Icons.person,color: Colors.grey,size: 170.h,)
                                : ClipRect(child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.r),
                                child: Image(image: NetworkImage('$imagePath${imgUrl}'),fit: BoxFit.cover,))),
                          ),
                        ),
                        Text('Happy Birthday',style: TextStyle(fontFamily: 'SailStyle',color: Colors.black,fontSize: 28.sp,fontWeight: FontWeight.w400),),
                        FittedBox(child: Text('$name',style: TextStyle(fontFamily: 'SailStyle',color: appcolor2,fontSize: 38.sp,fontWeight: FontWeight.w400),)),
                        InkWell(
                          onTap: ()async{
                            Navigator.pop(context);
                            await DoContact().whatsappMsg(context, '$phone');
                          },
                          child: Container(
                            height: 66.h,
                            width: 446.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.r),
                              color: appcolor1.withOpacity(.3)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${Translation.of(context)!.translate('wish_birthday')}',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20.sp),),
                                  Row(
                                    children: [
                                      Container(
                                        height: 55.h,
                                        width: 55.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: appcolor1
                                        ),
                                        child: Center(
                                          child: Icon(Icons.attachment_rounded,color: Colors.white,size: 28.h,),
                                        ),
                                      ),
                                      SizedBox(width: 5.w,),

                                      Container(
                                        height: 55.h,
                                        width: 55.h,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: appcolor2
                                        ),
                                        child: Center(
                                          child: Icon(Icons.send_rounded,color: Colors.white,size: 28.h,),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                Positioned(
                  top: -8,
                  right: -8,
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white
                      ),
                      child: Center(
                        child: Icon(Icons.cancel,color: Colors.red,size: 31.h,),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
    );
  }

   clockOutWorkReportSubmit(){
    TextEditingController workReport =TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_){
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Container(
            height: 320.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
              color: Colors.white
            ),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 60.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(50.r),topLeft: Radius.circular(50.r)),
                      color: appcolor1
                    ),
                    child: Center(
                      child: Text('${Translation.of(context)!.translate('today_work_report')}',style: TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.w600),),
                    ),
                  ),
                  SizedBox(
                    height: 260.h,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('${Translation.of(context)!.translate('add_your_work_report')}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16.sp),),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 100.h,
                            width: 349.w,
                            child: TextFormField(
                              validator: (v){
                                if(v!.isEmpty){
                                  return '${Translation.of(context)!.translate('daily_workreport_is_mendatory')}';
                                }
                                else {
                                  null;
                                }
                              },
                              keyboardType: TextInputType.multiline,
                              controller: workReport,
                              cursorColor: appcolor1,
                              minLines: 5,
                              maxLines: 7,
                              style: TextStyle(fontSize: 15.sp),
                              decoration: InputDecoration(
                                  contentPadding:const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                                  filled: true,
                                  fillColor: taskpopupFieldColor,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.r),
                                      borderSide: const BorderSide(color: Colors.transparent,width: 0,style: BorderStyle.none)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.r),
                                      borderSide: const BorderSide(color: Colors.transparent,width: 0,style: BorderStyle.none)
                                  ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                    borderSide: const BorderSide(color: Colors.red,width: 0,style: BorderStyle.none)
                                ),
                              ),
                            ),
                          ),



                          //submit button
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: SizedBox(
                              width: 200.w,
                              height: 40.h,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: const StadiumBorder(),
                                      backgroundColor: appcolor2,
                                      elevation: 10,
                                      shadowColor: Colors.white
                                  ),
                                  /*style: ButtonStyle(
                                        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                                        foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                             RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50),
                                                side: BorderSide(color: Colors.red)
                                            )
                                        )
                                    ),*/

                                  onPressed:()async {
                                    if(workReport.text.isNotEmpty){
                                      await context.read<AttendanceProvider>().setWorkReport(workReport.text);
                                      Navigator.pop(context,workReport.text);
                                    }
                                    else{
                                      ToastMsg().showToast('${Translation.of(context)!.translate('daily_workreport_is_mendatory')}', Colors.red);
                                    }

                                  },
                                  child:  Text(Translation.of(context)!.translate('submit')!,style: TextStyle(fontSize: 20.sp,color: Colors.white),)
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }

}