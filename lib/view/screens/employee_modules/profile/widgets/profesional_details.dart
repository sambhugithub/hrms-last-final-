import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../helper/color.dart';
import '../../../../../helper/const.dart';
import '../../../../../localizations/app_localizations.dart';
import '../../../../../provider/profile/profile_provider.dart';



class ProfesionalDetails extends StatefulWidget {
  const ProfesionalDetails({super.key});

  @override
  State<ProfesionalDetails> createState() => _ProfesionalDetailsState();
}

class _ProfesionalDetailsState extends State<ProfesionalDetails> {

  setProviderValues()async{
    await context.read<ProfileProvider>().setCompName();
    await context.read<ProfileProvider>().setDepartment();
    await context.read<ProfileProvider>().setEmpId();
    await context.read<ProfileProvider>().setDesignation();
    await context.read<ProfileProvider>().setEmpType();
    await context.read<ProfileProvider>().setAuthority();
    await context.read<ProfileProvider>().setBankDetails();
    await context.read<ProfileProvider>().setEmpImage();
  }

  @override
  void initState() {
    setProviderValues();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (_,instance,child){
        return Align(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        //height: 500.h,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Colors.grey.shade300
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 50.h,),
                            Text('${Translation.of(context)!.translate('employee_professional_details')}',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20.sp),),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                //height: 200.h,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: Colors.white,
                                    border: Border.all(color: Colors.grey,width: .5)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    //name
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 50.h,
                                            width: 230.w,
                                            //color: Colors.red,
                                            child:  Padding(
                                              padding: const EdgeInsets.only(left: 5),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(color: Colors.grey,width: .2)
                                                    ),
                                                    child: Center(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(2.0),
                                                        child: Icon(Icons.work_outline_outlined,color: Colors.black,size: 20.h,),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5.w,),
                                                  Text('${Translation.of(context)!.translate('company_name')}',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w400))
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 1.w,
                                            height: 50.h,
                                            color: Colors.grey,
                                          ),

                                          SizedBox(
                                            height: 50.h,
                                            width: 230.w,
                                            //color: Colors.red,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 5),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Expanded(child: Text('${instance.compName}',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w400)))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(color: Colors.grey,height: 1,thickness: .5.h,),

                                    //dob
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 50.h,
                                            width: 230.w,
                                            //color: Colors.red,
                                            child:  Padding(
                                              padding: const EdgeInsets.only(left: 5),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(color: Colors.grey,width: .2)
                                                    ),
                                                    child: Center(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(2.0),
                                                        child: Icon(Icons.inventory_outlined,color: Colors.black,size: 20.h,),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5.w,),
                                                  Text('${Translation.of(context)!.translate('department')}',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w400))
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 1.w,
                                            height: 50.h,
                                            color: Colors.grey,
                                          ),

                                          SizedBox(
                                            height: 50.h,
                                            width: 230.w,
                                            //color: Colors.red,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 5),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Expanded(child: Text('${instance.department}',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w400)))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(color: Colors.grey,height: 1,thickness: .5.h,),


                                    //email
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 50.h,
                                            width: 230.w,
                                            //color: Colors.red,
                                            child:  Padding(
                                              padding: const EdgeInsets.only(left: 5),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(color: Colors.grey,width: .2)
                                                    ),
                                                    child: Center(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(2.0),
                                                        child: Icon(Icons.numbers_outlined,color: Colors.black,size: 20.h,),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5.w,),
                                                  Expanded(child: Text('${Translation.of(context)!.translate('emp_id')}',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w400),))
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 1.w,
                                            height: 50.h,
                                            color: Colors.grey,
                                          ),

                                          SizedBox(
                                            height: 50.h,
                                            width: 230.w,
                                            //color: Colors.red,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 5),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Expanded(child: Text('${instance.empId}',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w400)))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(color: Colors.grey,height: 1,thickness: .5.h,),


                                    //phone
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 50.h,
                                            width: 230.w,
                                            //color: Colors.red,
                                            child:  Padding(
                                              padding: const EdgeInsets.only(left: 5),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(color: Colors.grey,width: .2)
                                                    ),
                                                    child: Center(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(2.0),
                                                        child: Icon(Icons.inventory_outlined,color: Colors.black,size: 20.h,),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5.w,),
                                                  Expanded(child: Text('${Translation.of(context)!.translate('designation')}',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w400),))
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 1.w,
                                            height: 50.h,
                                            color: Colors.grey,
                                          ),

                                          SizedBox(
                                            height: 50.h,
                                            width: 230.w,
                                            //color: Colors.red,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 5),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Expanded(child: Text('${instance.designation}',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w400)))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(color: Colors.grey,height: 1,thickness: .5.h,),


                                    //Emgnc phone
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 50.h,
                                            width: 230.w,
                                            //color: Colors.red,
                                            child:  Padding(
                                              padding: const EdgeInsets.only(left: 5),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(color: Colors.grey,width: .2)
                                                    ),
                                                    child: Center(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(2.0),
                                                        child: Icon(Icons.work_history_outlined,color: Colors.black,size: 20.h,),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5.w,),
                                                  Expanded(child: Text('${Translation.of(context)!.translate('emp_type')}',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w400),))
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 1.w,
                                            height: 50.h,
                                            color: Colors.grey,
                                          ),

                                          SizedBox(
                                            height: 50.h,
                                            width: 230.w,
                                            //color: Colors.red,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 5),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Expanded(child: Text('${instance.empType}',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w400)))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(color: Colors.grey,height: 1,thickness: .5.h,),

                                    //address
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 50.h,
                                            width: 230.w,
                                            //color: Colors.red,
                                            child:  Padding(
                                              padding: const EdgeInsets.only(left: 5),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(color: Colors.grey,width: .2)
                                                    ),
                                                    child: Center(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(2.0),
                                                        child: Icon(Icons.security_outlined,color: Colors.black,size: 20.h,),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5.w,),
                                                  Expanded(child: Text('${Translation.of(context)!.translate('authority')}',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w400),))
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 1.w,
                                            height: 50.h,
                                            color: Colors.grey,
                                          ),

                                          SizedBox(
                                            height: 50.h,
                                            width: 230.w,
                                            //color: Colors.red,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 5),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Expanded(child: Text('${instance.authority}',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w400)))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(color: Colors.grey,height: 1,thickness: .5.h,),


                                    //bank details
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 50.h,
                                            width: 230.w,
                                            //color: Colors.red,
                                            child:  Padding(
                                              padding: const EdgeInsets.only(left: 5),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(color: Colors.grey,width: .2)
                                                    ),
                                                    child: Center(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(2.0),
                                                        child: Icon(Icons.food_bank_outlined,color: Colors.black,size: 20.h,),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5.w,),
                                                  Expanded(child: Text('${Translation.of(context)!.translate('bank_details')}',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w400),))
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 1.w,
                                            height: 50.h,
                                            color: Colors.grey,
                                          ),

                                          SizedBox(
                                            height: 50.h,
                                            width: 230.w,
                                            //color: Colors.red,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 5),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Expanded(child: Text('${instance.bankDetails}',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w400)))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(color: Colors.grey,height: 1,thickness: .5.h,),


                                    //job role
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 50.h,
                                            width: 230.w,
                                            //color: Colors.red,
                                            child:  Padding(
                                              padding: const EdgeInsets.only(left: 5),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(color: Colors.grey,width: .2)
                                                    ),
                                                    child: Center(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(2.0),
                                                        child: Icon(Icons.work_outline,color: Colors.black,size: 20.h,),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5.w,),
                                                  Expanded(child: Text('${Translation.of(context)!.translate('job_role')}',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w400),))
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 1.w,
                                            height: 50.h,
                                            color: Colors.grey,
                                          ),

                                          SizedBox(
                                            height: 50.h,
                                            width: 230.w,
                                            //color: Colors.red,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 5),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Expanded(child: Text('',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w400)))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //Divider(color: Colors.grey,height: 1,thickness: .5.h,),



                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: -150.h,
                        child: Container(
                          height: 191.h,
                          width: 191.h,
                          decoration: const BoxDecoration(
                              color: appcolor1,
                              shape: BoxShape.circle
                          ),
                          child: Center(
                            child: Container(
                              height: 180.h,
                              width: 180.h,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,color: Colors.white
                              ),
                                child: instance.empImage=='' || instance.empImage==null?Icon(Icons.person,color: Colors.grey,size: 170.h,)
                                    : Center(child: ClipRect(
                                      child: ClipRRect( 
                                          borderRadius: BorderRadius.circular(50.r),
                                      child: Image(image: NetworkImage('$imagePath${instance.empImage}'))),
                                    ))
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
