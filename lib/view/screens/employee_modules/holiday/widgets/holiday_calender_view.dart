import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../../model/employee/holiday/holiday_model.dart';
import '../../../../../provider/holiday/holiday_provider.dart';



class HolidayCalenderView extends StatefulWidget {
  const HolidayCalenderView({super.key});

  @override
  State<HolidayCalenderView> createState() => _HolidayCalenderViewState();
}

class _HolidayCalenderViewState extends State<HolidayCalenderView> {

  getDate(){
    return showDialog(
        context: context,
        builder: (_){
          return AlertDialog(
            content: Container(
              height: 400.h,
              width: 300.w,
              child: SfDateRangePicker(
                /*onSelectionChanged: (v){
                  //WidgetsBinding.instance.addPostFrameCallback((v){});
                  Navigator.pop(context);
                  print(v.value);
                },*/
                selectionMode: DateRangePickerSelectionMode.single,
                view: DateRangePickerView.year,
              ),
            ),
          );
        }
    );
  }
  
  List<DateTime> holidays=[];
  setHolidys(){
    
    setFormateMonthDate(String month){
      String input=month;
      if(month.length==1){
        String monthres='0$input';
        return monthres;
      }
      else {
        return input;
      }
    }
    List<Data>? data=context.read<HolidayProvider>().holidayList!.data;

    for(int i=0;i<data!.length;i++){
      if(data[i].day=='1'){
         
        holidays.add(DateTime.parse('${data[i].fromDate}'));
      }
      else{
        var date= DateFormat("yyyy-MM-dd").parse('${data[i].fromDate}');
        var month=date.month;
        //var day=DateFormat('EEEE').format(date);
        var day=date.day;
        print('>>>>>>>>>>>$date       $month   $day');
        for(int j=0;j<int.parse('${data[i].day}');j++){
          holidays.add(DateTime.parse('${date.year}-${setFormateMonthDate(date.month.toString())}-${setFormateMonthDate(date.day.toString())}'));
          var newDate=date.add(const Duration(days: 1));
          date=newDate;
          month=date.month;
          //day=DateFormat('EEEE').format(date);
          day=date.day;
        }

      }
    }
  }
  
  @override
  void initState() {
    setHolidys();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey,width: .5)
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SfDateRangePicker(
              backgroundColor: Colors.white,
              /*onSelectionChanged: (v){
                        //WidgetsBinding.instance.addPostFrameCallback((v){});
                        Navigator.pop(context);
                        print(v.value);
                      },*/
              selectionMode: DateRangePickerSelectionMode.single,
              view: DateRangePickerView.month,
              monthViewSettings: DateRangePickerMonthViewSettings(
                specialDates: holidays,
                /*[
                  DateTime.parse(DateFormat("yyyy-MM-dd").parse('2023-12-21').toString()),
                  DateTime.parse(DateFormat("yyyy-MM-dd").parse('2023-12-24').toString()),
                  DateTime.parse(DateFormat("yyyy-MM-dd").parse('2023-12-28').toString()),
                ],*/
                weekendDays: const [7,6],
                  showTrailingAndLeadingDates: true
              ),
              monthCellStyle: DateRangePickerMonthCellStyle(
                blackoutDatesDecoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(color: const Color(0xFFF44436), width: 1),
                    shape: BoxShape.circle),
                weekendDatesDecoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    border: Border.all(color: const Color(0xFFB6B6B6), width: 1),
                    shape: BoxShape.circle),
                specialDatesDecoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(color: const Color(0xFF2B732F), width: 1),
                    shape: BoxShape.circle),
                todayCellDecoration: BoxDecoration(
                  color: appcolor1,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey,width: .5)
                ),
                blackoutDateTextStyle: const TextStyle(color: Colors.white, decoration: TextDecoration.lineThrough),
                specialDatesTextStyle: const TextStyle(color: Colors.white),
                todayTextStyle: const TextStyle(color: Colors.white)
              ),
            ),
          ),
        ),
      ),
    );
  }
}
