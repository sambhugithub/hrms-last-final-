import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';


class LoginTextField extends StatefulWidget {
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  final IconData? preIcon;
  final IconData? postIcon;
  final IconButton? postIconButton;
  final bool? passwordVisible;
  final bool? posIcon;
  final String hintText;


  const LoginTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.postIcon,
    this.preIcon,
    this.postIconButton,
    this.passwordVisible,
    this.posIcon,
    this.validator,
  }): super(key: key);


  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  bool passwordVisible=true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500.w,
      child: TextFormField(
        cursorColor: Colors.white,
        obscureText: widget.posIcon==true?passwordVisible:false,
        controller: widget.controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIconColor: Colors.white,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Icon(widget.preIcon),
          ),
          suffixIcon: widget.posIcon==true?Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(backgroundColor: Colors.white,child: Padding(
              padding:const EdgeInsets.all(0),
              child: IconButton(
                icon: Icon( passwordVisible?Icons.visibility_outlined:Icons.visibility_off_outlined,color: Colors.black,),
                onPressed: (){
                  setState(() {
                    passwordVisible=!passwordVisible;
                  });
                },
              ),
            ),),
          ):const SizedBox(),
          hintText: widget.hintText,
          hintStyle:  const TextStyle(color: Colors.white),
          filled: true,
          fillColor: textFormFieldColor1,
          //contentPadding: const EdgeInsets.all(30),
            enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
        validator:widget.validator
      ),
    );
  }
}
