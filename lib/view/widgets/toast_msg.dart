import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ToastMsg{


  showToast(String msg,Color textColor){
    return Fluttertoast.showToast(
        msg: msg,
        textColor: textColor,
        backgroundColor: Colors.grey.shade200,
        fontSize: 12.0
    );
  }
}
