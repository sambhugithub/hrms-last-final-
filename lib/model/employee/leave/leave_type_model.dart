class LeaveTypeModel {
  List<Data>? data;

  LeaveTypeModel({this.data});

  LeaveTypeModel.fromJson(Map<String, dynamic> json) {
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
  String? leaveTypeName;
  String? alies;
  String? remarks;
  String? leaveTypeStatus;
  String? emid;

  Data(
      {this.id,
        this.leaveTypeName,
        this.alies,
        this.remarks,
        this.leaveTypeStatus,
        this.emid});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    leaveTypeName = json['leave_type_name'];
    alies = json['alies'];
    remarks = json['remarks'];
    leaveTypeStatus = json['leave_type_status'];
    emid = json['emid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['leave_type_name'] = this.leaveTypeName;
    data['alies'] = this.alies;
    data['remarks'] = this.remarks;
    data['leave_type_status'] = this.leaveTypeStatus;
    data['emid'] = this.emid;
    return data;
  }
}