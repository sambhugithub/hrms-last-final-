import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/helper/const.dart';
import 'package:hrms/localizations/app_localizations.dart';
import 'package:hrms/provider/profile/profile_provider.dart';
import 'package:hrms/view/widgets/asset_image_fetch.dart';
import 'package:provider/provider.dart';



class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {

  setProviderValues()async{
    await context.read<ProfileProvider>().setEmpName();
    await context.read<ProfileProvider>().setDob();
    await context.read<ProfileProvider>().setEmail();
    await context.read<ProfileProvider>().setPhone();
    await context.read<ProfileProvider>().setEmrPhone();
    await context.read<ProfileProvider>().setAddress();
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
        print('image of employee: ${instance.empImage}');
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
                            Text('${Translation.of(context)!.translate('employee_personal_details')}',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20.sp),),
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
                                                        child: Icon(Icons.person_2_outlined,color: Colors.black,size: 20.h,),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5.w,),
                                                  Text('${Translation.of(context)!.translate('name')}',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w400))
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
                                                  Expanded(child: Text('${instance.empName}',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w400)))
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
                                                        child: Icon(Icons.date_range_outlined,color: Colors.black,size: 20.h,),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5.w,),
                                                  Text('${Translation.of(context)!.translate('dob')}',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w400))
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
                                                  Expanded(child: Text('${instance.dob}',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w400)))
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
                                                        child: Icon(Icons.email_outlined,color: Colors.black,size: 20.h,),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5.w,),
                                                  Expanded(child: Text('${Translation.of(context)!.translate('email')}',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w400),))
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
                                                  Expanded(child: Text('${instance.email}',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w400)))
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
                                                        child: Icon(Icons.call_end_outlined,color: Colors.black,size: 20.h,),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5.w,),
                                                  Expanded(child: Text('${Translation.of(context)!.translate('phone')}',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w400),))
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
                                                  Expanded(child: Text('${instance.phone}',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w400)))
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
                                                        child: Icon(Icons.email_outlined,color: Colors.black,size: 20.h,),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5.w,),
                                                  Expanded(child: Text('${Translation.of(context)!.translate('emr_phone')}',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w400),))
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
                                                  Expanded(child: Text('${instance.emrPhone}',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w400)))
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
                                                        child: Icon(Icons.location_on_outlined,color: Colors.black,size: 20.h,),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5.w,),
                                                  Expanded(child: Text('${Translation.of(context)!.translate('address')}',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w400),))
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
                                                  Expanded(child: Text('${instance.address}',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w400)))
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
                                  : Center(
                                    child: ClipRect(
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(50.r),
                                      child: Image(image: NetworkImage('$imagePath${instance.empImage}'))),
                                    ),
                                  )
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
