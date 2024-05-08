import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/model/employer/requiretment/organization_requiretment_dashboard_model.dart';



class CandidateList extends StatefulWidget {
  final String appbarTitle;
  final List data;
  const CandidateList(
      this.appbarTitle,
      this.data,
      {super.key});

  @override
  State<CandidateList> createState() => _CandidateListState();
}

class _CandidateListState extends State<CandidateList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appscaffoldcolor1,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          onPressed: (){
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        title: Text(widget.appbarTitle,style: TextStyle(fontSize: 20.sp),),
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: widget.data.isEmpty?const Center(child: Text('No Data'),):ListView.builder(
          itemCount: widget.data.length,
          itemBuilder: (context,index,){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
              child: Container(
                height: 60.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(width:120.w,child: Text(widget.data[index].name.toString(),style: TextStyle(fontSize: 16.sp),)),
                      Container(width:150.w,child: Text(widget.data[index].jobTitle.toString(),style: TextStyle(fontSize: 16.sp),)),
                      Container(width:120.w,child: Text(widget.data[index].phone.toString(),style: TextStyle(fontSize: 16.sp),)),
                      CircleAvatar(
                        radius: 20.r,
                        backgroundColor: appcolor1,
                        child: Center(
                          child: Icon(Icons.visibility_outlined,color: Colors.white,size: 20.h,),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
