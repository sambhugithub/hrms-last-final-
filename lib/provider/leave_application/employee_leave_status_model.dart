class EmployeeLeaveStatusModel {
  List<Data>? data;

  EmployeeLeaveStatusModel({this.data});

  EmployeeLeaveStatusModel.fromJson(Map<String, dynamic> json) {
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
  String? employeeId;
  String? employeeName;
  String? empReportingAuth;
  String? empLvSancAuth;
  String? dateOfApply;
  String? leaveType;
  String? halfCl;
  String? fromDate;
  String? toDate;
  int? noOfLeave;
  Null? docImage;
  String? status;
  String? statusRemarks;
  String? updatedAt;
  String? createdAt;
  String? emid;
  String? leaveTypeName;

  Data(
      {this.id,
        this.employeeId,
        this.employeeName,
        this.empReportingAuth,
        this.empLvSancAuth,
        this.dateOfApply,
        this.leaveType,
        this.halfCl,
        this.fromDate,
        this.toDate,
        this.noOfLeave,
        this.docImage,
        this.status,
        this.statusRemarks,
        this.updatedAt,
        this.createdAt,
        this.emid,
        this.leaveTypeName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeId = json['employee_id'];
    employeeName = json['employee_name'];
    empReportingAuth = json['emp_reporting_auth'];
    empLvSancAuth = json['emp_lv_sanc_auth'];
    dateOfApply = json['date_of_apply'];
    leaveType = json['leave_type'];
    halfCl = json['half_cl'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    noOfLeave = json['no_of_leave'];
    docImage = json['doc_image'];
    status = json['status'];
    statusRemarks = json['status_remarks'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    emid = json['emid'];
    leaveTypeName = json['leave_type_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employee_id'] = this.employeeId;
    data['employee_name'] = this.employeeName;
    data['emp_reporting_auth'] = this.empReportingAuth;
    data['emp_lv_sanc_auth'] = this.empLvSancAuth;
    data['date_of_apply'] = this.dateOfApply;
    data['leave_type'] = this.leaveType;
    data['half_cl'] = this.halfCl;
    data['from_date'] = this.fromDate;
    data['to_date'] = this.toDate;
    data['no_of_leave'] = this.noOfLeave;
    data['doc_image'] = this.docImage;
    data['status'] = this.status;
    data['status_remarks'] = this.statusRemarks;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['emid'] = this.emid;
    data['leave_type_name'] = this.leaveTypeName;
    return data;
  }
}