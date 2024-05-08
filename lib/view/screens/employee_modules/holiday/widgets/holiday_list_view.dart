import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/helper/color.dart';
import 'package:hrms/model/employee/holiday/holiday_model.dart';
import 'package:hrms/provider/holiday/holiday_provider.dart';
import 'package:hrms/view/widgets/loader.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../../localizations/app_localizations.dart';




class HolidayListView extends StatefulWidget {
  const HolidayListView({super.key});

  @override
  State<HolidayListView> createState() => _HolidayListViewState();
}

class _HolidayListViewState extends State<HolidayListView> {


  getDate(){
    return showDialog(
        context: context,
        builder: (_){
          return AlertDialog(
            content: Container(
              height: 400.h,
              width: 300.w,
              child: SfDateRangePicker(
                onSelectionChanged: (v){
                  //WidgetsBinding.instance.addPostFrameCallback((v){});
                  Navigator.pop(context);
                  print(v.value);
                  context.read<HolidayProvider>().setCurrentMonthYear(v.value);
                  },
                selectionMode: DateRangePickerSelectionMode.single,
                view: DateRangePickerView.year,
              ),
            ),
          );
        }
    );
  }

  /*final List<Map<String, String>> listOfColumns = [
      {"Date": "01-11-2023", "Month": "Jan", "Day": "Mon", "No_of_holiday":"1 Day", "ocasion": "Durga Puja", "description":"Holiday for Durgapuja"},
      {"Date": "01-11-2023", "Month": "Jan", "Day": "Mon", "No_of_holiday":"1 Day", "ocasion": "Durga Puja", "description":"Holiday for Durgapuja"},
      {"Date": "01-11-2023", "Month": "Jan", "Day": "Mon", "No_of_holiday":"1 Day", "ocasion": "Durga Puja", "description":"Holiday for Durgapuja"},
      {"Date": "01-11-2023", "Month": "Jan", "Day": "Mon", "No_of_holiday":"1 Day", "ocasion": "Durga Puja", "description":"Holiday for Durgapuja"},
      {"Date": "01-11-2023", "Month": "Jan", "Day": "Mon", "No_of_holiday":"1 Day", "ocasion": "Durga Puja", "description":"Holiday for Durgapuja"},
      {"Date": "01-11-2023", "Month": "Jan", "Day": "Mon", "No_of_holiday":"1 Day", "ocasion": "Durga Puja", "description":"Holiday for Durgapuja"},
      {"Date": "01-11-2023", "Month": "Jan", "Day": "Mon", "No_of_holiday":"1 Day", "ocasion": "Durga Puja", "description":"Holiday for Durgapuja"},
      {"Date": "01-11-2023", "Month": "Jan", "Day": "Mon", "No_of_holiday":"1 Day", "ocasion": "Durga Puja", "description":"Holiday for Durgapuja"},
      {"Date": "01-11-2023", "Month": "Jan", "Day": "Mon", "No_of_holiday":"1 Day", "ocasion": "Durga Puja", "description":"Holiday for Durgapuja"},
      {"Date": "01-11-2023", "Month": "Jan", "Day": "Mon", "No_of_holiday":"1 Day", "ocasion": "Durga Puja", "description":"Holiday for Durgapuja"},
      {"Date": "01-11-2023", "Month": "Jan", "Day": "Mon", "No_of_holiday":"1 Day", "ocasion": "Durga Puja", "description":"Holiday for Durgapuja"},
      {"Date": "01-11-2023", "Month": "Jan", "Day": "Mon", "No_of_holiday":"1 Day", "ocasion": "Durga Puja", "description":"Holiday for Durgapuja"},
      {"Date": "01-11-2023", "Month": "Jan", "Day": "Mon", "No_of_holiday":"1 Day", "ocasion": "Durga Puja", "description":"Holiday for Durgapuja"},
    ];*/
  getMonthName(var s){
    switch(s){
      case 1:
        return 'Jan';
        break;
      case 2:
        return 'Feb';
        break;

      case 3:
        return 'Mar';
        break;
      case 4:
        return 'Apr';
        break;
      case 5:
        return 'May';
        break;
      case 6:
        return 'Jun';
        break;
      case 7:
        return 'Jul';
        break;
      case 8:
        return 'Aug';
        break;
      case 9:
        return 'Sep';
        break;
      case 10:
        return 'Oct';
        break;
      case 11:
        return 'Nov';
        break;
      case 12:
        return 'Dec';
        break;
      default:
        return'';
    }
  }
  List<Map<String,String>> listOfColumns=[];
  apiCall()async{
    await context.read<HolidayProvider>().getEmployeeHolidayList(context);
    List<Data>? data=context.read<HolidayProvider>().holidayList!.data;

    for(int i=0;i<data!.length;i++){
      if(data[i].day=='1'){
        listOfColumns.add(
            {"Date":"${data[i].fromDate}","Month":"${getMonthName(int.parse('${data[i].month}'))}","Day":"${data[i].weekname!.toUpperCase()}","No_of_holiday":"${data[i].day} Day","ocasion":"${data[i].name}","description":"${data[i].holidayDescripion}"}
        );
      }
      else{
        var date= DateFormat("yyyy-MM-dd").parse('${data[i].fromDate}');
        var month=date.month;
        var day=DateFormat('EEEE').format(date);
        print(date);
        for(int j=0;j<int.parse('${data[i].day}');j++){
          listOfColumns.add(
              {"Date":"${date.year}-${date.month}-${date.day}","Month":"${getMonthName(int.parse('$month'))}","Day":"${day.toUpperCase()}","No_of_holiday":"1 Day","ocasion":"${data[i].name}","description":"${data[i].holidayDescripion}"}
          );
          var newDate=date.add(const Duration(days: 1));
          date=newDate;
          month=date.month;
          day=DateFormat('EEEE').format(date);
        }

      }
    }

  }

  @override
  void initState() {
    apiCall();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    Color getGreyColor(Set<MaterialState> states) {
      return appscaffoldcolor1;
    }

    Color getWhiteColor(Set<MaterialState> states) {
      return Colors.white;
    }
    return Scaffold(
      body:Consumer<HolidayProvider>(
        builder: (_,instance,child){
          return instance.isLoading?Loader(containerColor: appscaffoldcolor1,)
          :Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              children: [
                Container(
                  height: 70.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: appcolor1
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${instance.currentMonthYear}',style: const TextStyle(color: Colors.white),),
                      SizedBox(width: 20.w,),
                      /*InkWell(
                        onTap: (){
                          var date= DateFormat("yyyy-MM-dd").parse('2023-12-30');
                          var date1=date.add(const Duration(days: 2));
                          //getDate();
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white,width: 2)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(Icons.calendar_month_outlined,color: Colors.white,size: 25.sp,),
                            )
                        ),
                      )*/
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    //color: Colors.green,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: DataTable(
                          //columnSpacing: 10,
                          headingRowColor: MaterialStateColor.resolveWith((states) {return appcolor2.withOpacity(.8);},),
                          headingTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 22.sp),
                          columns: [
                            DataColumn(label: Text(Translation.of(context)!.translate('date')!)),
                            DataColumn(label: Text(Translation.of(context)!.translate('month')!)),
                            DataColumn(label: Text(Translation.of(context)!.translate('day')!)),
                            DataColumn(label: Text(Translation.of(context)!.translate('no_of_holiday')!)),
                            DataColumn(label: Text(Translation.of(context)!.translate('ocasion')!)),
                            DataColumn(label: Text(Translation.of(context)!.translate('holiday_description')!)),
                          ],
                          rows:
                          List.generate(listOfColumns.length, (index) {
                            final item = listOfColumns[index];
                            return DataRow(
                              color: index % 2 == 0
                                  ? MaterialStateProperty.resolveWith(getGreyColor)
                                  : MaterialStateProperty.resolveWith(getWhiteColor),
                              cells: [
                                DataCell(Text(item["Date"]!)), //Extracting from Map element the value
                                DataCell(Text(item["Month"]!)),
                                DataCell(Text(item["Day"]!)),
                                DataCell(Text(item["No_of_holiday"]!)),
                                DataCell(Text(item["ocasion"]!)),
                                DataCell(Text(item["description"]!)),
                              ],
                            );
                          }),
                          /*listOfColumns // Loops through dataColumnText, each iteration assigning the value to element
                  .map(
                ((element) => DataRow(
                  color: element.length % 2 == 0
                      ? MaterialStateProperty.resolveWith(getGreyColor)
                      : MaterialStateProperty.resolveWith(getWhiteColor),
                  cells: <DataCell>[
                    DataCell(Text(element["Date"]!)), //Extracting from Map element the value
                    DataCell(Text(element["Day"]!)),
                    DataCell(Text(element["clockin"]!)),
                    DataCell(Text(element["clockout"]!)),
                    DataCell(Text(element["totalhour"]!)),
                  ],
                )),
              )
                  .toList(),*/
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      )
    );
  }
}
