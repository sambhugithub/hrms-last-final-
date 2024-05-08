import 'package:flutter/material.dart';
import 'package:hrms/helper/color.dart';


class AppBars extends StatelessWidget implements PreferredSizeWidget{
  final Widget? leading;
  final double? leadingWidth;
  final List<Widget>? actions;
  final Color? appbarColor;
  final bool? autoImplyLeading;
  final Widget? title;
  final bool? centerTitle;
  const AppBars({
    this.leading,
    this.leadingWidth,
    this.actions,
    this.appbarColor,
    this.autoImplyLeading,
    this.title,
    this.centerTitle,
    super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: autoImplyLeading==null? false:true,
      backgroundColor: appbarColor ?? appcolor1,
      leading: leading,
      leadingWidth: leadingWidth,
      actions: actions,
      title: title,
      centerTitle: centerTitle,
      titleSpacing: 1,

    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}
