import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/localizations/app_localizations.dart';
import 'package:hrms/model/employee/payslip/payslip_model.dart';
import 'package:hrms/view/widgets/download_file.dart';
import 'package:path_provider/path_provider.dart';

import '../../../widgets/appbar.dart';
import '../../../widgets/appbar_actions.dart';
import '../../../widgets/asset_image_fetch.dart';


class PayslipDetails extends StatefulWidget {
  final Data payslipDetails;
  const PayslipDetails({
    required this.payslipDetails,
    super.key});

  @override
  State<PayslipDetails> createState() => _PayslipDetailsState();
}

class _PayslipDetailsState extends State<PayslipDetails> {
  
  getRow(String title,String amount,bool heighlight){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: TextStyle(fontSize:heighlight?17:14,fontWeight: heighlight?FontWeight.w500:FontWeight.w400),),
          Text(amount,style: TextStyle(fontSize:heighlight?18:16,fontWeight: heighlight?FontWeight.w500:FontWeight.w400),),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appscaffoldcolor1,
      appBar: AppBars(
        leading: BackButton(
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image(image: AssetImage(const AssetImages(imgName: 'appbar_leading').getAssetImagePath()),fit: BoxFit.contain,height: 120,width: 120,),
        ),
        centerTitle: false,
        actions: [
          AppbarActions().notification()
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Align(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 519.w,
                  //height: 728.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Card(
                      color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: Column(
                        children: [
                          Text(Translation.of(context)!.translate('payslip')!.toUpperCase(),style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.w500),),
                          Text('${Translation.of(context)!.translate('paymentslip_for_the_month_of')!.toUpperCase()} Dec 2023',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500),),

                         //earning section
                          Container(
                            width: 464.w,
                            //height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Card(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 50.h,
                                      width: 464.w,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                                        color: appcolor1
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(Translation.of(context)!.translate('earnings')!.toUpperCase(),style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w500,color: Colors.white),),
                                              Text(Translation.of(context)!.translate('amount')!.toUpperCase(),style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w500,color: Colors.white),),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    getRow('Basic Pay', '${widget.payslipDetails.empBasicPay}.00', false),
                                    const Divider(color: Colors.grey,thickness: .2,height: 5,),

                                    getRow('HRA', '${widget.payslipDetails.empHra}.00', false),
                                    const Divider(color: Colors.grey,thickness: .2,height: 5,),

                                    getRow('TIFF ALW.', '${widget.payslipDetails.empTiffAlw}.00', false),
                                    const Divider(color: Colors.grey,thickness: .2,height: 5,),

                                    getRow('OTH ALW.', '${widget.payslipDetails.empOthersAlw}.00', false),
                                    const Divider(color: Colors.grey,thickness: .2,height: 5,),

                                    getRow('MISC ALW.', '${widget.payslipDetails.empMiscAlw}.00', false),
                                    const Divider(color: Colors.grey,thickness: .2,height: 5,),

                                    getRow('MEDICAL', '${widget.payslipDetails.empMedical}.00', false),
                                    const Divider(color: Colors.grey,thickness: .2,height: 5,),

                                    getRow('Convey ALW.', '${widget.payslipDetails.empConv}.00', false),
                                    const Divider(color: Colors.grey,thickness: .2,height: 5,),

                                    getRow('Over Time', '${widget.payslipDetails.empOverTime}.00', false),
                                    const Divider(color: Colors.grey,thickness: .2,height: 5,),

                                    getRow('Bonus', '${widget.payslipDetails.empBouns}.00', false),
                                    const Divider(color: Colors.grey,thickness: .2,height: 5,),

                                    getRow('Leave ENC', '${widget.payslipDetails.empLeaveInc}.00', false),
                                    const Divider(color: Colors.grey,thickness: .2,height: 5,),

                                    getRow('Actual Gross Salary', '${widget.payslipDetails.empGrossSalary}.00', true),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          //deduction section
                          Container(
                            width: 464.w,
                            //height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Card(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 50.h,
                                      width: 464.w,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                                          color: appcolor1
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(Translation.of(context)!.translate('deductions')!.toUpperCase(),style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w500,color: Colors.white),),
                                              Text(Translation.of(context)!.translate('amount')!.toUpperCase(),style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w500,color: Colors.white),),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    getRow('PROF TAX', '${widget.payslipDetails.empProfTax}.00', false),
                                    const Divider(color: Colors.grey,thickness: .2,height: 5,),

                                    getRow('PF', '${widget.payslipDetails.empPf}.00', false),
                                    const Divider(color: Colors.grey,thickness: .2,height: 5,),

                                    getRow('PF INT', '${widget.payslipDetails.empPfInt}.00', false),
                                    const Divider(color: Colors.grey,thickness: .2,height: 5,),

                                    getRow('APF', '${widget.payslipDetails.empApf}.00', false),
                                    const Divider(color: Colors.grey,thickness: .2,height: 5,),

                                    getRow('I TAX', '${widget.payslipDetails.empITax}.00', false),
                                    const Divider(color: Colors.grey,thickness: .2,height: 5,),

                                    getRow('INSU PERM', '${widget.payslipDetails.empInsuPrem}.00', false),
                                    const Divider(color: Colors.grey,thickness: .2,height: 5,),

                                    getRow('PF LOAN', '${widget.payslipDetails.empPfLoan}.00', false),
                                    const Divider(color: Colors.grey,thickness: .2,height: 5,),

                                    getRow('ESI', '${widget.payslipDetails.empEsi}.00', false),
                                    const Divider(color: Colors.grey,thickness: .2,height: 5,),

                                    getRow('ADV', '${widget.payslipDetails.empAdv}.00', false),
                                    const Divider(color: Colors.grey,thickness: .2,height: 5,),

                                    getRow('HRD', '${widget.payslipDetails.empHrd}.00', false),
                                    const Divider(color: Colors.grey,thickness: .2,height: 5,),

                                    getRow('CO-OP', '${widget.payslipDetails.empCoOp}.00', false),
                                    const Divider(color: Colors.grey,thickness: .2,height: 5,),

                                    getRow('Furniture', '${widget.payslipDetails.empFurniture}.00', false),
                                    const Divider(color: Colors.grey,thickness: .2,height: 5,),

                                    getRow('MISE DED', '${widget.payslipDetails.empMiscDed}.00', false),
                                    const Divider(color: Colors.grey,thickness: .2,height: 5,),

                                    getRow('Total Deduction', '${widget.payslipDetails.empTotalDeduction}.00', true),
                                    getRow('Net Pay', '${widget.payslipDetails.empNetSalary}', true),

                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h,),


                          //download button
                          InkWell(
                            onTap: ()async{
                              var dir = Platform.isAndroid
                                  ? '/storage/emulated/0/Download'
                                  : (await getApplicationDocumentsDirectory()).path;
                              DownloadFile().downloadFile('https://images.pexels.com/photos/1042423/pexels-photo-1042423.jpeg?cs=srgb&dl=pexels-hoang-le-1042423.jpg&fm=jpg', 'abc', dir);

                            },
                            child: Container(
                              height: 68.h,
                              width: 464.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.r),
                                color: appcolor2
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.download_sharp,color: Colors.white,size: 28.h,),
                                    Text('${Translation.of(context)!.translate('download')}',style: TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.w400),)
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    ),
                  ),
                )
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
