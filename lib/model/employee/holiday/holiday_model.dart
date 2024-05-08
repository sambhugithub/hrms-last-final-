class EmployeeHolidayModel {
  List<Data>? data;

  EmployeeHolidayModel({this.data});

  EmployeeHolidayModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? years;
  String? fromDate;
  String? toDate;
  String? month;
  String? day;
  String? weekname;
  String? holidayDescripion;
  String? holidayType;
  String? updatedAt;
  String? createdAt;
  String? emid;
  String? name;

  Data(
      {this.id,
        this.years,
        this.fromDate,
        this.toDate,
        this.month,
        this.day,
        this.weekname,
        this.holidayDescripion,
        this.holidayType,
        this.updatedAt,
        this.createdAt,
        this.emid,
        this.name});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    years = json['years'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    month = json['month'];
    day = json['day'];
    weekname = json['weekname'];
    holidayDescripion = json['holiday_descripion'];
    holidayType = json['holiday_type'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    emid = json['emid'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['years'] = this.years;
    data['from_date'] = this.fromDate;
    data['to_date'] = this.toDate;
    data['month'] = this.month;
    data['day'] = this.day;
    data['weekname'] = this.weekname;
    data['holiday_descripion'] = this.holidayDescripion;
    data['holiday_type'] = this.holidayType;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['emid'] = this.emid;
    data['name'] = this.name;
    return data;
  }
}
