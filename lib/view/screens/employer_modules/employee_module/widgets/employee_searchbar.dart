import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/view/widgets/asset_image_fetch.dart';



class EmployeeSearchBar extends StatefulWidget {
  const EmployeeSearchBar({super.key});

  @override
  State<EmployeeSearchBar> createState() => _EmployeeSearchBarState();
}

class _EmployeeSearchBarState extends State<EmployeeSearchBar> {

  TextEditingController empSearch =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      width: 528.w,
      decoration:  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.r)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage(const AssetImages(imgName: 'emp_search_prefix').getAssetImagePath()),),
                SizedBox(width: 20.w,),
                SizedBox(
                  width: 300.w,
                  child: TextFormField(
                    cursorColor: appcolor1,
                    controller: empSearch,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                      hintText: 'Employee ID/Employee Name',
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 16.sp)
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: appcolor2
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Icon(Icons.search,color: Colors.white,size: 20,),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
