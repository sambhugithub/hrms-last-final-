import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/view/dashboard/dashboard.dart';
import 'package:hrms/view/dashboard/home/home.dart';
import 'package:hrms/view/dashboard/payslip/widgets/payslip_details.dart';
import 'package:hrms/view/screens/clockin_clockout/clockin_clockout.dart';
import 'package:hrms/view/screens/employee_modules/announcement/announcement.dart';
import 'package:hrms/view/screens/employee_modules/announcement/widgets/announcement_details.dart';
import 'package:hrms/view/screens/employee_modules/attendance/dashboard/dashboard.dart';
import 'package:hrms/view/screens/employee_modules/attendance/dashboard/widgets/Attendance_dashboard.dart';
import 'package:hrms/view/screens/employee_modules/holiday/dashboard.dart';
import 'package:hrms/view/screens/employee_modules/leave_application/dashboard/dashboard.dart';
import 'package:hrms/view/screens/employee_modules/notification/notifications.dart';
import 'package:hrms/view/screens/employee_modules/notification/widgets/notification_details.dart';
import 'package:hrms/view/screens/employee_modules/payslip/dashboard.dart';
import 'package:hrms/view/screens/employee_modules/profile/profile.dart';
import 'package:hrms/view/screens/employee_modules/tasks/task_module.dart';

import 'package:hrms/view/screens/employer_modules/employee_module/employee_module.dart';
import 'package:hrms/view/screens/employer_modules/leave_approver_module/leave_approver.dart';
import 'package:hrms/view/splashScreen/splash_screen.dart';


import 'package:hrms/view/screens/employer_modules/attendance/attendance.dart';
import 'package:hrms/view/screens/employer_modules/employee_module/employee_module.dart';
import 'package:hrms/view/screens/employer_modules/leave_approver_module/leave_approver.dart';
import 'package:hrms/view/screens/employer_modules/meeting/organization_meeting.dart';
import 'package:hrms/view/screens/employer_modules/organization_profile/organization_profile.dart';
import 'package:hrms/view/screens/employer_modules/performance_management/performance_management.dart';
import 'package:hrms/view/screens/employer_modules/recruitment/recruitment.dart';
import 'package:hrms/view/screens/employer_modules/rota/rota_dashboard.dart';
import 'package:hrms/view/screens/employer_modules/task_management/task_management.dart';
import 'package:hrms/view/screens/employer_modules/task_management/widgets/task_list.dart';
import 'package:hrms/view/splashScreen/splash_screen.dart';

import '../model/employer/task/organization_task_model.dart';




class Routes{

  static navigateToDashboard(BuildContext context) {
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(
        builder: (context) => const DashBoard(),
      ),
    );
  }

  static navigateToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(
        builder: (context) => const Home(),
      ),
    );
  }

  static navigateToClockinClockout(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => const ClockinClockout(),
        ),
      );
    }
    );
  }

  static navigateToEmployeeAttendanceModuleDashboard(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) =>  const Dashboard(body: AttendanceDashboard(),),
        ),
      );
    }
    );
  }

  static navigateToEmployeeLeaveApplicationModuleDashboard(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => const LeaveApplicationDashBoard()
        ),
      );
    }
    );
  }


  static navigateToMainDashBoardAgain(BuildContext context) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const DashBoard()),ModalRoute.withName('/'));
  }
  );
  }


  static navigateToPayslipDetails(BuildContext context,data) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => PayslipDetails(payslipDetails: data,)
        ),
      );
    }
    );
  }

  static navigateToHolidayDashboard(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => const HolidayDashboard()
        ),
      );
    }
    );
  }


  static navigateToEmployeeProfile(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => const Profile()
        ),
      );
    }
    );
  }

  static navigateToEmployeeNotifications(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => const Notifications()
        ),
      );
    }
    );
  }

  static navigateToEmployeeAnnouncement(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => const Announcements()
        ),
      );
    }
    );
  }


  static navigateToEmployeeNotificationDetails(BuildContext context,String title,String description) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => NotificationDetails(title,description)
        ),
      );
    }
    );
  }

  static navigateToEmployeeAnnouncementDetails(BuildContext context,String title,String description,String img) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) =>  AnnouncementDetails(title, description,img)
        ),
      );
    }
    );
  }


  static navigateToEmployeePayslip(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) =>  const PayslipDashboard()
        ),
      );
    }
    );
  }

  static navigateToEmployeeTaskModule(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) =>  const TaskModule()
        ),
      );
    }
    );
  }


  static navigateToEmployerEmployeeModule(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) =>  const EmployeeModule()
        ),
      );
    }
    );
  }


  static navigateToEmployerLeaveApprover(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) =>  const LeaveApprover()
        ),
      );
    }
    );
  }



  static navigateToEmployerAttendance(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) =>  const OrganizationAttendance()
        ),
      );
    }
    );
  }


  static navigateToEmployerRecruitment(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) =>  const Recruitment()
        ),
      );
    }
    );
  }


  static navigateToEmployerOrganizationProfile(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) =>  const OrganizationProfile()
        ),
      );
    }
    );
  }


  static navigateToEmployerRotaDashboard(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) =>  const RotaDashboard()
        ),
      );
    }
    );
  }


  static navigateToEmployerTaskManagement(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) =>  const OrganizationTaskManagement()
        ),
      );
    }
    );
  }


  static navigateToEmployerTaskList(BuildContext context,List<TaskList> tasks) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) =>   OrganizationTaskiList(taskData: tasks,)
        ),
      );
    }
    );
  }

  static navigateToEmployerPerformanceManagement(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) =>  const PerformanceManagement()
        ),
      );
    }
    );
  }


  static navigateToEmployerMeeting(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) =>  const OrganizationMeeting()
        ),
      );
    }
    );
  }

}