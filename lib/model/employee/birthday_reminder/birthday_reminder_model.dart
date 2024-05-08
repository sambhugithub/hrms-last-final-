class BirthdayReminderModel {
  List<Data>? data;

  BirthdayReminderModel({this.data});

  BirthdayReminderModel.fromJson(Map<String, dynamic> json) {
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
  String? empFname;
  String? empMname;
  String? empLname;
  String? emPhone;
  String? profileimage;

  Data(
      {this.empFname,
        this.empMname,
        this.empLname,
        this.emPhone,
        this.profileimage});

  Data.fromJson(Map<String, dynamic> json) {
    empFname = json['emp_fname'];
    empMname = json['emp_mname'];
    empLname = json['emp_lname'];
    emPhone = json['em_phone'];
    profileimage = json['profileimage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emp_fname'] = this.empFname;
    data['emp_mname'] = this.empMname;
    data['emp_lname'] = this.empLname;
    data['em_phone'] = this.emPhone;
    data['profileimage'] = this.profileimage;
    return data;
  }
}
