class EmployeeTaskListModel {
  int? flag;
  int? status;
  String? message;
  List<Data>? data;

  EmployeeTaskListModel({this.flag, this.status, this.message, this.data});

  EmployeeTaskListModel.fromJson(Map<String, dynamic> json) {
    flag = json['flag'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flag'] = this.flag;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? projectId;
  int? assignedTo;
  String? taskName;
  String? taskDesc;
  String? tags;
  String? startDate;
  String? expectedEndDate;
  int? createdBy;
  Null? updatedBy;
  String? priority;
  String? status;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.projectId,
        this.assignedTo,
        this.taskName,
        this.taskDesc,
        this.tags,
        this.startDate,
        this.expectedEndDate,
        this.createdBy,
        this.updatedBy,
        this.priority,
        this.status,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectId = json['project_id'];
    assignedTo = json['assignedTo'];
    taskName = json['task_name'];
    taskDesc = json['task_desc'];
    tags = json['tags'];
    startDate = json['start_date'];
    expectedEndDate = json['expected_end_date'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    priority = json['priority'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['project_id'] = this.projectId;
    data['assignedTo'] = this.assignedTo;
    data['task_name'] = this.taskName;
    data['task_desc'] = this.taskDesc;
    data['tags'] = this.tags;
    data['start_date'] = this.startDate;
    data['expected_end_date'] = this.expectedEndDate;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['priority'] = this.priority;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
