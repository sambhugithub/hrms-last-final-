class EmployeeAttendanceGraphReportModel {
  List<Data>? data;

  EmployeeAttendanceGraphReportModel({this.data});

  EmployeeAttendanceGraphReportModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? totalActualHour;
  int? totalStaticHour;
  int? month;

  Data({this.totalActualHour, this.totalStaticHour, this.month});

  Data.fromJson(Map<String, dynamic> json) {
    totalActualHour = json['total_actual_hour'];
    totalStaticHour = json['total_static_hour'];
    month = json['month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_actual_hour'] = this.totalActualHour;
    data['total_static_hour'] = this.totalStaticHour;
    data['month'] = this.month;
    return data;
  }
}