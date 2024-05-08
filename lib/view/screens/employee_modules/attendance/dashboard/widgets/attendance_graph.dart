import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/localizations/app_localizations.dart';
import 'package:hrms/model/employee/employee_attendance_graph_report_model.dart';
import 'package:provider/provider.dart';

import '../../../../../../provider/attendance/attendance_provider.dart';


class AttendanceGraph extends StatefulWidget {

   const AttendanceGraph({super.key});

  @override
  State<AttendanceGraph> createState() => _AttendanceGraphState();
}

class _AttendanceGraphState extends State<AttendanceGraph> {
  final List<Map<String,dynamic>> barChartData=[];

  makeGraphData(data){
    for(int i=0;i<data!.length;i++){
      barChartData.add({"month" : data![i].month,"org_total_hours" : double.parse("${data![i].totalStaticHour}"),"emp_total_hours" : double.parse("${data![i].totalActualHour}")}) ;
    }
  }
  apiCall()async{
    await context.read<AttendanceProvider>().getEmployeeAttendancegraphReport(context);
    makeGraphData(context.read<AttendanceProvider>().graphReport!.data);
    setState(() {});
  }

  @override
  void initState() {
    apiCall();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /*final List<Map<String,dynamic>> barChartData=[
      {
        'month': 1,
        'org_total_hours' : 190.0,
        'emp_total_hours' : 120.0
      },
      {
        'month': 2,
        'org_total_hours' : 190.0,
        'emp_total_hours' : 140.0
      },
      {
        'month': 3,
        'org_total_hours' : 190.0,
        'emp_total_hours' : 160.0
      },
       {
        'month': 4,
        'org_total_hours' : 190.0,
        'emp_total_hours' : 110.0
      },
      {
        'month': 5,
        'org_total_hours' : 190.0,
        'emp_total_hours' : 130.0
      },
      {
        'month': 6,
        'org_total_hours' : 190.0,
        'emp_total_hours' : 150.0
      },
      {
        'month': 7,
        'org_total_hours' : 190.0,
        'emp_total_hours' : 140.0
      },
      {
        'month': 8,
        'org_total_hours' : 190.0,
        'emp_total_hours' : 160.0
      },
      {
        'month': 9,
        'org_total_hours' : 190.0,
        'emp_total_hours' : 180.0
      },
       {
        'month': 10,
        'org_total_hours' : 190.0,
        'emp_total_hours' : 110.0
      },
       {
        'month': 11,
        'org_total_hours' : 190.0,
        'emp_total_hours' : 160.0
      },
      {
        'month': 12,
        'org_total_hours' : 190.0,
        'emp_total_hours' : 130.0
      }
    ];*/
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(Translation.of(context)!.translate('yearly_attendance_report')!.toString(),style: TextStyle(color: appcolor1,fontWeight: FontWeight.w400,fontSize: 20.sp),),
            ),
            const SizedBox(height: 20,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: 250.h,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: BarChart(
                    BarChartData(
                      baselineY: 0,
                      minY: 0,
                      maxY: 200,
                      alignment: BarChartAlignment.start,
                      borderData: FlBorderData(
                        show: true,
                        border: const Border(
                            top: BorderSide.none,
                            right:BorderSide.none,
                            left: BorderSide.none,
                            bottom: BorderSide(width: .5)
                        ),
                      ),
                      gridData: const FlGridData(show: true,drawVerticalLine: false,horizontalInterval:45),
                      titlesData:   FlTitlesData(
                        show: true,
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            getTitlesWidget: (double value,_){
                              switch (value.toInt()) {
                                case 1:
                                  return const Text('Jan');
                                case 2:
                                  return const Text('Feb');
                                case 3:
                                  return const Text('Mar');
                                case 4:
                                  return const Text('apr');
                                case 5:
                                  return const Text('May');
                                case 6:
                                  return const Text('Jun');
                                case 7:
                                  return const Text('Jul');
                                case 8:
                                  return const Text('Aug');
                                case 9:
                                  return const Text('Sep');
                                case 10:
                                  return const Text('Oct');
                                case 11:
                                  return const Text('Nov');
                                case 12:
                                  return const Text('Dec');
                              // Add more cases as needed
                                default:
                                  return const Text('');
                              }
                            }
                          ),
                        ),
                        leftTitles:  const AxisTitles(
                          //axisNameSize: 100,
                          sideTitles: SideTitles(showTitles: true,reservedSize: 50,interval: 45),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      backgroundColor: Colors.transparent,
                      barTouchData: BarTouchData(
                        handleBuiltInTouches: false,
                          enabled: false,
                          touchTooltipData: BarTouchTooltipData(
                            tooltipBgColor: Colors.transparent,
                          )
                      ),
                      groupsSpace: 10.w,
                      barGroups:
                      /*context.read<AttendanceProvider>().graphReport!.data!.map((data) =>
                          BarChartGroupData(
                              x:data.month!,
                              barRods: [
                                BarChartRodData(toY: double.parse('${data.totalStaticHour}'), width: barChartData.length<=6?30.w:15.w, color: appcolor1,borderRadius: const BorderRadius.only(topRight: Radius.circular(2),topLeft: Radius.circular(2))),
                                BarChartRodData(toY: double.parse('${data.totalActualHour}'), width: barChartData.length<=6?30.w:15.w, color: Colors.purple.shade400,borderRadius: const BorderRadius.only(topRight: Radius.circular(2),topLeft: Radius.circular(2)))
                              ],
                              showingTooltipIndicators: [0],
                              barsSpace: 1
                          )
                      ).toList()*/
                      barChartData.map((data) =>
                          BarChartGroupData(
                              x:data['month'],
                              barRods: [
                                BarChartRodData(toY: data['org_total_hours'], width: barChartData.length<=6?30.w:15.w, color: appcolor1,borderRadius: const BorderRadius.only(topRight: Radius.circular(2),topLeft: Radius.circular(2))),
                                BarChartRodData(toY: data['emp_total_hours'], width: barChartData.length<=6?30.w:15.w, color: Colors.purple.shade400,borderRadius: const BorderRadius.only(topRight: Radius.circular(2),topLeft: Radius.circular(2)))
                              ],
                              showingTooltipIndicators: [0],
                              barsSpace: 1
                          )
                      ).toList()
                    ),
                    swapAnimationDuration: const Duration(seconds: 5),
                    swapAnimationCurve: Curves.linear,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
