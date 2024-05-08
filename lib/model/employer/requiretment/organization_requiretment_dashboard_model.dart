class OrganizationRequiretmentDashboardModel {
  int? flag;
  String? message;
  int? status;
  Data? data;

  OrganizationRequiretmentDashboardModel({this.flag, this.message, this.status, this.data});

  OrganizationRequiretmentDashboardModel.fromJson(Map<String, dynamic> json) {
    flag = json['flag'];
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['flag'] = flag;
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<JobApplied>? jobApplied;
  int? countJobApplied;
  List<ShortListed>? shortListed;
  int? countShortListed;
  List<CandidateInterview>? candidateInterview;
  int? countInterview;
  List<CandidateHired>? candidateHired;
  int? countHired;
  List<CandidateRej>? candidateRej;
  int? countReject;
  List<CandidateOffer>? candidateOffer;
  int? countOfferletter;
  List<CompanyJobPostInternal>? companyJobPostInternal;
  int? countPostInternal;
  List<CompanyJobPostExternal>? companyJobPostExternal;
  int? countPostExternal;

  Data({
    this.jobApplied,
    this.countJobApplied,
    this.shortListed,
    this.countShortListed,
    this.candidateInterview,
    this.countInterview,
    this.candidateHired,
    this.countHired,
    this.candidateRej,
    this.countReject,
    this.candidateOffer,
    this.countOfferletter,
    this.companyJobPostInternal,
    this.countPostInternal,
    this.companyJobPostExternal,
    this.countPostExternal,
  });

  Data.fromJson(Map<String, dynamic> json) {
    if (json['job_applied'] != null) {
      jobApplied = <JobApplied>[];
      json['job_applied'].forEach((v) {
        jobApplied!.add(JobApplied.fromJson(v));
      });
    }
    countJobApplied = json['count_job_applied'];
    if (json['short_listed'] != null) {
      shortListed = <ShortListed>[];
      json['short_listed'].forEach((v) {
        shortListed!.add(ShortListed.fromJson(v));
      });
    }
    countShortListed = json['count_short_listed'];
    if (json['candidate_interview'] != null) {
      candidateInterview = <CandidateInterview>[];
      json['candidate_interview'].forEach((v) {
        candidateInterview!.add(CandidateInterview.fromJson(v));
      });
    }
    countInterview = json['count_interview'];
    if (json['candidate_hired'] != null) {
      candidateHired = <CandidateHired>[];
      json['candidate_hired'].forEach((v) {
        candidateHired!.add(CandidateHired.fromJson(v));
      });
    }
    countHired = json['count_hired'];
    if (json['candidate_rej'] != null) {
      candidateRej = <CandidateRej>[];
      json['candidate_rej'].forEach((v) {
        candidateRej!.add(CandidateRej.fromJson(v));
      });
    }
    countReject = json['count_reject'];
    if (json['candidate_offer'] != null) {
      candidateOffer = <CandidateOffer>[];
      json['candidate_offer'].forEach((v) {
        candidateOffer!.add(CandidateOffer.fromJson(v));
      });
    }
    countOfferletter = json['count_offerletter'];
    if (json['company_job_post_internal'] != null) {
      companyJobPostInternal = <CompanyJobPostInternal>[];
      json['company_job_post_internal'].forEach((v) {
        companyJobPostInternal!.add(CompanyJobPostInternal.fromJson(v));
      });
    }
    countPostInternal = json['count_post_internal'];
    if (json['company_job_post_external'] != null) {
      companyJobPostExternal = <CompanyJobPostExternal>[];
      json['company_job_post_external'].forEach((v) {
        companyJobPostExternal!.add(CompanyJobPostExternal.fromJson(v));
      });
    }
    countPostExternal = json['count_post_external'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (jobApplied != null) {
      data['job_applied'] = jobApplied!.map((v) => v.toJson()).toList();
    }
    data['count_job_applied'] = countJobApplied;
    if (shortListed != null) {
      data['short_listed'] = shortListed!.map((v) => v.toJson()).toList();
    }
    data['count_short_listed'] = countShortListed;
    if (candidateInterview != null) {
      data['candidate_interview'] = candidateInterview!.map((v) => v.toJson()).toList();
    }
    data['count_interview'] = countInterview;
    if (candidateHired != null) {
      data['candidate_hired'] = candidateHired!.map((v) => v.toJson()).toList();
    }
    data['count_hired'] = countHired;
    if (candidateRej != null) {
      data['candidate_rej'] = candidateRej!.map((v) => v.toJson()).toList();
    }
    data['count_reject'] = countReject;
    if (candidateOffer != null) {
      data['candidate_offer'] = candidateOffer!.map((v) => v.toJson()).toList();
    }
    data['count_offerletter'] = countOfferletter;
    if (companyJobPostInternal != null) {
      data['company_job_post_internal'] = companyJobPostInternal!.map((v) => v.toJson()).toList();
    }
    data['count_post_internal'] = countPostInternal;
    if (companyJobPostExternal != null) {
      data['company_job_post_external'] = companyJobPostExternal!.map((v) => v.toJson()).toList();
    }
    data['count_post_external'] = countPostExternal;
    return data;
  }
}

class JobApplied {
  int? id;
  String? jobId;
  String? jobTitle;
  String? name;
  String? email;
  String? phone;
  String? exp;
  String? curOr;
  String? curDeg;
  String? sal;
  String? edu;
  String? skill;
  String? country;
  String? location;
  String? expSal;
  String? status;
  String? resume;
  String? coverLetter;
  String? remarks;
  String? date;
  String? gender;
  String? expMonth;
  String? skillLevel;
  String? uploadSh;
  String? zip;
  String? dob;
  String? apply;
  String? recruited;
  String? other;
  String? fromTime;
  String? toTime;
  String? place;
  String? panel;
  String? createDate;
  String? updateDate;
  String? jobCode;

  JobApplied({
    this.id,
    this.jobId,
    this.jobTitle,
    this.name,
    this.email,
    this.phone,
    this.exp,
    this.curOr,
    this.curDeg,
    this.sal,
    this.edu,
    this.skill,
    this.country,
    this.location,
    this.expSal,
    this.status,
    this.resume,
    this.coverLetter,
    this.remarks,
    this.date,
    this.gender,
    this.expMonth,
    this.skillLevel,
    this.uploadSh,
    this.zip,
    this.dob,
    this.apply,
    this.recruited,
    this.other,
    this.fromTime,
    this.toTime,
    this.place,
    this.panel,
    this.createDate,
    this.updateDate,
    this.jobCode,
  });

  JobApplied.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobId = json['job_id'];
    jobTitle = json['job_title'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    exp = json['exp'];
    curOr = json['cur_or'];
    curDeg = json['cur_deg'];
    sal = json['sal'];
    edu = json['edu'];
    skill = json['skill'];
    country = json['country'];
    location = json['location'];
    expSal = json['exp_sal'];
    status = json['status'];
    resume = json['resume'];
    coverLetter = json['cover_letter'];
    remarks = json['remarks'];
    date = json['date'];
    gender = json['gender'];
    expMonth = json['exp_month'];
    skillLevel = json['skill_level'];
    uploadSh = json['upload_sh'];
    zip = json['zip'];
    dob = json['dob'];
    apply = json['apply'];
    recruited = json['recruited'];
    other = json['other'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    place = json['place'];
    panel = json['panel'];
    createDate = json['createDate'];
    updateDate = json['updateDate'];
    jobCode = json['job_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job_id'] = jobId;
    data['job_title'] = jobTitle;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['exp'] = exp;
    data['cur_or'] = curOr;
    data['cur_deg'] = curDeg;
    data['sal'] = sal;
    data['edu'] = edu;
    data['skill'] = skill;
    data['country'] = country;
    data['location'] = location;
    data['exp_sal'] = expSal;
    data['status'] = status;
    data['resume'] = resume;
    data['cover_letter'] = coverLetter;
    data['remarks'] = remarks;
    data['date'] = date;
    data['gender'] = gender;
    data['exp_month'] = expMonth;
    data['skill_level'] = skillLevel;
    data['upload_sh'] = uploadSh;
    data['zip'] = zip;
    data['dob'] = dob;
    data['apply'] = apply;
    data['recruited'] = recruited;
    data['other'] = other;
    data['from_time'] = fromTime;
    data['to_time'] = toTime;
    data['place'] = place;
    data['panel'] = panel;
    data['createDate'] = createDate;
    data['updateDate'] = updateDate;
    data['job_code'] = jobCode;
    return data;
  }
}

class CandidateOffer {
  int? id;
  String? jobId;
  String? jobTitle;
  String? name;
  String? email;
  String? phone;
  String? exp;
  String? curOr;
  String? curDeg;
  String? sal;
  String? edu;
  String? skill;
  String? country;
  String? location;
  String? expSal;
  String? status;
  String? resume;
  String? coverLetter;
  String? remarks;
  String? date;
  String? gender;
  String? expMonth;
  String? userId;
  String? uploadSh;
  String? offeredSal;
  String? dateJo;
  String? crDate;
  String? domPdf;
  String? reportauthor;
  String? paymentType;
  String? zip;
  String? jobCode;

  CandidateOffer({
    this.id,
    this.jobId,
    this.jobTitle,
    this.name,
    this.email,
    this.phone,
    this.exp,
    this.curOr,
    this.curDeg,
    this.sal,
    this.edu,
    this.skill,
    this.country,
    this.location,
    this.expSal,
    this.status,
    this.resume,
    this.coverLetter,
    this.remarks,
    this.date,
    this.gender,
    this.expMonth,
    this.userId,
    this.uploadSh,
    this.offeredSal,
    this.dateJo,
    this.crDate,
    this.domPdf,
    this.reportauthor,
    this.paymentType,
    this.zip,
    this.jobCode,
  });

  CandidateOffer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobId = json['job_id'];
    jobTitle = json['job_title'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    exp = json['exp'];
    curOr = json['cur_or'];
    curDeg = json['cur_deg'];
    sal = json['sal'];
    edu = json['edu'];
    skill = json['skill'];
    country = json['country'];
    location = json['location'];
    expSal = json['exp_sal'];
    status = json['status'];
    resume = json['resume'];
    coverLetter = json['cover_letter'];
    remarks = json['remarks'];
    date = json['date'];
    gender = json['gender'];
    expMonth = json['exp_month'];
    userId = json['user_id'];
    uploadSh = json['upload_sh'];
    offeredSal = json['offered_sal'];
    dateJo = json['date_jo'];
    crDate = json['cr_date'];
    domPdf = json['dom_pdf'];
    reportauthor = json['reportauthor'];
    paymentType = json['payment_type'];
    zip = json['zip'];
    jobCode = json['job_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job_id'] = jobId;
    data['job_title'] = jobTitle;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['exp'] = exp;
    data['cur_or'] = curOr;
    data['cur_deg'] = curDeg;
    data['sal'] = sal;
    data['edu'] = edu;
    data['skill'] = skill;
    data['country'] = country;
    data['location'] = location;
    data['exp_sal'] = expSal;
    data['status'] = status;
    data['resume'] = resume;
    data['cover_letter'] = coverLetter;
    data['remarks'] = remarks;
    data['date'] = date;
    data['gender'] = gender;
    data['exp_month'] = expMonth;
    data['user_id'] = userId;
    data['upload_sh'] = uploadSh;
    data['offered_sal'] = offeredSal;
    data['date_jo'] = dateJo;
    data['cr_date'] = crDate;
    data['dom_pdf'] = domPdf;
    data['reportauthor'] = reportauthor;
    data['payment_type'] = paymentType;
    data['zip'] = zip;
    data['job_code'] = jobCode;
    return data;
  }
}

class ShortListed {
  int? id;
  String? jobId;
  String? jobTitle;
  String? name;
  String? email;
  String? phone;
  String? exp;
  String? curOr;
  String? curDeg;
  String? sal;
  String? edu;
  String? skill;
  String? country;
  String? location;
  String? expSal;
  String? status;
  String? resume;
  String? coverLetter;
  String? remarks;
  String? date;
  String? gender;
  String? expMonth;
  String? skillLevel;
  String? uploadSh;
  String? zip;
  String? dob;
  String? apply;
  String? recruited;
  String? other;
  String? fromTime;
  String? toTime;
  String? place;
  String? panel;
  String? createDate;
  String? updateDate;
  String? jobCode;

  ShortListed({
    this.id,
    this.jobId,
    this.jobTitle,
    this.name,
    this.email,
    this.phone,
    this.exp,
    this.curOr,
    this.curDeg,
    this.sal,
    this.edu,
    this.skill,
    this.country,
    this.location,
    this.expSal,
    this.status,
    this.resume,
    this.coverLetter,
    this.remarks,
    this.date,
    this.gender,
    this.expMonth,
    this.skillLevel,
    this.uploadSh,
    this.zip,
    this.dob,
    this.apply,
    this.recruited,
    this.other,
    this.fromTime,
    this.toTime,
    this.place,
    this.panel,
    this.createDate,
    this.updateDate,
    this.jobCode,
});

  ShortListed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobId = json['job_id'];
    jobTitle = json['job_title'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    exp = json['exp'];
    curOr = json['cur_or'];
    curDeg = json['cur_deg'];
    sal = json['sal'];
    edu = json['edu'];
    skill = json['skill'];
    country = json['country'];
    location = json['location'];
    expSal = json['exp_sal'];
    status = json['status'];
    resume = json['resume'];
    coverLetter = json['cover_letter'];
    remarks = json['remarks'];
    date = json['date'];
    gender = json['gender'];
    expMonth = json['exp_month'];
    skillLevel = json['skill_level'];
    uploadSh = json['upload_sh'];
    zip = json['zip'];
    dob = json['dob'];
    apply = json['apply'];
    recruited = json['recruited'];
    other = json['other'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    place = json['place'];
    panel = json['panel'];
    createDate = json['createDate'];
    updateDate = json['updateDate'];
    jobCode = json['job_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job_id'] = jobId;
    data['job_title'] = jobTitle;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['exp'] = exp;
    data['cur_or'] = curOr;
    data['cur_deg'] = curDeg;
    data['sal'] = sal;
    data['edu'] = edu;
    data['skill'] = skill;
    data['country'] = country;
    data['location'] = location;
    data['exp_sal'] = expSal;
    data['status'] = status;
    data['resume'] = resume;
    data['cover_letter'] = coverLetter;
    data['remarks'] = remarks;
    data['date'] = date;
    data['gender'] = gender;
    data['exp_month'] = expMonth;
    data['skill_level'] = skillLevel;
    data['upload_sh'] = uploadSh;
    data['zip'] = zip;
    data['dob'] = dob;
    data['apply'] = apply;
    data['recruited'] = recruited;
    data['other'] = other;
    data['from_time'] = fromTime;
    data['to_time'] = toTime;
    data['place'] = place;
    data['panel'] = panel;
    data['createDate'] = createDate;
    data['updateDate'] = updateDate;
    data['job_code'] = jobCode;
    return data;
  }
  // Define your properties here
  // Add constructor and toJson method if needed
}

class CandidateInterview {
  int? id;
  String? jobId;
  String? jobTitle;
  String? name;
  String? email;
  String? phone;
  String? exp;
  String? curOr;
  String? curDeg;
  String? sal;
  String? edu;
  String? skill;
  String? country;
  String? location;
  String? expSal;
  String? status;
  String? resume;
  String? coverLetter;
  String? remarks;
  String? date;
  String? gender;
  String? expMonth;
  String? skillLevel;
  String? uploadSh;
  String? zip;
  String? dob;
  String? apply;
  String? recruited;
  String? other;
  String? fromTime;
  String? toTime;
  String? place;
  String? panel;
  String? createDate;
  String? updateDate;
  String? jobCode;

  CandidateInterview({
    this.id,
    this.jobId,
    this.jobTitle,
    this.name,
    this.email,
    this.phone,
    this.exp,
    this.curOr,
    this.curDeg,
    this.sal,
    this.edu,
    this.skill,
    this.country,
    this.location,
    this.expSal,
    this.status,
    this.resume,
    this.coverLetter,
    this.remarks,
    this.date,
    this.gender,
    this.expMonth,
    this.skillLevel,
    this.uploadSh,
    this.zip,
    this.dob,
    this.apply,
    this.recruited,
    this.other,
    this.fromTime,
    this.toTime,
    this.place,
    this.panel,
    this.createDate,
    this.updateDate,
    this.jobCode,
  });

  CandidateInterview.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobId = json['job_id'];
    jobTitle = json['job_title'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    exp = json['exp'];
    curOr = json['cur_or'];
    curDeg = json['cur_deg'];
    sal = json['sal'];
    edu = json['edu'];
    skill = json['skill'];
    country = json['country'];
    location = json['location'];
    expSal = json['exp_sal'];
    status = json['status'];
    resume = json['resume'];
    coverLetter = json['cover_letter'];
    remarks = json['remarks'];
    date = json['date'];
    gender = json['gender'];
    expMonth = json['exp_month'];
    skillLevel = json['skill_level'];
    uploadSh = json['upload_sh'];
    zip = json['zip'];
    dob = json['dob'];
    apply = json['apply'];
    recruited = json['recruited'];
    other = json['other'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    place = json['place'];
    panel = json['panel'];
    createDate = json['createDate'];
    updateDate = json['updateDate'];
    jobCode = json['job_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job_id'] = jobId;
    data['job_title'] = jobTitle;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['exp'] = exp;
    data['cur_or'] = curOr;
    data['cur_deg'] = curDeg;
    data['sal'] = sal;
    data['edu'] = edu;
    data['skill'] = skill;
    data['country'] = country;
    data['location'] = location;
    data['exp_sal'] = expSal;
    data['status'] = status;
    data['resume'] = resume;
    data['cover_letter'] = coverLetter;
    data['remarks'] = remarks;
    data['date'] = date;
    data['gender'] = gender;
    data['exp_month'] = expMonth;
    data['skill_level'] = skillLevel;
    data['upload_sh'] = uploadSh;
    data['zip'] = zip;
    data['dob'] = dob;
    data['apply'] = apply;
    data['recruited'] = recruited;
    data['other'] = other;
    data['from_time'] = fromTime;
    data['to_time'] = toTime;
    data['place'] = place;
    data['panel'] = panel;
    data['createDate'] = createDate;
    data['updateDate'] = updateDate;
    data['job_code'] = jobCode;
    return data;
  }
  // Define your properties here
  // Add constructor and toJson method if needed
}

class CandidateHired {
  int? id;
  String? jobId;
  String? jobTitle;
  String? name;
  String? email;
  String? phone;
  String? exp;
  String? curOr;
  String? curDeg;
  String? sal;
  String? edu;
  String? skill;
  String? country;
  String? location;
  String? expSal;
  String? status;
  String? resume;
  String? coverLetter;
  String? remarks;
  String? date;
  String? gender;
  String? expMonth;
  String? skillLevel;
  String? uploadSh;
  String? zip;
  String? dob;
  String? apply;
  String? recruited;
  String? other;
  String? fromTime;
  String? toTime;
  String? place;
  String? panel;
  String? createDate;
  String? updateDate;
  String? jobCode;

  CandidateHired({
    this.id,
    this.jobId,
    this.jobTitle,
    this.name,
    this.email,
    this.phone,
    this.exp,
    this.curOr,
    this.curDeg,
    this.sal,
    this.edu,
    this.skill,
    this.country,
    this.location,
    this.expSal,
    this.status,
    this.resume,
    this.coverLetter,
    this.remarks,
    this.date,
    this.gender,
    this.expMonth,
    this.skillLevel,
    this.uploadSh,
    this.zip,
    this.dob,
    this.apply,
    this.recruited,
    this.other,
    this.fromTime,
    this.toTime,
    this.place,
    this.panel,
    this.createDate,
    this.updateDate,
    this.jobCode,
  });

  CandidateHired.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobId = json['job_id'];
    jobTitle = json['job_title'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    exp = json['exp'];
    curOr = json['cur_or'];
    curDeg = json['cur_deg'];
    sal = json['sal'];
    edu = json['edu'];
    skill = json['skill'];
    country = json['country'];
    location = json['location'];
    expSal = json['exp_sal'];
    status = json['status'];
    resume = json['resume'];
    coverLetter = json['cover_letter'];
    remarks = json['remarks'];
    date = json['date'];
    gender = json['gender'];
    expMonth = json['exp_month'];
    skillLevel = json['skill_level'];
    uploadSh = json['upload_sh'];
    zip = json['zip'];
    dob = json['dob'];
    apply = json['apply'];
    recruited = json['recruited'];
    other = json['other'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    place = json['place'];
    panel = json['panel'];
    createDate = json['createDate'];
    updateDate = json['updateDate'];
    jobCode = json['job_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job_id'] = jobId;
    data['job_title'] = jobTitle;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['exp'] = exp;
    data['cur_or'] = curOr;
    data['cur_deg'] = curDeg;
    data['sal'] = sal;
    data['edu'] = edu;
    data['skill'] = skill;
    data['country'] = country;
    data['location'] = location;
    data['exp_sal'] = expSal;
    data['status'] = status;
    data['resume'] = resume;
    data['cover_letter'] = coverLetter;
    data['remarks'] = remarks;
    data['date'] = date;
    data['gender'] = gender;
    data['exp_month'] = expMonth;
    data['skill_level'] = skillLevel;
    data['upload_sh'] = uploadSh;
    data['zip'] = zip;
    data['dob'] = dob;
    data['apply'] = apply;
    data['recruited'] = recruited;
    data['other'] = other;
    data['from_time'] = fromTime;
    data['to_time'] = toTime;
    data['place'] = place;
    data['panel'] = panel;
    data['createDate'] = createDate;
    data['updateDate'] = updateDate;
    data['job_code'] = jobCode;
    return data;
  }
  // Define your properties here
  // Add constructor and toJson method if needed
}

class CandidateRej {
  int? id;
  String? jobId;
  String? jobTitle;
  String? name;
  String? email;
  String? phone;
  String? exp;
  String? curOr;
  String? curDeg;
  String? sal;
  String? edu;
  String? skill;
  String? country;
  String? location;
  String? expSal;
  String? status;
  String? resume;
  String? coverLetter;
  String? remarks;
  String? date;
  String? gender;
  String? expMonth;
  String? skillLevel;
  String? uploadSh;
  String? zip;
  String? dob;
  String? apply;
  String? recruited;
  String? other;
  String? fromTime;
  String? toTime;
  String? place;
  String? panel;
  String? createDate;
  String? updateDate;
  String? jobCode;

  CandidateRej({
    this.id,
    this.jobId,
    this.jobTitle,
    this.name,
    this.email,
    this.phone,
    this.exp,
    this.curOr,
    this.curDeg,
    this.sal,
    this.edu,
    this.skill,
    this.country,
    this.location,
    this.expSal,
    this.status,
    this.resume,
    this.coverLetter,
    this.remarks,
    this.date,
    this.gender,
    this.expMonth,
    this.skillLevel,
    this.uploadSh,
    this.zip,
    this.dob,
    this.apply,
    this.recruited,
    this.other,
    this.fromTime,
    this.toTime,
    this.place,
    this.panel,
    this.createDate,
    this.updateDate,
    this.jobCode,
  });

  CandidateRej.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobId = json['job_id'];
    jobTitle = json['job_title'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    exp = json['exp'];
    curOr = json['cur_or'];
    curDeg = json['cur_deg'];
    sal = json['sal'];
    edu = json['edu'];
    skill = json['skill'];
    country = json['country'];
    location = json['location'];
    expSal = json['exp_sal'];
    status = json['status'];
    resume = json['resume'];
    coverLetter = json['cover_letter'];
    remarks = json['remarks'];
    date = json['date'];
    gender = json['gender'];
    expMonth = json['exp_month'];
    skillLevel = json['skill_level'];
    uploadSh = json['upload_sh'];
    zip = json['zip'];
    dob = json['dob'];
    apply = json['apply'];
    recruited = json['recruited'];
    other = json['other'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    place = json['place'];
    panel = json['panel'];
    createDate = json['createDate'];
    updateDate = json['updateDate'];
    jobCode = json['job_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job_id'] = jobId;
    data['job_title'] = jobTitle;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['exp'] = exp;
    data['cur_or'] = curOr;
    data['cur_deg'] = curDeg;
    data['sal'] = sal;
    data['edu'] = edu;
    data['skill'] = skill;
    data['country'] = country;
    data['location'] = location;
    data['exp_sal'] = expSal;
    data['status'] = status;
    data['resume'] = resume;
    data['cover_letter'] = coverLetter;
    data['remarks'] = remarks;
    data['date'] = date;
    data['gender'] = gender;
    data['exp_month'] = expMonth;
    data['skill_level'] = skillLevel;
    data['upload_sh'] = uploadSh;
    data['zip'] = zip;
    data['dob'] = dob;
    data['apply'] = apply;
    data['recruited'] = recruited;
    data['other'] = other;
    data['from_time'] = fromTime;
    data['to_time'] = toTime;
    data['place'] = place;
    data['panel'] = panel;
    data['createDate'] = createDate;
    data['updateDate'] = updateDate;
    data['job_code'] = jobCode;
    return data;
  }
  // Define your properties here
  // Add constructor and toJson method if needed
}

class CompanyJobPostInternal {
  int? id;
  String? jobId;
  String? jobTitle;
  String? name;
  String? email;
  String? phone;
  String? exp;
  String? curOr;
  String? curDeg;
  String? sal;
  String? edu;
  String? skill;
  String? country;
  String? location;
  String? expSal;
  String? status;
  String? resume;
  String? coverLetter;
  String? remarks;
  String? date;
  String? gender;
  String? expMonth;
  String? skillLevel;
  String? uploadSh;
  String? zip;
  String? dob;
  String? apply;
  String? recruited;
  String? other;
  String? fromTime;
  String? toTime;
  String? place;
  String? panel;
  String? createDate;
  String? updateDate;
  String? jobCode;

  CompanyJobPostInternal({
    this.id,
    this.jobId,
    this.jobTitle,
    this.name,
    this.email,
    this.phone,
    this.exp,
    this.curOr,
    this.curDeg,
    this.sal,
    this.edu,
    this.skill,
    this.country,
    this.location,
    this.expSal,
    this.status,
    this.resume,
    this.coverLetter,
    this.remarks,
    this.date,
    this.gender,
    this.expMonth,
    this.skillLevel,
    this.uploadSh,
    this.zip,
    this.dob,
    this.apply,
    this.recruited,
    this.other,
    this.fromTime,
    this.toTime,
    this.place,
    this.panel,
    this.createDate,
    this.updateDate,
    this.jobCode,
  });

  CompanyJobPostInternal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobId = json['job_id'];
    jobTitle = json['job_title'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    exp = json['exp'];
    curOr = json['cur_or'];
    curDeg = json['cur_deg'];
    sal = json['sal'];
    edu = json['edu'];
    skill = json['skill'];
    country = json['country'];
    location = json['location'];
    expSal = json['exp_sal'];
    status = json['status'];
    resume = json['resume'];
    coverLetter = json['cover_letter'];
    remarks = json['remarks'];
    date = json['date'];
    gender = json['gender'];
    expMonth = json['exp_month'];
    skillLevel = json['skill_level'];
    uploadSh = json['upload_sh'];
    zip = json['zip'];
    dob = json['dob'];
    apply = json['apply'];
    recruited = json['recruited'];
    other = json['other'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    place = json['place'];
    panel = json['panel'];
    createDate = json['createDate'];
    updateDate = json['updateDate'];
    jobCode = json['job_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job_id'] = jobId;
    data['job_title'] = jobTitle;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['exp'] = exp;
    data['cur_or'] = curOr;
    data['cur_deg'] = curDeg;
    data['sal'] = sal;
    data['edu'] = edu;
    data['skill'] = skill;
    data['country'] = country;
    data['location'] = location;
    data['exp_sal'] = expSal;
    data['status'] = status;
    data['resume'] = resume;
    data['cover_letter'] = coverLetter;
    data['remarks'] = remarks;
    data['date'] = date;
    data['gender'] = gender;
    data['exp_month'] = expMonth;
    data['skill_level'] = skillLevel;
    data['upload_sh'] = uploadSh;
    data['zip'] = zip;
    data['dob'] = dob;
    data['apply'] = apply;
    data['recruited'] = recruited;
    data['other'] = other;
    data['from_time'] = fromTime;
    data['to_time'] = toTime;
    data['place'] = place;
    data['panel'] = panel;
    data['createDate'] = createDate;
    data['updateDate'] = updateDate;
    data['job_code'] = jobCode;
    return data;
  }
  // Define your properties here
  // Add constructor and toJson method if needed
}

class CompanyJobPostExternal {
  int? id;
  String? jobId;
  String? jobTitle;
  String? name;
  String? email;
  String? phone;
  String? exp;
  String? curOr;
  String? curDeg;
  String? sal;
  String? edu;
  String? skill;
  String? country;
  String? location;
  String? expSal;
  String? status;
  String? resume;
  String? coverLetter;
  String? remarks;
  String? date;
  String? gender;
  String? expMonth;
  String? skillLevel;
  String? uploadSh;
  String? zip;
  String? dob;
  String? apply;
  String? recruited;
  String? other;
  String? fromTime;
  String? toTime;
  String? place;
  String? panel;
  String? createDate;
  String? updateDate;
  String? jobCode;

  CompanyJobPostExternal({
    this.id,
    this.jobId,
    this.jobTitle,
    this.name,
    this.email,
    this.phone,
    this.exp,
    this.curOr,
    this.curDeg,
    this.sal,
    this.edu,
    this.skill,
    this.country,
    this.location,
    this.expSal,
    this.status,
    this.resume,
    this.coverLetter,
    this.remarks,
    this.date,
    this.gender,
    this.expMonth,
    this.skillLevel,
    this.uploadSh,
    this.zip,
    this.dob,
    this.apply,
    this.recruited,
    this.other,
    this.fromTime,
    this.toTime,
    this.place,
    this.panel,
    this.createDate,
    this.updateDate,
    this.jobCode,
  });

  CompanyJobPostExternal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobId = json['job_id'];
    jobTitle = json['job_title'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    exp = json['exp'];
    curOr = json['cur_or'];
    curDeg = json['cur_deg'];
    sal = json['sal'];
    edu = json['edu'];
    skill = json['skill'];
    country = json['country'];
    location = json['location'];
    expSal = json['exp_sal'];
    status = json['status'];
    resume = json['resume'];
    coverLetter = json['cover_letter'];
    remarks = json['remarks'];
    date = json['date'];
    gender = json['gender'];
    expMonth = json['exp_month'];
    skillLevel = json['skill_level'];
    uploadSh = json['upload_sh'];
    zip = json['zip'];
    dob = json['dob'];
    apply = json['apply'];
    recruited = json['recruited'];
    other = json['other'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    place = json['place'];
    panel = json['panel'];
    createDate = json['createDate'];
    updateDate = json['updateDate'];
    jobCode = json['job_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job_id'] = jobId;
    data['job_title'] = jobTitle;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['exp'] = exp;
    data['cur_or'] = curOr;
    data['cur_deg'] = curDeg;
    data['sal'] = sal;
    data['edu'] = edu;
    data['skill'] = skill;
    data['country'] = country;
    data['location'] = location;
    data['exp_sal'] = expSal;
    data['status'] = status;
    data['resume'] = resume;
    data['cover_letter'] = coverLetter;
    data['remarks'] = remarks;
    data['date'] = date;
    data['gender'] = gender;
    data['exp_month'] = expMonth;
    data['skill_level'] = skillLevel;
    data['upload_sh'] = uploadSh;
    data['zip'] = zip;
    data['dob'] = dob;
    data['apply'] = apply;
    data['recruited'] = recruited;
    data['other'] = other;
    data['from_time'] = fromTime;
    data['to_time'] = toTime;
    data['place'] = place;
    data['panel'] = panel;
    data['createDate'] = createDate;
    data['updateDate'] = updateDate;
    data['job_code'] = jobCode;
    return data;
  }
  // Define your properties here
  // Add constructor and toJson method if needed
}
