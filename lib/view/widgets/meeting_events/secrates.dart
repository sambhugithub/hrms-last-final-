import 'dart:io' show Platform;

class Secret {
  static const ANDROID_CLIENT_ID = "647665445210-asduv8g97tgp3c5a9apokt11n8hg1aqt.apps.googleusercontent.com";
  static const IOS_CLIENT_ID = "<enter your iOS client secret>";
  static String getId() => Platform.isAndroid ? Secret.ANDROID_CLIENT_ID : Secret.IOS_CLIENT_ID;
}