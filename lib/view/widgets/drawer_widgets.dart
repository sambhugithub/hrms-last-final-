import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/provider/attendance/attendance_provider.dart';
import 'package:hrms/view/dashboard/attendance/attendance.dart';
import 'package:hrms/view/screens/employee_modules/attendance/dashboard/dashboard.dart';
import 'package:hrms/view/screens/employee_modules/attendance/dashboard/widgets/Attendance_dashboard.dart';
import 'package:hrms/view/screens/employee_modules/attendance/dashboard/widgets/attendance_report.dart';

class DrawerWidgets{


  drawerHeader(){
    return DrawerHeader(
      padding: EdgeInsets.zero,
      child: Container(
        height: 200.h,
        color: Colors.grey.shade200,
        child:  Center(
          child: Container(),
          /*Image(
            image: AssetImage("images/shorbazar_logo.png"),
            filterQuality: FilterQuality.high,
            fit: BoxFit.contain,
          ),*/
        ),
      ),
    );
  }


  drawerEmployeeAttendanceDashBoard(cntxt,GestureTapCallback onTap){
    return ListTile(
      onTap: onTap,
      title: const Text('Dashboard'),
    );
  }


  drawerEmployeeAttendanceReport(cntxt,GestureTapCallback onTap){
    return ListTile(
      onTap: onTap,
      title: const Text('Attendance Report'),
    );
  }

  drawerEmployeeLeaveApplicationDashBoard(cntxt,GestureTapCallback onTap){
    return ListTile(
      onTap: onTap,
      title: const Text('Dashboard'),
    );
  }

  drawerEmployeeNewLeaveApplication(cntxt,GestureTapCallback onTap){
    return ListTile(
      onTap: onTap,
      title: const Text('Leave Application'),
    );
  }

  drawerEmployeeHolidayListView(cntxt,GestureTapCallback onTap){
    return ListTile(
      onTap: onTap,
      title: const Text('List View'),
    );
  }

  drawerEmployeeHolidayCalenderView(cntxt,GestureTapCallback onTap){
    return ListTile(
      onTap: onTap,
      title: const Text('Calender View'),
    );
  }

  drawerEmployeePersonalProfileDetails(cntxt,GestureTapCallback onTap){
    return ListTile(
      onTap: onTap,
      title: const Text('Personal Details'),
    );
  }


  drawerEmployeeProfesionalProfileDetails(cntxt,GestureTapCallback onTap){
    return ListTile(
      onTap: onTap,
      title: const Text('Profesional Details'),
    );
  }


  drawerEmployeeLogOut(cntxt,GestureTapCallback onTap){
    return ListTile(
      onTap: onTap,
      title: const Text('Log Out'),
    );
  }


  drawerEmployeeTaskDashboard(cntxt,GestureTapCallback onTap){
    return ListTile(
      onTap: onTap,
      title: const Text('Dashboard'),
    );
  }

  drawerEmployeeTaskProjectList(cntxt,GestureTapCallback onTap){
    return ListTile(
      onTap: onTap,
      title: const Text('Project List'),
    );
  }


  drawerEmployeeTaskTaskList(cntxt,GestureTapCallback onTap){
    return ListTile(
      onTap: onTap,
      title: const Text('Task List'),
    );
  }

  
  drawerOrganizationShiftManagement(cntxt,GestureTapCallback onTap){
    return ListTile(
      onTap: onTap,
      title: const Text('Shift Management'),
    );
  }

  drawerOrganizationLatePolicy(cntxt,GestureTapCallback onTap){
    return ListTile(
      onTap: onTap,
      title: const Text('Late Policy'),
    );
  }

  drawerOrganizationDayOff(cntxt,GestureTapCallback onTap){
    return ListTile(
      onTap: onTap,
      title: const Text('Day Off'),
    );
  }

  drawerOrganizationGracePeriod(cntxt,GestureTapCallback onTap){
    return ListTile(
      onTap: onTap,
      title: const Text('Grace Period'),
    );
  }
}
