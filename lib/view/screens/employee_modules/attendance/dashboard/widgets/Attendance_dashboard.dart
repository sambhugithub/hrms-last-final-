import 'package:flutter/material.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/provider/attendance/attendance_provider.dart';
import 'package:hrms/view/dashboard/home/widgets/home_profile_section.dart';
import 'package:hrms/view/screens/employee_modules/attendance/dashboard/widgets/attendance_graph.dart';
import 'package:hrms/view/widgets/loader.dart';
import 'package:provider/provider.dart';



class AttendanceDashboard extends StatefulWidget {
  const AttendanceDashboard({super.key});

  @override
  State<AttendanceDashboard> createState() => _AttendanceDashboardState();
}

class _AttendanceDashboardState extends State<AttendanceDashboard> {

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HomeProfileSection(),
        SizedBox(height: 10,),
        AttendanceGraph()
      ],
    );
  }
}
