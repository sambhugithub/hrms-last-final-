import 'package:flutter/material.dart';


class AppDrawer extends StatelessWidget {
  final List<Widget> widgetList;
  const AppDrawer({
    required this.widgetList,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: widgetList,
      ),
    );
  }
}
