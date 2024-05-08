class OrganizationPerformanceRequestListModel {
  int? flag;
  int? status;
  Data? data;
  String? message;

  OrganizationPerformanceRequestListModel(
      {this.flag, this.status, this.data, this.message});

  OrganizationPerformanceRequestListModel.fromJson(Map<String, dynamic> json) {
    flag = json['flag'];
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flag'] = this.flag;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? currentUserType;
  List<Performances>? performances;

  Data({this.currentUserType, this.performances});

  Data.fromJson(Map<String, dynamic> json) {
    currentUserType = json['currentUserType'];
    if (json['performances'] != null) {
      performances = <Performances>[];
      json['performances'].forEach((v) {
        performances!.add(new Performances.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentUserType'] = this.currentUserType;
    if (this.performances != null) {
      data['performances'] = this.performances!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Performances {
  String? empDepartment;
  String? empFname;
  String? empMname;
  String? empLname;
  String? repFname;
  String? repMname;
  String? repLname;
  int? id;
  String? empCode;
  String? emid;
  String? empReportingAuth;
  String? apprisalPeriodStart;
  String? apprisalPeriodEnd;
  String? createdBy;
  String? updatedBy;
  String? status;
  String? performanceComments;
  String? performanceFeedback;
  String? rating;
  String? createdAt;
  String? updatedAt;

  Performances(
      {this.empDepartment,
        this.empFname,
        this.empMname,
        this.empLname,
        this.repFname,
        this.repMname,
        this.repLname,
        this.id,
        this.empCode,
        this.emid,
        this.empReportingAuth,
        this.apprisalPeriodStart,
        this.apprisalPeriodEnd,
        this.createdBy,
        this.updatedBy,
        this.status,
        this.performanceComments,
        this.performanceFeedback,
        this.rating,
        this.createdAt,
        this.updatedAt});

  Performances.fromJson(Map<String, dynamic> json) {
    empDepartment = json['emp_department'];
    empFname = json['emp_fname'];
    empMname = json['emp_mname'];
    empLname = json['emp_lname'];
    repFname = json['rep_fname'];
    repMname = json['rep_mname'];
    repLname = json['rep_lname'];
    id = json['id'];
    empCode = json['emp_code'];
    emid = json['emid'];
    empReportingAuth = json['emp_reporting_auth'];
    apprisalPeriodStart = json['apprisal_period_start'];
    apprisalPeriodEnd = json['apprisal_period_end'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    status = json['status'];
    performanceComments = json['performance_comments'];
    performanceFeedback = json['performance_feedback'];
    rating = json['rating'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emp_department'] = this.empDepartment;
    data['emp_fname'] = this.empFname;
    data['emp_mname'] = this.empMname;
    data['emp_lname'] = this.empLname;
    data['rep_fname'] = this.repFname;
    data['rep_mname'] = this.repMname;
    data['rep_lname'] = this.repLname;
    data['id'] = this.id;
    data['emp_code'] = this.empCode;
    data['emid'] = this.emid;
    data['emp_reporting_auth'] = this.empReportingAuth;
    data['apprisal_period_start'] = this.apprisalPeriodStart;
    data['apprisal_period_end'] = this.apprisalPeriodEnd;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['status'] = this.status;
    data['performance_comments'] = this.performanceComments;
    data['performance_feedback'] = this.performanceFeedback;
    data['rating'] = this.rating;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
