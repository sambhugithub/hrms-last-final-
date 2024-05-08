import 'package:flutter/material.dart';



class NotificationDetails extends StatefulWidget {
  final String title;
  final String description;
  const NotificationDetails(
      @required this.title,
      @required this.description,
      {super.key});

  @override
  State<NotificationDetails> createState() => _NotificationDetailsState();
}

class _NotificationDetailsState extends State<NotificationDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
