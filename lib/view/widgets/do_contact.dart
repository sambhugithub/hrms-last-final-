import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/localizations/app_localizations.dart';
import 'package:hrms/view/widgets/toast_msg.dart';
import 'package:url_launcher/url_launcher.dart';

class DoContact{


  whatsappMsg(BuildContext context,String whatsappNumber)async{
    String url = "whatsapp://send?phone=${whatsappNumber}" +
        "&text=${Uri.encodeComponent('Happy Birthday')}";
    if (await canLaunch(url)) {
    await launch(url);
    } else {
    // If WhatsApp is not installed, show an error message or handle accordingly
    ToastMsg().showToast('${Translation.of(context)!.translate('whatsapp_not_installed')}', Colors.red);
    }
  }

  phoneCall(){

  }

  email(){

  }
}