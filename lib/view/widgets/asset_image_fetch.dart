class AssetImages{
     final String imgName;

     const AssetImages({
       required this.imgName
});

     final String assetImgBasePath= 'assets/images/';

     getAssetImagePath(){
       switch(imgName){
         case 'splash_logo':
           return '${assetImgBasePath}splash_logo.png';
           break;

         case 'splash_img':
           return '${assetImgBasePath}splash_img.png';
           break;

         case 'appbar_leading':
           return '${assetImgBasePath}appbar_leading.png';
           break;

         case 'main_dash_announcement':
           return '${assetImgBasePath}main_dash_announcement.png';
           break;

         case 'main_dash_attendance':
           return '${assetImgBasePath}main_dash_attendance.png';
           break;

         case 'main_dash_events':
           return '${assetImgBasePath}main_dash_events.png';
           break;

         case 'main_dash_holidays':
           return '${assetImgBasePath}main_dash_holidays.png';
           break;

         case 'main_dash_leave_application':
           return '${assetImgBasePath}main_dash_leave_application.png';
           break;

         case 'main_dash_my_payslip':
           return '${assetImgBasePath}main_dash_my_payslip.png';
           break;

         case 'main_dash_myprofile':
           return '${assetImgBasePath}main_dash_myprofile.png';
           break;

         case 'main_dash_notifications':
           return '${assetImgBasePath}main_dash_notifications.png';
           break;

         case 'main_dash_settings':
           return '${assetImgBasePath}main_dash_settings.png';
           break;

         case 'main_dash_tasks':
           return '${assetImgBasePath}main_dash_tasks.png';
           break;

         case 'no_image':
           return '${assetImgBasePath}no_image.png';
           break;

         case 'app_icon':
           return '${assetImgBasePath}app_icon.png';
           break;

         case 'baloons':
           return '${assetImgBasePath}baloons.jpg';
           break;

         case 'employee_corner':
           return '${assetImgBasePath}employee_corner.png';
           break;

         case 'employees':
           return '${assetImgBasePath}employees.png';
           break;

         case 'payroll':
           return '${assetImgBasePath}payroll.png';
           break;

         case 'recruitment':
           return '${assetImgBasePath}recuritment.png';
           break;

         case 'rota':
           return '${assetImgBasePath}rota.png';
           break;

         case 'user_access':
           return '${assetImgBasePath}user_access.png';
           break;

         case 'leave_approver':
           return '${assetImgBasePath}leave_approver.png';
           break;

         case 'emp_search_prefix':
           return '${assetImgBasePath}emp_search_prefix.png';
           break;

         case 'user_no_image':
           return '${assetImgBasePath}user_no_image.jpg';
           break;

         case 'ux':
           return '${assetImgBasePath}ux.png';
           break;

         case 'meeting':
           return '${assetImgBasePath}meeting.png';
           break;

         default:null;
       }
     }

}

