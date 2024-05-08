import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/provider/organization_providers/employee/employee_provider.dart';
import 'package:hrms/view/widgets/loader.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/asset_image_fetch.dart';




class EmployeeList extends StatefulWidget {
  const EmployeeList({super.key});

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {



 // List<Widget> tiles=[

  /*apiCall()async{
   await context.read<OrganizationEmployeeProvider>().getOrganizationEmployeeList(context);
  }

  @override
  void initState() {
    apiCall();
    // TODO: implement initState
    super.initState();
  }*/


  /*List<Widget> tiles=[
>>>>>>> 9b80c9b (second commit)
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 5),
      child: ListTile(
        tileColor: Colors.grey,
        horizontalTitleGap: 5,
<<<<<<< HEAD
        leading: CircleAvatar(
          radius: 35.r,
=======
        leading: Container(
          height: 60.h,
          width: 60.h,
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey)
          ),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: AssetImage(const AssetImages(imgName: 'user_no_image').getAssetImagePath()),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
>>>>>>> 9b80c9b (second commit)
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Name',style: TextStyle(color: Colors.black,fontSize: 18.sp),),
            Text('Employee ID',style: TextStyle(color: Colors.black,fontSize: 18.sp),)
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Sambhu Mandal',style: TextStyle(color: Colors.grey,fontSize: 16.sp),),
            Text('EMP123EITPL',style: TextStyle(color: Colors.grey,fontSize: 16.sp))
          ],
        ),
        trailing: CircleAvatar(
          radius: 20.r,
          backgroundColor: appcolor1,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Center(
              child: Icon(Icons.visibility_outlined,color: Colors.white,size: 20,),
            ),
          ),
        ),
      ),
    ),

    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 5),
      child: ListTile(
        tileColor: Colors.grey,
        horizontalTitleGap: 5,
        leading: CircleAvatar(
          radius: 35.r,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Name',style: TextStyle(color: Colors.black,fontSize: 18.sp),),
            Text('Employee ID',style: TextStyle(color: Colors.black,fontSize: 18.sp),)
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Sambhu Mandal',style: TextStyle(color: Colors.grey,fontSize: 16.sp),),
            Text('EMP123EITPL',style: TextStyle(color: Colors.grey,fontSize: 16.sp))
          ],
        ),
        trailing: CircleAvatar(
          radius: 20.r,
          backgroundColor: appcolor1,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Center(
              child: Icon(Icons.visibility_outlined,color: Colors.white,size: 20,),
            ),
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 5),
      child: ListTile(
        tileColor: Colors.grey,
        horizontalTitleGap: 5,
        leading: CircleAvatar(
          radius: 35.r,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Name',style: TextStyle(color: Colors.black,fontSize: 18.sp),),
            Text('Employee ID',style: TextStyle(color: Colors.black,fontSize: 18.sp),)
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Sambhu Mandal',style: TextStyle(color: Colors.grey,fontSize: 16.sp),),
            Text('EMP123EITPL',style: TextStyle(color: Colors.grey,fontSize: 16.sp))
          ],
        ),
        trailing: CircleAvatar(
          radius: 20.r,
          backgroundColor: appcolor1,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Center(
              child: Icon(Icons.visibility_outlined,color: Colors.white,size: 20,),
            ),
          ),
        ),
      ),
    )
<<<<<<< HEAD
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(50.r),topLeft: Radius.circular(50.r),bottomRight: Radius.circular(50.r),bottomLeft: Radius.circular(50.r)),
        color: Colors.white
      ),
      child: ListView(
=======
  ];*/
  @override
  Widget build(BuildContext context) {
    return
      Consumer<OrganizationEmployeeProvider>(
        builder: (_,instance,child){
          return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(50.r),topLeft: Radius.circular(50.r),bottomRight: Radius.circular(50.r),bottomLeft: Radius.circular(50.r)),
                  color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: instance.organizationEmployeeListData!.data!.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                      child: Column(
                        children: [
                          ListTile(
                            tileColor: Colors.grey,
                            horizontalTitleGap: 5,
                            leading: Container(
                              height: 60.h,
                              width: 60.h,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.grey)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image(
                                      image: AssetImage(const AssetImages(imgName: 'user_no_image').getAssetImagePath()),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Name',style: TextStyle(color: Colors.black,fontSize: 18.sp),),
                                Text('Employee ID',style: TextStyle(color: Colors.black,fontSize: 18.sp),)
                              ],
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${instance.organizationEmployeeListData!.data![index].empFname} ${instance.organizationEmployeeListData!.data![index].empMname} ${instance.organizationEmployeeListData!.data![index].empLname}',style: TextStyle(color: Colors.grey,fontSize: 16.sp),),
                                Text(instance.organizationEmployeeListData!.data![index].empCode.toString(),style: TextStyle(color: Colors.grey,fontSize: 16.sp))
                              ],
                            ),
                            trailing: CircleAvatar(
                              radius: 20.r,
                              backgroundColor: appcolor1,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Center(
                                  child: Icon(Icons.visibility_outlined,color: Colors.white,size: 20,),
                                ),
                              ),
                            ),
                          ),
                          Divider(color: Colors.grey,height: 1,)
                        ],
                      ),
                    );
                  },
                ),
              )
            /*ListView(

        children: ListTile.divideTiles(
          context: context,
          tiles:tiles
        ).toList(),

      )
    );
      )*/
          );
        },
      );
  }
}
