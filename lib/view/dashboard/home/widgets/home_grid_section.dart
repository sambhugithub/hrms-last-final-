import 'package:flutter/material.dart';
import 'package:hrms/helper/routes.dart';
import 'package:hrms/localizations/app_localizations.dart';
import 'package:hrms/provider/user_management/user_provider.dart';
import 'package:hrms/view/dashboard/home/widgets/single_grid_item.dart';
import 'package:hrms/view/widgets/asset_image_fetch.dart';
import 'package:provider/provider.dart';


class HomeGridSection extends StatelessWidget {
  const HomeGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
        child:GridView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              //crossAxisSpacing:2,
              //mainAxisSpacing: 2,
              childAspectRatio: 2/1.8
          ),
          children: [


            //announcement
            context.watch<UserProvider>().employee?SingleGridItem(
              onPressed: (){
                Routes.navigateToEmployeeAnnouncement(context);
              },
              title: Translation.of(context)!.translate('announcement')!,
              assetImagePath: const AssetImages(imgName: 'main_dash_announcement').getAssetImagePath(), isBlur: false,
            ):
            SingleGridItem(
              onPressed: (){
                Routes.navigateToEmployerOrganizationProfile(context);
              },
              title: Translation.of(context)!.translate('organization_profile')!,
              assetImagePath: const AssetImages(imgName: 'main_dash_myprofile').getAssetImagePath(),

              isBlur: false,
            ),


            //notifications
            context.watch<UserProvider>().employee?SingleGridItem(
              onPressed: (){
                Routes.navigateToEmployeeNotifications(context);
              },
              title: Translation.of(context)!.translate('notifications')!,
              assetImagePath: const AssetImages(imgName: 'main_dash_notifications').getAssetImagePath(),

              isBlur: true,

            ):
            SingleGridItem(
              onPressed: (){
                Routes.navigateToHolidayDashboard(context);
              },
              title: Translation.of(context)!.translate('settings')!,
              assetImagePath: const AssetImages(imgName: 'main_dash_settings').getAssetImagePath(),

              isBlur: true,

            ),


            //attendance
            context.watch<UserProvider>().employee?SingleGridItem(
              onPressed: (){
                Routes.navigateToEmployeeAttendanceModuleDashboard(context);
              },
              title: Translation.of(context)!.translate('attendance')!,
              assetImagePath: const AssetImages(imgName: 'main_dash_attendance').getAssetImagePath(), isBlur: false,

            ):
            SingleGridItem(
              onPressed: (){
                Routes.navigateToEmployerRecruitment(context);
              },
              title: Translation.of(context)!.translate('recruitment')!,
              assetImagePath: const AssetImages(imgName: 'recruitment').getAssetImagePath(),

              isBlur: false,
            ),


            //tasks
            context.watch<UserProvider>().employee?SingleGridItem(
              onPressed: ()async{
                Routes.navigateToEmployeeTaskModule(context);
              },
              title: Translation.of(context)!.translate('tasks')!,
              assetImagePath: const AssetImages(imgName: 'main_dash_tasks').getAssetImagePath(),
              isBlur: false,
            ):
            SingleGridItem(
              onPressed: (){
                Routes.navigateToEmployerEmployeeModule(context);
              },
              title: Translation.of(context)!.translate('employee')!,
              assetImagePath: const AssetImages(imgName: 'employees').getAssetImagePath(),

              isBlur: false,

            ),



            //myprofile
            context.watch<UserProvider>().employee?SingleGridItem(
              onPressed: (){
                Routes.navigateToEmployeeProfile(context);
              },
              title: Translation.of(context)!.translate('my_profile')!,
              assetImagePath: const AssetImages(imgName: 'main_dash_myprofile').getAssetImagePath(),
              isBlur: false,

            ):
            SingleGridItem(
              onPressed: (){
                Routes.navigateToHolidayDashboard(context);
              },
              title: Translation.of(context)!.translate('user_access')!,
              assetImagePath: const AssetImages(imgName: 'user_access').getAssetImagePath(),
              isBlur: true,

            ),


            //settings
            context.watch<UserProvider>().employee?SingleGridItem(
              onPressed: (){},
              title: Translation.of(context)!.translate('settings')!,
              assetImagePath: const AssetImages(imgName: 'main_dash_settings').getAssetImagePath(),
              isBlur: true,

            ):
            SingleGridItem(
              onPressed: (){
                Routes.navigateToHolidayDashboard(context);
              },
              title: Translation.of(context)!.translate('holiday_management')!,
              assetImagePath: const AssetImages(imgName: 'main_dash_holidays').getAssetImagePath(),
              isBlur: false,

            ),



            //leave application
            context.watch<UserProvider>().employee?SingleGridItem(
              onPressed: (){
                Routes.navigateToEmployeeLeaveApplicationModuleDashboard(context);
              },
              title: Translation.of(context)!.translate('leave_application')!,
              assetImagePath: const AssetImages(imgName: 'main_dash_leave_application').getAssetImagePath(),
              isBlur: false,

            ):
            SingleGridItem(
              onPressed: (){
                Routes.navigateToHolidayDashboard(context);
              },
              title: Translation.of(context)!.translate('leave_management')!,
              assetImagePath: const AssetImages(imgName: 'main_dash_leave_application').getAssetImagePath(),
              isBlur: true,

            ),


            //my payslip
            context.watch<UserProvider>().employee?SingleGridItem(
              onPressed: (){
                Routes.navigateToEmployeePayslip(context);
              },
              title: Translation.of(context)!.translate('my_payslip')!,
              assetImagePath: const AssetImages(imgName: 'main_dash_my_payslip').getAssetImagePath(), isBlur: false,

            ):
            SingleGridItem(
              onPressed: (){
                Routes.navigateToEmployerRotaDashboard(context);
              },
              title: Translation.of(context)!.translate('rota')!,
              assetImagePath: const AssetImages(imgName: 'rota').getAssetImagePath(),

              isBlur: false,
            ),



            //holidays
            context.watch<UserProvider>().employee?SingleGridItem(
              onPressed: (){
                Routes.navigateToHolidayDashboard(context);
              },
              title: Translation.of(context)!.translate('holidays')!,
              assetImagePath: const AssetImages(imgName: 'main_dash_holidays').getAssetImagePath(), isBlur: false,

            ):
            SingleGridItem(
              onPressed: (){
                Routes.navigateToEmployerAttendance(context);
              },
              title: Translation.of(context)!.translate('attendance')!,
              assetImagePath: const AssetImages(imgName: 'main_dash_attendance').getAssetImagePath(),

              isBlur: false,
            ),


            //leave approver
            context.watch<UserProvider>().employee==false?
            SingleGridItem(
              onPressed: (){
                Routes.navigateToEmployerLeaveApprover(context);
              },
              title: Translation.of(context)!.translate('leave_approver')!,
              assetImagePath: const AssetImages(imgName: 'leave_approver').getAssetImagePath(),

              isBlur: false,

            ):Container(),

            //payroll
            context.watch<UserProvider>().employee==false?
            SingleGridItem(
              onPressed: (){
                Routes.navigateToHolidayDashboard(context);
              },
              title: Translation.of(context)!.translate('payroll')!,
              assetImagePath: const AssetImages(imgName: 'payroll').getAssetImagePath(),

              isBlur: true,

            ):Container(),


            //employee corner
            context.watch<UserProvider>().employee==false?
            SingleGridItem(
              onPressed: (){
                Routes.navigateToHolidayDashboard(context);
              },
              title: Translation.of(context)!.translate('employee_corner')!,
              assetImagePath: const AssetImages(imgName: 'employee_corner').getAssetImagePath(),


              isBlur: true,

            ):Container(),


            //task management
            context.watch<UserProvider>().employee==false?
            SingleGridItem(
              onPressed: (){

                Routes.navigateToEmployerTaskManagement(context);
              },
              title: Translation.of(context)!.translate('task_management')!,
              assetImagePath: const AssetImages(imgName: 'rota').getAssetImagePath(),
              isBlur: false,

            ):Container(),


            //performance management
            context.watch<UserProvider>().employee==false?
            SingleGridItem(
              onPressed: (){

                Routes.navigateToEmployerPerformanceManagement(context);
              },
              title: Translation.of(context)!.translate('performance_management')!,
              assetImagePath: const AssetImages(imgName: 'rota').getAssetImagePath(),
              isBlur: false,
            ):Container(),


            //meeting
            context.watch<UserProvider>().employee==false?
            SingleGridItem(
              onPressed: (){
                Routes.navigateToEmployerMeeting(context);
              },
              title: Translation.of(context)!.translate('meeting')!,
              assetImagePath: const AssetImages(imgName: 'meeting').getAssetImagePath(),
              isBlur: false,

            ):SingleGridItem(
              onPressed: (){
                Routes.navigateToEmployerMeeting(context);
              },
              title: Translation.of(context)!.translate('meeting')!,
              assetImagePath: const AssetImages(imgName: 'meeting').getAssetImagePath(),
              isBlur: false,

            )






          ],
        )
    );
    /*Expanded(
      flex: 1,
      child: Container(
        child: GridView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              //crossAxisSpacing:2,
              //mainAxisSpacing: 2,
              childAspectRatio: 2/1.8
          ),
          children: [
            //Events
*/ /*SingleGridItem(
              onPressed: (){},
              title: Translation.of(context)!.translate('events')!,
              assetImagePath: const AssetImages(imgName: 'main_dash_events').getAssetImagePath(),
            ),*/ /*


            //announcement
            context.watch<UserProvider>().employee?SingleGridItem(
              onPressed: (){
                Routes.navigateToEmployeeAnnouncement(context);
              },
              title: Translation.of(context)!.translate('announcement')!,
              assetImagePath: const AssetImages(imgName: 'main_dash_announcement').getAssetImagePath(),
        ):
            SingleGridItem(
              onPressed: (){
                Routes.navigateToHolidayDashboard(context);
              },
              title: Translation.of(context)!.translate('organization_profile')!,
              assetImagePath: const AssetImages(imgName: 'main_dash_myprofile').getAssetImagePath(),

              isBlur: false,
            ),

          //notifications
            context.watch<UserProvider>().employee?SingleGridItem(
              onPressed: (){
                Routes.navigateToEmployeeNotifications(context);
              },
              title: Translation.of(context)!.translate('notifications')!,
              assetImagePath: const AssetImages(imgName: 'main_dash_notifications').getAssetImagePath(),

              isBlur: true,

            ):
            SingleGridItem(
              onPressed: (){
                Routes.navigateToHolidayDashboard(context);
              },
              title: Translation.of(context)!.translate('settings')!,
              assetImagePath: const AssetImages(imgName: 'main_dash_settings').getAssetImagePath(),

              isBlur: true,

            ),



            //attendance
            context.watch<UserProvider>().employee?SingleGridItem(
              onPressed: (){
                Routes.navigateToEmployeeAttendanceModuleDashboard(context);
              },
              title: Translation.of(context)!.translate('attendance')!,
              assetImagePath: const AssetImages(imgName: 'main_dash_attendance').getAssetImagePath(),

            ):
            SingleGridItem(
              onPressed: (){
                Routes.navigateToHolidayDashboard(context);
              },
              title: Translation.of(context)!.translate('recruitment')!,
              assetImagePath: const AssetImages(imgName: 'recruitment').getAssetImagePath(),

              isBlur: false,
            )



            //tasks
            context.watch<UserProvider>().employee?SingleGridItem(
              onPressed: ()async{
                Routes.navigateToEmployeeTaskModule(context);
              },
              title: Translation.of(context)!.translate('tasks')!,
              assetImagePath: const AssetImages(imgName: 'main_dash_tasks').getAssetImagePath(),
              isBlur: false,
            ):
            SingleGridItem(
              onPressed: (){
                Routes.navigateToEmployerEmployeeModule(context);
              },
              title: Translation.of(context)!.translate('employee')!,
              assetImagePath: const AssetImages(imgName: 'employees').getAssetImagePath(),

              isBlur: false,

            ),



            //myprofile
            context.watch<UserProvider>().employee?SingleGridItem(
              onPressed: (){
                Routes.navigateToEmployeeProfile(context);
              },
              title: Translation.of(context)!.translate('my_profile')!,
              assetImagePath: const AssetImages(imgName: 'main_dash_myprofile').getAssetImagePath(),
              isBlur: false,

            ):
            SingleGridItem(
              onPressed: (){
                Routes.navigateToHolidayDashboard(context);
              },
              title: Translation.of(context)!.translate('user_access')!,
              assetImagePath: const AssetImages(imgName: 'user_access').getAssetImagePath(),
              isBlur: true,

            ),




            //settings
            context.watch<UserProvider>().employee?SingleGridItem(
              onPressed: (){},
              title: Translation.of(context)!.translate('settings')!,
              assetImagePath: const AssetImages(imgName: 'main_dash_settings').getAssetImagePath(),
              isBlur: true,

            ):
            SingleGridItem(
              onPressed: (){
                Routes.navigateToHolidayDashboard(context);
              },
              title: Translation.of(context)!.translate('holiday_management')!,
              assetImagePath: const AssetImages(imgName: 'main_dash_holidays').getAssetImagePath(),
              isBlur: false,

            ),



            //leave application
            context.watch<UserProvider>().employee?SingleGridItem(
              onPressed: (){
                Routes.navigateToEmployeeLeaveApplicationModuleDashboard(context);
              },
              title: Translation.of(context)!.translate('leave_application')!,
              assetImagePath: const AssetImages(imgName: 'main_dash_leave_application').getAssetImagePath(),
              isBlur: false,

            ):
            SingleGridItem(
              onPressed: (){
                Routes.navigateToHolidayDashboard(context);
              },
              title: Translation.of(context)!.translate('leave_management')!,
              assetImagePath: const AssetImages(imgName: 'main_dash_leave_application').getAssetImagePath(),
              isBlur: true,

            ),




            //my payslip
            context.watch<UserProvider>().employee?SingleGridItem(
              onPressed: (){
                Routes.navigateToEmployeePayslip(context);
              },
              title: Translation.of(context)!.translate('my_payslip')!,
              assetImagePath: const AssetImages(imgName: 'main_dash_my_payslip').getAssetImagePath(),

            ):
            SingleGridItem(
              onPressed: (){
                Routes.navigateToHolidayDashboard(context);
              },
              title: Translation.of(context)!.translate('rota')!,
              assetImagePath: const AssetImages(imgName: 'rota').getAssetImagePath(),

              isBlur: false,
            ),



            //holidays
            context.watch<UserProvider>().employee?SingleGridItem(
              onPressed: (){
                Routes.navigateToHolidayDashboard(context);
              },
              title: Translation.of(context)!.translate('holidays')!,
              assetImagePath: const AssetImages(imgName: 'main_dash_holidays').getAssetImagePath(),

            ):
            SingleGridItem(
              onPressed: (){
                Routes.navigateToHolidayDashboard(context);
              },
              title: Translation.of(context)!.translate('attendance')!,
              assetImagePath: const AssetImages(imgName: 'main_dash_attendance').getAssetImagePath(),

              isBlur: false,
            ),



            //organization modules


            //organisation profile


            //settings



            //recruitment



            //employee


            //user access


            //holiday management



            //leave management




            //rota


            //attendance




            //leave approver
            context.watch<UserProvider>().employee==false?
            SingleGridItem(
              onPressed: (){
                Routes.navigateToEmployerLeaveApprover(context);
              },
              title: Translation.of(context)!.translate('leave_approver')!,
              assetImagePath: const AssetImages(imgName: 'leave_approver').getAssetImagePath(),

              isBlur: false,

            ):Container(),


           //payroll
            context.watch<UserProvider>().employee==false?
            SingleGridItem(
              onPressed: (){
                Routes.navigateToHolidayDashboard(context);
              },
              title: Translation.of(context)!.translate('payroll')!,
              assetImagePath: const AssetImages(imgName: 'payroll').getAssetImagePath(),

              isBlur: true,

            ):Container(),


            //employee corner
            context.watch<UserProvider>().employee==false?
            SingleGridItem(
              onPressed: (){
                Routes.navigateToHolidayDashboard(context);
              },
              title: Translation.of(context)!.translate('employee_corner')!,
              assetImagePath: const AssetImages(imgName: 'employee_corner').getAssetImagePath(),


              isBlur: true,

            ):Container(),


            //task management
            context.watch<UserProvider>().employee==false?
            SingleGridItem(
              onPressed: (){

                Routes.navigateToHolidayDashboard(context);
              },
              title: Translation.of(context)!.translate('task_management')!,
              assetImagePath: const AssetImages(imgName: 'rota').getAssetImagePath(),
              isBlur: false,

            ):Container(),


            //performance management
            context.watch<UserProvider>().employee==false?
            SingleGridItem(
              onPressed: (){

                Routes.navigateToHolidayDashboard(context);
              },
              title: Translation.of(context)!.translate('performance_management')!,
              assetImagePath: const AssetImages(imgName: 'rota').getAssetImagePath(),
              isBlur: false,
            ):Container(),


            //meeting
            context.watch<UserProvider>().employee==false?
            SingleGridItem(
              onPressed: (){
                Routes.navigateToEmployerMeeting(context);
              },
              title: Translation.of(context)!.translate('meeting')!,
              assetImagePath: const AssetImages(imgName: 'meeting').getAssetImagePath(),
              isBlur: false,

            ):Container(),


          ],
        )


        */ /*GridView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing:2,
              mainAxisSpacing: 2,
              childAspectRatio: 2/1.8
          ),
          itemCount: 10,
          itemBuilder: (BuildContext context,index){
            return SingleGridItem();
          },
        ),*/ /*

      ),
    );*/
  }
}

