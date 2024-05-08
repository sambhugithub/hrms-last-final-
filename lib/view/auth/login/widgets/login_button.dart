import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/helper/routes.dart';

import '../../../../localizations/app_localizations.dart';


class LoginButton extends StatefulWidget {

  final GestureTapCallback onTap;

  const LoginButton({
    Key? key,
    required this.onTap,

}): super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500.w,
      height: 80.h,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
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

          onPressed:widget.onTap,
          child:  Text(Translation.of(context)!.translate('sign_in')!,style: TextStyle(fontSize: 25.sp,color: Colors.white),)
      ),
    );
  }
}
