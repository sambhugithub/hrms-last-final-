class OrganizationTaskModel {
  int? flag;
  int? status;
  String? message;
  List<Data>? data;

  OrganizationTaskModel({this.flag, this.status, this.message, this.data});

  OrganizationTaskModel.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? emid;
  String? description;
  String? identifier;
  int? createdBy;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? owner;
  List<TaskList>? taskList;
  List<Labels>? labels;

  Data(
      {this.id,
        this.title,
        this.emid,
        this.description,
        this.identifier,
        this.createdBy,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.owner,
        this.taskList,
        this.labels});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    emid = json['emid'];
    description = json['description'];
    identifier = json['identifier'];
    createdBy = json['createdBy'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    owner = json['owner'];
    if (json['task_list'] != null) {
      taskList = <TaskList>[];
      json['task_list'].forEach((v) {
        taskList!.add(new TaskList.fromJson(v));
      });
    }
    if (json['labels'] != null) {
      labels = <Labels>[];
      json['labels'].forEach((v) {
        labels!.add(new Labels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['emid'] = this.emid;
    data['description'] = this.description;
    data['identifier'] = this.identifier;
    data['createdBy'] = this.createdBy;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['owner'] = this.owner;
    if (this.taskList != null) {
      data['task_list'] = this.taskList!.map((v) => v.toJson()).toList();
    }
    if (this.labels != null) {
      data['labels'] = this.labels!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TaskList {
  int? id;
  int? projectId;
  int? assignedTo;
  String? taskName;
  String? taskDesc;
  String? tags;
  String? startDate;
  String? expectedEndDate;
  int? createdBy;
  String? updatedBy;
  String? priority;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? fname;
  String? mname;
  String? lname;

  TaskList(
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
        this.updatedAt,
        this.fname,
        this.mname,
        this.lname});

  TaskList.fromJson(Map<String, dynamic> json) {
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
    fname = json['fname'];
    mname = json['mname'];
    lname = json['lname'];
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
    data['fname'] = this.fname;
    data['mname'] = this.mname;
    data['lname'] = this.lname;
    return data;
  }
}

class Labels {
  String? title;
  int? count;

  Labels({this.title, this.count});

  Labels.fromJson(Map<String, dynamic> json) {
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
