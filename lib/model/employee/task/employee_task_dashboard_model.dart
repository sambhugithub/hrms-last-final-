class EmployeeTaskDashboardModel {
  int? flag;
  int? status;
  String? message;
  List<Data>? data;

  EmployeeTaskDashboardModel({this.flag, this.status, this.message, this.data});

  EmployeeTaskDashboardModel.fromJson(Map<String, dynamic> json) {
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
  int? projectId;
  int? createdBy;
  String? createdByName;
  String? createdAt;
  String? projectName;
  List<Tasks>? tasks;

  Data(
      {this.projectId,
        this.createdBy,
        this.createdByName,
        this.createdAt,
        this.projectName,
        this.tasks});

  Data.fromJson(Map<String, dynamic> json) {
    projectId = json['project_id'];
    createdBy = json['created_by'];
    createdByName = json['created_by_name'];
    createdAt = json['created_at'];
    projectName = json['project_name'];
    if (json['tasks'] != null) {
      tasks = <Tasks>[];
      json['tasks'].forEach((v) {
        tasks!.add(new Tasks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['project_id'] = this.projectId;
    data['created_by'] = this.createdBy;
    data['created_by_name'] = this.createdByName;
    data['created_at'] = this.createdAt;
    data['project_name'] = this.projectName;
    if (this.tasks != null) {
      data['tasks'] = this.tasks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tasks {
  String? title;
  int? count;

  Tasks({this.title, this.count});

  Tasks.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['count'] = this.count;
    return data;
  }
}
