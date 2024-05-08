import 'package:flutter/material.dart';
import 'package:hrms/helper/string.dart';

import '../../helper/api_base_helper.dart';



class TaskRepository{



  //employee task dashboard data
  static Future<Map<String, dynamic>> EmployeeTaskDashboardData({
    required Map<String, dynamic> parameter,
  }) async {
    try {
      var taskDashboardData = await ApiBaseHelper().postAPICall(employeeTaskDashboard, parameter);
      print('repository print taskdashboard: $taskDashboardData');
      return taskDashboardData;


    } on Exception catch (e) {
      throw ApiException(e.toString());
    }
  }

 //employee tasklistdata
  static Future<Map<String, dynamic>> EmployeeTaskListData({
    required Map<String, dynamic> parameter,
  }) async {
    try {
      var taskListData = await ApiBaseHelper().postAPICall(employeeTaskList, parameter);
      print('repository print tasklist: $taskListData');
      return taskListData;


    } on Exception catch (e) {
      throw ApiException(e.toString());
    }
  }



  //employee task update
  static Future<Map<String, dynamic>> EmployeeTaskUpdate({
    required Map<String, dynamic> parameter,
  }) async {
    try {
      var taskUpdateData = await ApiBaseHelper().postAPICall(employeeTaskUpdate, parameter);
      print('repository print task update: $taskUpdateData');
      return taskUpdateData;


    } on Exception catch (e) {
      throw ApiException(e.toString());
    }
  }



  //project label
  static Future<Map<String, dynamic>> EmployeeTaskLabel({
    required Map<String, dynamic> parameter,
  }) async {
    try {
      var taskLabelData = await ApiBaseHelper().postAPICall(employeeTaskLabel, parameter);
      print('repository print task update: $taskLabelData');
      return taskLabelData;


    } on Exception catch (e) {
      throw ApiException(e.toString());
    }
  }



}
