import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/helper/routes.dart';
import 'package:hrms/localizations/app_localizations.dart';
import 'package:hrms/provider/payslip/payslip_provider.dart';
import 'package:hrms/view/widgets/loader.dart';
import 'package:provider/provider.dart';

import '../../widgets/appbar.dart';
import '../../widgets/appbar_actions.dart';
import '../../widgets/asset_image_fetch.dart';



class Payslip extends StatefulWidget {
  const Payslip({super.key});

  @override
  State<Payslip> createState() => _PayslipState();
}

class _PayslipState extends State<Payslip> {

  apiCall()async{
    await context.read<PayslipProvider>().getEmployeePayslipList(context);
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
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image(image: AssetImage(const AssetImages(imgName: 'appbar_leading').getAssetImagePath()),fit: BoxFit.contain,),
        ),
        leadingWidth: MediaQuery.of(context).size.width*.35,
        actions: [
          AppbarActions().notification()
        ],
      ),
      body: Consumer<PayslipProvider>(
        builder: (_,instance,child){
          return instance.isLoading?Loader(containerColor: appscaffoldcolor1,):SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Column(
                  children: [
                    //header
                    Container(
                      height: 50.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: appcolor1
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.calendar_month_outlined,color: Colors.white,size: 25.h,),
                            SizedBox(width: 10.w,),
                            Text('${Translation.of(context)!.translate('payslip')!.toUpperCase()} ${instance.currentYear}',style: TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.w500),)
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: instance.payslipList?.data==null || instance.payslipList!.data!.isEmpty?
                          Center(
                            child: Text('${Translation.of(context)!.translate('no_data')}'),
                          )
                      :
                      ListView.builder(
                        itemCount: instance.payslipList?.data!.length,
                        itemBuilder: (context,index){
                          return InkWell(
                            onTap: (){
                              Routes.navigateToPayslipDetails(context,instance.payslipList?.data![index]);
                            },
                            child: Container(
                              height: 80.h,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.transparent
                              ),
                              child: Card(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.calendar_month_outlined,color: Colors.black,size: 20.h,),
                                          SizedBox(width: 5.w,),
                                          Text(instance.payslipList!.data![index].monthYr.toString(),style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.sp),)
                                        ],
                                      ),

                                      //download button
                                      Container(
                                        height: 45.h,
                                        width: 45.w,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: appcolor2
                                        ),
                                        child: Center(
                                          child: IconButton(
                                            onPressed: (){

                                            },
                                            icon: Icon(Icons.download_sharp,color: Colors.white,size: 20.h,),
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
                      ),
                    )
                  ],
                )
            ),
          );
        },
      )

    );
  }
}
