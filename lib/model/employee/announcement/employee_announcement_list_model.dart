class EmployeeAnnouncementListModel {
  List<Data>? data;

  EmployeeAnnouncementListModel({this.data});

  EmployeeAnnouncementListModel.fromJson(Map<String, dynamic> json) {
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
  String? announcementTitle;
  String? announcementDesc;
  String? image;

  Data({this.announcementTitle, this.announcementDesc, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    announcementTitle = json['announcement_title'];
    announcementDesc = json['announcement_desc'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['announcement_title'] = this.announcementTitle;
    data['announcement_desc'] = this.announcementDesc;
    data['image'] = this.image;
    return data;
  }
}
