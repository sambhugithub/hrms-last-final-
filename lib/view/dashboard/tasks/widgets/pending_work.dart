import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../helper/color.dart';
import '../../../widgets/popups.dart';



/*class PendingWork extends StatelessWidget {
  const PendingWork({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context,index){
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                InkWell(
                  onTap: (){
                    PopUps(context: context).showEmployeeTaskStatus();
                  },
                  child: Container(
                    height: 100.h,
                    width: 507.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: index%2==0?taskListtileColor1:taskListtileColor2
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Project Name ${index+1}',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w400),),
                          Text('Lorem ipsum is placeholder text commonly used in the graphic prin...',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w400),maxLines: 2,),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: -5,
                  top: -5,
                  child: Container(
                    height: 30.h,
                    width: 30.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index%2==0?notificationNumberColor:appcolor1
                    ),
                    child: Center(
                      child: Text((index+1).toString(),style: TextStyle(fontSize: 21.sp,fontWeight: FontWeight.w700,color: Colors.white),),
                    ),
                  ),
                ),
                Positioned(
                  right: 5.h,
                  top: -5.h,
                  child: PopupMenuButton(
                    initialValue: 1,
                    // Callback that sets the selected popup menu item.
                    onSelected: (item) {},
                    itemBuilder: (BuildContext context) =>[],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}*/
