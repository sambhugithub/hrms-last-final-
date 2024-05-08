import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/localizations/app_localizations.dart';
import 'package:hrms/model/employee/employee_details_model.dart';
import 'package:hrms/provider/auth/auth_provider.dart';
import 'package:hrms/view/auth/login/widgets/login_button.dart';
import 'package:hrms/view/auth/login/widgets/text_form_field.dart';
import 'package:hrms/view/widgets/loader.dart';
import 'package:hrms/view/widgets/toast_msg.dart';
import 'package:provider/provider.dart';

import '../../../helper/routes.dart';


class LogIn extends StatelessWidget {
   LogIn({super.key});

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  static TextEditingController emailOrPhone=TextEditingController();
  static TextEditingController password = TextEditingController();
  bool passwordVisible=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolor1,
      body: Consumer<AuthProvider>(
        builder: (_,AuthProviderInstance,child){
          return ConnectivityWidgetWrapper(
            disableInteraction: true,
            child: Stack(
              children: [
                SafeArea(
                  child: Align(
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: MediaQuery.of(context).size.height*.12,
                                width: MediaQuery.of(context).size.width*.55,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)
                                ),
                                child: Center(
                                  child: Image(
                                    image: const AssetImage('assets/images/appbar_leading.png'),
                                    height: MediaQuery.of(context).size.height*.1,
                                    width: MediaQuery.of(context).size.width*.5,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(Translation.of(context)!.translate('sign_in')!,style: TextStyle(color: Colors.black,fontSize: 30.sp),),
                            ),
                            const SizedBox(height: 10,),

                            LoginTextField(
                              controller: emailOrPhone,
                              preIcon: Icons.person_2_outlined,
                              hintText: Translation.of(context)!.translate('email_id_or_phone_number')!,
                              validator: (str){
                                if(str!.isEmpty) {
                                  return Translation.of(context)!.translate('please_put_your_email_or_phone')!;
                                }
                                null;
                              },
                            ),
                            const SizedBox(height: 15,),
                            LoginTextField(
                              controller: password,
                              preIcon: Icons.lock_open,
                              posIcon: true,
                              hintText: Translation.of(context)!.translate('password')!,
                              validator: (str){
                                if(str!.isEmpty) {
                                  return Translation.of(context)!.translate('please_put_your_password')!;
                                }
                              },
                            ),
                            const SizedBox(height: 30,),
                            LoginButton(
                              onTap: (){
                                FocusScopeNode currentFocus = FocusScope.of(context);
                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                                if(_formKey.currentState!.validate()){
                                  context.read<AuthProvider>().setEmail(emailOrPhone.text);
                                  context.read<AuthProvider>().setPassword(password.text);
                                  context.read<AuthProvider>().setDeviceToken('');
                                  context.read<AuthProvider>().getLoginData(context);
                                  

                                  //Routes.navigateToDashboard(context);
                                }
                                null;
                              },
                            ),
                            SizedBox(height: 50.h,),
                            SizedBox(
                              height: MediaQuery.of(context).size.height*.4,
                              width: MediaQuery.of(context).size.width,
                              child: const Center(
                                child: Image(
                                  image: AssetImage("assets/images/splash_img.png"),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                context.read<AuthProvider>().isLoading?Loader():const SizedBox()
              ],
            ),
          );
        },
      )
    );
  }
}
