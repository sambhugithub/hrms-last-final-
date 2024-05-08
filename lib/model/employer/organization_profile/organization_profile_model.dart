class OrganizationProfileDashboardModel {
  int? flag;
  String? message;
  int? status;
  Data? data;

  OrganizationProfileDashboardModel(
      {this.flag, this.message, this.status, this.data});

  OrganizationProfileDashboardModel.fromJson(Map<String, dynamic> json) {
    flag = json['flag'];
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flag'] = this.flag;
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Roledata? roledata;
  int? companyRtiCount;
  List<CompanyRti>? companyRti;
  int? authorizingOfficerCount;
  List<AuthorizingOfficer>? authorizingOfficer;
  int? employeeKeyLinkCount;
  List<EmployeeKeyLink>? employeeKeyLink;

  Data(
      {this.roledata,
        this.companyRtiCount,
        this.companyRti,
        this.authorizingOfficerCount,
        this.authorizingOfficer,
        this.employeeKeyLinkCount,
        this.employeeKeyLink});

  Data.fromJson(Map<String, dynamic> json) {
    roledata = json['Roledata'] != null
        ? new Roledata.fromJson(json['Roledata'])
        : null;
    companyRtiCount = json['company_rti_count'];
    if (json['company_rti'] != null) {
      companyRti = <CompanyRti>[];
      json['company_rti'].forEach((v) {
        companyRti!.add(new CompanyRti.fromJson(v));
      });
    }
    authorizingOfficerCount = json['Authorizing_Officer_count'];
    if (json['Authorizing_Officer'] != null) {
      authorizingOfficer = <AuthorizingOfficer>[];
      json['Authorizing_Officer'].forEach((v) {
        authorizingOfficer!.add(new AuthorizingOfficer.fromJson(v));
      });
    }
    employeeKeyLinkCount = json['employee_key_link_count'];
    if (json['employee_key_link'] != null) {
      employeeKeyLink = <EmployeeKeyLink>[];
      json['employee_key_link'].forEach((v) {
        employeeKeyLink!.add(new EmployeeKeyLink.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.roledata != null) {
      data['Roledata'] = this.roledata!.toJson();
    }
    data['company_rti_count'] = this.companyRtiCount;
    if (this.companyRti != null) {
      data['company_rti'] = this.companyRti!.map((v) => v.toJson()).toList();
    }
    data['Authorizing_Officer_count'] = this.authorizingOfficerCount;
    if (this.authorizingOfficer != null) {
      data['Authorizing_Officer'] =
          this.authorizingOfficer!.map((v) => v.toJson()).toList();
    }
    data['employee_key_link_count'] = this.employeeKeyLinkCount;
    if (this.employeeKeyLink != null) {
      data['employee_key_link'] =
          this.employeeKeyLink!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class EmployeeKeyLink {
  String? comName;
  String? fName;
  String? lName;
  String? email;
  String? pNo;
  String? pass;
  String? reg;
  String? fax;
  String? address;
  String? website;
  String? pan;
  String? logo;
  String? desig;
  String? comReg;
  String? comType;
  String? comYear;
  String? comNat;
  String? noEm;
  String? workPer;
  String? noDire;
  String? country;
  String? currency;
  String? bankName;
  String? acconutName;
  String? sortCode;
  String? othersType;
  String? natureType;
  String? noEmWork;
  String? conNum;
  String? authemail;
  String? tradName;
  String? address2;
  String? road;
  String? city;
  String? zip;
  String? status;
  String? verify;
  String? updatedAt;
  String? createdAt;
  String? employeeLink;
  String? licence;
  String? proof;
  String? sunStatus;
  String? sunTime;
  String? monStatus;
  String? monTime;
  String? tueStatus;
  String? tueTime;
  String? wedStatus;
  String? thuStatus;
  String? thuTime;
  String? friStatus;
  String? friTime;
  String? satStatus;
  String? satTime;
  String? sunClose;
  String? monClose;
  String? tueClose;
  String? wedClose;
  String? thuClose;
  String? friClose;
  String? satClose;
  String? tradStatus;
  String? tradOther;
  String? penltyStatus;
  String? penltyOther;
  String? bankStatus;
  String? bankOther;
  String? keyFName;
  String? keyFLname;
  String? keyDesignation;
  String? keyPhone;
  String? keyEmail;
  String? keyProof;
  String? keyBankStatus;
  String? keyBankOther;
  String? levelFName;
  String? levelFLname;
  String? levelDesignation;
  String? levelPhone;
  String? levelEmail;
  String? levelProof;
  String? levelBankStatus;
  String? levelBankOther;
  String? keyPerson;
  String? levelPerson;
  String? organEmail;
  String? land;
  String? licenseType;
  String? inactiveRemarks;
  String? verifiedOn;
  String? slAppliedOn;
  String? agentId;

  EmployeeKeyLink({this.comName,
    this.fName,
    this.lName,
    this.email,
    this.pNo,
    this.pass,
    this.reg,
    this.fax,
    this.address,
    this.website,
    this.pan,
    this.logo,
    this.desig,
    this.comReg,
    this.comType,
    this.comYear,
    this.comNat,
    this.noEm,
    this.workPer,
    this.noDire,
    this.country,
    this.currency,
    this.bankName,
    this.acconutName,
    this.sortCode,
    this.othersType,
    this.natureType,
    this.noEmWork,
    this.conNum,
    this.authemail,
    this.tradName,
    this.address2,
    this.road,
    this.city,
    this.zip,
    this.status,
    this.verify,
    this.updatedAt,
    this.createdAt,
    this.employeeLink,
    this.licence,
    this.proof,
    this.sunStatus,
    this.sunTime,
    this.monStatus,
    this.monTime,
    this.tueStatus,
    this.tueTime,
    this.wedStatus,
    this.thuStatus,
    this.thuTime,
    this.friStatus,
    this.friTime,
    this.satStatus,
    this.satTime,
    this.sunClose,
    this.monClose,
    this.tueClose,
    this.wedClose,
    this.thuClose,
    this.friClose,
    this.satClose,
    this.tradStatus,
    this.tradOther,
    this.penltyStatus,
    this.penltyOther,
    this.bankStatus,
    this.bankOther,
    this.keyFName,
    this.keyFLname,
    this.keyDesignation,
    this.keyPhone,
    this.keyEmail,
    this.keyProof,
    this.keyBankStatus,
    this.keyBankOther,
    this.levelFName,
    this.levelFLname,
    this.levelDesignation,
    this.levelPhone,
    this.levelEmail,
    this.levelProof,
    this.levelBankStatus,
    this.levelBankOther,
    this.keyPerson,
    this.levelPerson,
    this.organEmail,
    this.land,
    this.licenseType,
    this.inactiveRemarks,
    this.verifiedOn,
    this.slAppliedOn,
    this.agentId});

  EmployeeKeyLink.fromJson(Map<String, dynamic> json) {
    comName = json['com_name'];
    fName = json['f_name'];
    lName = json['l_name'];
    email = json['email'];
    pNo = json['p_no'];
    pass = json['pass'];
    reg = json['reg'];
    fax = json['fax'];
    address = json['address'];
    website = json['website'];
    pan = json['pan'];
    logo = json['logo'];
    desig = json['desig'];
    comReg = json['com_reg'];
    comType = json['com_type'];
    comYear = json['com_year'];
    comNat = json['com_nat'];
    noEm = json['no_em'];
    workPer = json['work_per'];
    noDire = json['no_dire'];
    country = json['country'];
    currency = json['currency'];
    bankName = json['bank_name'];
    acconutName = json['acconut_name'];
    sortCode = json['sort_code'];
    othersType = json['others_type'];
    natureType = json['nature_type'];
    noEmWork = json['no_em_work'];
    conNum = json['con_num'];
    authemail = json['authemail'];
    tradName = json['trad_name'];
    address2 = json['address2'];
    road = json['road'];
    city = json['city'];
    zip = json['zip'];
    status = json['status'];
    verify = json['verify'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    employeeLink = json['employee_link'];
    licence = json['licence'];
    proof = json['proof'];
    sunStatus = json['sun_status'];
    sunTime = json['sun_time'];
    monStatus = json['mon_status'];
    monTime = json['mon_time'];
    tueStatus = json['tue_status'];
    tueTime = json['tue_time'];
    wedStatus = json['wed_status'];
    thuStatus = json['thu_status'];
    thuTime = json['thu_time'];
    friStatus = json['fri_status'];
    friTime = json['fri_time'];
    satStatus = json['sat_status'];
    satTime = json['sat_time'];
    sunClose = json['sun_close'];
    monClose = json['mon_close'];
    tueClose = json['tue_close'];
    wedClose = json['wed_close'];
    thuClose = json['thu_close'];
    friClose = json['fri_close'];
    satClose = json['sat_close'];
    tradStatus = json['trad_status'];
    tradOther = json['trad_other'];
    penltyStatus = json['penlty_status'];
    penltyOther = json['penlty_other'];
    bankStatus = json['bank_status'];
    bankOther = json['bank_other'];
    keyFName = json['key_f_name'];
    keyFLname = json['key_f_lname'];
    keyDesignation = json['key_designation'];
    keyPhone = json['key_phone'];
    keyEmail = json['key_email'];
    keyProof = json['key_proof'];
    keyBankStatus = json['key_bank_status'];
    keyBankOther = json['key_bank_other'];
    levelFName = json['level_f_name'];
    levelFLname = json['level_f_lname'];
    levelDesignation = json['level_designation'];
    levelPhone = json['level_phone'];
    levelEmail = json['level_email'];
    levelProof = json['level_proof'];
    levelBankStatus = json['level_bank_status'];
    levelBankOther = json['level_bank_other'];
    keyPerson = json['key_person'];
    levelPerson = json['level_person'];
    organEmail = json['organ_email'];
    land = json['land'];
    licenseType = json['license_type'];
    inactiveRemarks = json['inactive_remarks'];
    verifiedOn = json['verified_on'];
    slAppliedOn = json['sl_applied_on'];
    agentId = json['agent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['com_name'] = this.comName;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['email'] = this.email;
    data['p_no'] = this.pNo;
    data['pass'] = this.pass;
    data['reg'] = this.reg;
    data['fax'] = this.fax;
    data['address'] = this.address;
    data['website'] = this.website;
    data['pan'] = this.pan;
    data['logo'] = this.logo;
    data['desig'] = this.desig;
    data['com_reg'] = this.comReg;
    data['com_type'] = this.comType;
    data['com_year'] = this.comYear;
    data['com_nat'] = this.comNat;
    data['no_em'] = this.noEm;
    data['work_per'] = this.workPer;
    data['no_dire'] = this.noDire;
    data['country'] = this.country;
    data['currency'] = this.currency;
    data['bank_name'] = this.bankName;
    data['acconut_name'] = this.acconutName;
    data['sort_code'] = this.sortCode;
    data['others_type'] = this.othersType;
    data['nature_type'] = this.natureType;
    data['no_em_work'] = this.noEmWork;
    data['con_num'] = this.conNum;
    data['authemail'] = this.authemail;
    data['trad_name'] = this.tradName;
    data['address2'] = this.address2;
    data['road'] = this.road;
    data['city'] = this.city;
    data['zip'] = this.zip;
    data['status'] = this.status;
    data['verify'] = this.verify;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['employee_link'] = this.employeeLink;
    data['licence'] = this.licence;
    data['proof'] = this.proof;
    data['sun_status'] = this.sunStatus;
    data['sun_time'] = this.sunTime;
    data['mon_status'] = this.monStatus;
    data['mon_time'] = this.monTime;
    data['tue_status'] = this.tueStatus;
    data['tue_time'] = this.tueTime;
    data['wed_status'] = this.wedStatus;
    data['thu_status'] = this.thuStatus;
    data['thu_time'] = this.thuTime;
    data['fri_status'] = this.friStatus;
    data['fri_time'] = this.friTime;
    data['sat_status'] = this.satStatus;
    data['sat_time'] = this.satTime;
    data['sun_close'] = this.sunClose;
    data['mon_close'] = this.monClose;
    data['tue_close'] = this.tueClose;
    data['wed_close'] = this.wedClose;
    data['thu_close'] = this.thuClose;
    data['fri_close'] = this.friClose;
    data['sat_close'] = this.satClose;
    data['trad_status'] = this.tradStatus;
    data['trad_other'] = this.tradOther;
    data['penlty_status'] = this.penltyStatus;
    data['penlty_other'] = this.penltyOther;
    data['bank_status'] = this.bankStatus;
    data['bank_other'] = this.bankOther;
    data['key_f_name'] = this.keyFName;
    data['key_f_lname'] = this.keyFLname;
    data['key_designation'] = this.keyDesignation;
    data['key_phone'] = this.keyPhone;
    data['key_email'] = this.keyEmail;
    data['key_proof'] = this.keyProof;
    data['key_bank_status'] = this.keyBankStatus;
    data['key_bank_other'] = this.keyBankOther;

    data['level_f_name'] = this.levelFName;
    data['level_f_lname'] = this.levelFLname;
    data['level_designation'] = this.levelDesignation;
    data['level_phone'] = this.levelPhone;
    data['level_email'] = this.levelEmail;
    data['level_proof'] = this.levelProof;
    data['level_bank_status'] = this.levelBankStatus;
    data['level_bank_other'] = this.levelBankOther;
    data['key_person'] = this.keyPerson;
    data['level_person'] = this.levelPerson;
    data['organ_email'] = this.organEmail;
    data['land'] = this.land;
    data['license_type'] = this.licenseType;
    data['inactive_remarks'] = this.inactiveRemarks;
    data['verified_on'] = this.verifiedOn;
    data['sl_applied_on'] = this.slAppliedOn;
    data['agent_id'] = this.agentId;
    return data;
  }
}

class AuthorizingOfficer {
  String? comName;
  String? fName;
  String? lName;
  String? email;
  String? pNo;
  String? pass;
  String? reg;
  String? fax;
  String? address;
  String? website;
  String? pan;
  String? logo;
  String? desig;
  String? comReg;
  String? comType;
  String? comYear;
  String? comNat;
  String? noEm;
  String? workPer;
  String? noDire;
  String? country;
  String? currency;
  String? bankName;
  String? acconutName;
  String? sortCode;
  String? othersType;
  String? natureType;
  String? noEmWork;
  String? conNum;
  String? authemail;
  String? tradName;
  String? address2;
  String? road;
  String? city;
  String? zip;
  String? status;
  String? verify;
  String? updatedAt;
  String? createdAt;
  String? employeeLink;
  String? licence;
  String? proof;
  String? sunStatus;
  String? sunTime;
  String? monStatus;
  String? monTime;
  String? tueStatus;
  String? tueTime;
  String? wedStatus;
  String? thuStatus;
  String? thuTime;
  String? friStatus;
  String? friTime;
  String? satStatus;
  String? satTime;
  String? sunClose;
  String? monClose;
  String? tueClose;
  String? wedClose;
  String? thuClose;
  String? friClose;
  String? satClose;
  String? tradStatus;
  String? tradOther;
  String? penltyStatus;
  String? penltyOther;
  String? bankStatus;
  String? bankOther;
  String? keyFName;
  String? keyFLname;
  String? keyDesignation;
  String? keyPhone;
  String? keyEmail;
  String? keyProof;
  String? keyBankStatus;
  String? keyBankOther;
  String? levelFName;
  String? levelFLname;
  String? levelDesignation;
  String? levelPhone;
  String? levelEmail;
  String? levelProof;
  String? levelBankStatus;
  String? levelBankOther;
  String? keyPerson;
  String? levelPerson;
  String? organEmail;
  String? land;
  String? licenseType;
  String? inactiveRemarks;
  String? verifiedOn;
  String? slAppliedOn;
  String? agentId;

  AuthorizingOfficer(
      {this.comName,
        this.fName,
        this.lName,
        this.email,
        this.pNo,
        this.pass,
        this.reg,
        this.fax,
        this.address,
        this.website,
        this.pan,
        this.logo,
        this.desig,
        this.comReg,
        this.comType,
        this.comYear,
        this.comNat,
        this.noEm,
        this.workPer,
        this.noDire,
        this.country,
        this.currency,
        this.bankName,
        this.acconutName,
        this.sortCode,
        this.othersType,
        this.natureType,
        this.noEmWork,
        this.conNum,
        this.authemail,
        this.tradName,
        this.address2,
        this.road,
        this.city,
        this.zip,
        this.status,
        this.verify,
        this.updatedAt,
        this.createdAt,
        this.employeeLink,
        this.licence,
        this.proof,
        this.sunStatus,
        this.sunTime,
        this.monStatus,
        this.monTime,
        this.tueStatus,
        this.tueTime,
        this.wedStatus,
        this.thuStatus,
        this.thuTime,
        this.friStatus,
        this.friTime,
        this.satStatus,
        this.satTime,
        this.sunClose,
        this.monClose,
        this.tueClose,
        this.wedClose,
        this.thuClose,
        this.friClose,
        this.satClose,
        this.tradStatus,
        this.tradOther,
        this.penltyStatus,
        this.penltyOther,
        this.bankStatus,
        this.bankOther,
        this.keyFName,
        this.keyFLname,
        this.keyDesignation,
        this.keyPhone,
        this.keyEmail,
        this.keyProof,
        this.keyBankStatus,
        this.keyBankOther,
        this.levelFName,
        this.levelFLname,
        this.levelDesignation,
        this.levelPhone,
        this.levelEmail,
        this.levelProof,
        this.levelBankStatus,
        this.levelBankOther,
        this.keyPerson,
        this.levelPerson,
        this.organEmail,
        this.land,
        this.licenseType,
        this.inactiveRemarks,
        this.verifiedOn,
        this.slAppliedOn,
        this.agentId});

  AuthorizingOfficer.fromJson(Map<String, dynamic> json) {
    comName = json['com_name'];
    fName = json['f_name'];
    lName = json['l_name'];
    email = json['email'];
    pNo = json['p_no'];
    pass = json['pass'];
    reg = json['reg'];
    fax = json['fax'];
    address = json['address'];
    website = json['website'];
    pan = json['pan'];
    logo = json['logo'];
    desig = json['desig'];
    comReg = json['com_reg'];
    comType = json['com_type'];
    comYear = json['com_year'];
    comNat = json['com_nat'];
    noEm = json['no_em'];
    workPer = json['work_per'];
    noDire = json['no_dire'];
    country = json['country'];
    currency = json['currency'];
    bankName = json['bank_name'];
    acconutName = json['acconut_name'];
    sortCode = json['sort_code'];
    othersType = json['others_type'];
    natureType = json['nature_type'];
    noEmWork = json['no_em_work'];
    conNum = json['con_num'];
    authemail = json['authemail'];
    tradName = json['trad_name'];
    address2 = json['address2'];
    road = json['road'];
    city = json['city'];
    zip = json['zip'];
    status = json['status'];
    verify = json['verify'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    employeeLink = json['employee_link'];
    licence = json['licence'];
    proof = json['proof'];
    sunStatus = json['sun_status'];
    sunTime = json['sun_time'];
    monStatus = json['mon_status'];
    monTime = json['mon_time'];
    tueStatus = json['tue_status'];
    tueTime = json['tue_time'];
    wedStatus = json['wed_status'];
    thuStatus = json['thu_status'];
    thuTime = json['thu_time'];
    friStatus = json['fri_status'];
    friTime = json['fri_time'];
    satStatus = json['sat_status'];
    satTime = json['sat_time'];
    sunClose = json['sun_close'];
    monClose = json['mon_close'];
    tueClose = json['tue_close'];
    wedClose = json['wed_close'];
    thuClose = json['thu_close'];
    friClose = json['fri_close'];
    satClose = json['sat_close'];
    tradStatus = json['trad_status'];
    tradOther = json['trad_other'];
    penltyStatus = json['penlty_status'];
    penltyOther = json['penlty_other'];
    bankStatus = json['bank_status'];
    bankOther = json['bank_other'];
    keyFName = json['key_f_name'];
    keyFLname = json['key_f_lname'];
    keyDesignation = json['key_designation'];
    keyPhone = json['key_phone'];
    keyEmail = json['key_email'];
    keyProof = json['key_proof'];
    keyBankStatus = json['key_bank_status'];
    keyBankOther = json['key_bank_other'];
    levelFName = json['level_f_name'];
    levelFLname = json['level_f_lname'];
    levelDesignation = json['level_designation'];
    levelPhone = json['level_phone'];
    levelEmail = json['level_email'];
    levelProof = json['level_proof'];
    levelBankStatus = json['level_bank_status'];
    levelBankOther = json['level_bank_other'];
    keyPerson = json['key_person'];
    levelPerson = json['level_person'];
    organEmail = json['organ_email'];
    land = json['land'];
    licenseType = json['license_type'];
    inactiveRemarks = json['inactive_remarks'];
    verifiedOn = json['verified_on'];
    slAppliedOn = json['sl_applied_on'];
    agentId = json['agent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['com_name'] = this.comName;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['email'] = this.email;
    data['p_no'] = this.pNo;
    data['pass'] = this.pass;
    data['reg'] = this.reg;
    data['fax'] = this.fax;
    data['address'] = this.address;
    data['website'] = this.website;
    data['pan'] = this.pan;
    data['logo'] = this.logo;
    data['desig'] = this.desig;
    data['com_reg'] = this.comReg;
    data['com_type'] = this.comType;
    data['com_year'] = this.comYear;
    data['com_nat'] = this.comNat;
    data['no_em'] = this.noEm;
    data['work_per'] = this.workPer;
    data['no_dire'] = this.noDire;
    data['country'] = this.country;
    data['currency'] = this.currency;
    data['bank_name'] = this.bankName;
    data['acconut_name'] = this.acconutName;
    data['sort_code'] = this.sortCode;
    data['others_type'] = this.othersType;
    data['nature_type'] = this.natureType;
    data['no_em_work'] = this.noEmWork;
    data['con_num'] = this.conNum;
    data['authemail'] = this.authemail;
    data['trad_name'] = this.tradName;
    data['address2'] = this.address2;
    data['road'] = this.road;
    data['city'] = this.city;
    data['zip'] = this.zip;
    data['status'] = this.status;
    data['verify'] = this.verify;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['employee_link'] = this.employeeLink;
    data['licence'] = this.licence;
    data['proof'] = this.proof;
    data['sun_status'] = this.sunStatus;
    data['sun_time'] = this.sunTime;
    data['mon_status'] = this.monStatus;
    data['mon_time'] = this.monTime;
    data['tue_status'] = this.tueStatus;
    data['tue_time'] = this.tueTime;
    data['wed_status'] = this.wedStatus;
    data['thu_status'] = this.thuStatus;
    data['thu_time'] = this.thuTime;
    data['fri_status'] = this.friStatus;
    data['fri_time'] = this.friTime;
    data['sat_status'] = this.satStatus;
    data['sat_time'] = this.satTime;
    data['sun_close'] = this.sunClose;
    data['mon_close'] = this.monClose;
    data['tue_close'] = this.tueClose;
    data['wed_close'] = this.wedClose;
    data['thu_close'] = this.thuClose;
    data['fri_close'] = this.friClose;
    data['sat_close'] = this.satClose;
    data['trad_status'] = this.tradStatus;
    data['trad_other'] = this.tradOther;
    data['penlty_status'] = this.penltyStatus;
    data['penlty_other'] = this.penltyOther;
    data['bank_status'] = this.bankStatus;
    data['bank_other'] = this.bankOther;
    data['key_f_name'] = this.keyFName;
    data['key_f_lname'] = this.keyFLname;
    data['key_designation'] = this.keyDesignation;
    data['key_phone'] = this.keyPhone;
    data['key_email'] = this.keyEmail;
    data['key_proof'] = this.keyProof;
    data['key_bank_status'] = this.keyBankStatus;
    data['key_bank_other'] = this.keyBankOther;
    data['level_f_name'] = this.levelFName;
    data['level_f_lname'] = this.levelFLname;
    data['level_designation'] = this.levelDesignation;
    data['level_phone'] = this.levelPhone;
    data['level_email'] = this.levelEmail;
    data['level_proof'] = this.levelProof;
    data['level_bank_status'] = this.levelBankStatus;
    data['level_bank_other'] = this.levelBankOther;
    data['key_person'] = this.keyPerson;
    data['level_person'] = this.levelPerson;
    data['organ_email'] = this.organEmail;
    data['land'] = this.land;
    data['license_type'] = this.licenseType;
    data['inactive_remarks'] = this.inactiveRemarks;
    data['verified_on'] = this.verifiedOn;
    data['sl_applied_on'] = this.slAppliedOn;
    data['agent_id'] = this.agentId;
    return data;
  }
}

class Roledata {
  String? comName;
  String? fName;
  String? lName;
  String? email;
  String? pNo;
  String? pass;
  String? reg;
  String? fax;
  String? address;
  String? website;
  String? pan;
  String? logo;
  String? desig;
  String? comReg;
  String? comType;
  String? comYear;
  String? comNat;
  String? noEm;
  String? workPer;
  String? noDire;
  String? country;
  String? currency;
  String? bankName;
  String? acconutName;
  String? sortCode;
  String? othersType;
  String? natureType;
  String? noEmWork;
  String? conNum;
  String? authemail;
  String? tradName;
  String? address2;
  String? road;
  String? city;
  String? zip;
  String? status;
  String? verify;
  String? updatedAt;
  String? createdAt;
  String? employeeLink;
  String? licence;
  String? proof;
  String? sunStatus;
  String? sunTime;
  String? monStatus;
  String? monTime;
  String? tueStatus;
  String? tueTime;
  String? wedStatus;
  String? thuStatus;
  String? thuTime;
  String? friStatus;
  String? friTime;
  String? satStatus;
  String? satTime;
  String? sunClose;
  String? monClose;
  String? tueClose;
  String? wedClose;
  String? thuClose;
  String? friClose;
  String? satClose;
  String? tradStatus;
  String? tradOther;
  String? penltyStatus;
  String? penltyOther;
  String? bankStatus;
  String? bankOther;
  String? keyFName;
  String? keyFLname;
  String? keyDesignation;
  String? keyPhone;
  String? keyEmail;
  String? keyProof;
  String? keyBankStatus;
  String? keyBankOther;
  String? levelFName;
  String? levelFLname;
  String? levelDesignation;
  String? levelPhone;
  String? levelEmail;
  String? levelProof;
  String? levelBankStatus;
  String? levelBankOther;
  String? keyPerson;
  String? levelPerson;
  String? organEmail;
  String? land;
  String? licenseType;
  String? inactiveRemarks;
  String? verifiedOn;
  String? slAppliedOn;
  String? agentId;

  Roledata(
      {this.comName,
        this.fName,
        this.lName,
        this.email,
        this.pNo,
        this.pass,
        this.reg,
        this.fax,
        this.address,
        this.website,
        this.pan,
        this.logo,
        this.desig,
        this.comReg,
        this.comType,
        this.comYear,
        this.comNat,
        this.noEm,
        this.workPer,
        this.noDire,
        this.country,
        this.currency,
        this.bankName,
        this.acconutName,
        this.sortCode,
        this.othersType,
        this.natureType,
        this.noEmWork,
        this.conNum,
        this.authemail,
        this.tradName,
        this.address2,
        this.road,
        this.city,
        this.zip,
        this.status,
        this.verify,
        this.updatedAt,
        this.createdAt,
        this.employeeLink,
        this.licence,
        this.proof,
        this.sunStatus,
        this.sunTime,
        this.monStatus,
        this.monTime,
        this.tueStatus,
        this.tueTime,
        this.wedStatus,
        this.thuStatus,
        this.thuTime,
        this.friStatus,
        this.friTime,
        this.satStatus,
        this.satTime,
        this.sunClose,
        this.monClose,
        this.tueClose,
        this.wedClose,
        this.thuClose,
        this.friClose,
        this.satClose,
        this.tradStatus,
        this.tradOther,
        this.penltyStatus,
        this.penltyOther,
        this.bankStatus,
        this.bankOther,
        this.keyFName,
        this.keyFLname,
        this.keyDesignation,
        this.keyPhone,
        this.keyEmail,
        this.keyProof,
        this.keyBankStatus,
        this.keyBankOther,
        this.levelFName,
        this.levelFLname,
        this.levelDesignation,
        this.levelPhone,
        this.levelEmail,
        this.levelProof,
        this.levelBankStatus,
        this.levelBankOther,
        this.keyPerson,
        this.levelPerson,
        this.organEmail,
        this.land,
        this.licenseType,
        this.inactiveRemarks,
        this.verifiedOn,
        this.slAppliedOn,
        this.agentId});

  Roledata.fromJson(Map<String, dynamic> json) {
    comName = json['com_name'];
    fName = json['f_name'];
    lName = json['l_name'];
    email = json['email'];
    pNo = json['p_no'];
    pass = json['pass'];
    reg = json['reg'];
    fax = json['fax'];
    address = json['address'];
    website = json['website'];
    pan = json['pan'];
    logo = json['logo'];
    desig = json['desig'];
    comReg = json['com_reg'];
    comType = json['com_type'];
    comYear = json['com_year'];
    comNat = json['com_nat'];
    noEm = json['no_em'];
    workPer = json['work_per'];
    noDire = json['no_dire'];
    country = json['country'];
    currency = json['currency'];
    bankName = json['bank_name'];
    acconutName = json['acconut_name'];
    sortCode = json['sort_code'];
    othersType = json['others_type'];
    natureType = json['nature_type'];
    noEmWork = json['no_em_work'];
    conNum = json['con_num'];
    authemail = json['authemail'];
    tradName = json['trad_name'];
    address2 = json['address2'];
    road = json['road'];
    city = json['city'];
    zip = json['zip'];
    status = json['status'];
    verify = json['verify'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    employeeLink = json['employee_link'];
    licence = json['licence'];
    proof = json['proof'];
    sunStatus = json['sun_status'];
    sunTime = json['sun_time'];
    monStatus = json['mon_status'];
    monTime = json['mon_time'];
    tueStatus = json['tue_status'];
    tueTime = json['tue_time'];
    wedStatus = json['wed_status'];
    thuStatus = json['thu_status'];
    thuTime = json['thu_time'];
    friStatus = json['fri_status'];
    friTime = json['fri_time'];
    satStatus = json['sat_status'];
    satTime = json['sat_time'];
    sunClose = json['sun_close'];
    monClose = json['mon_close'];
    tueClose = json['tue_close'];
    wedClose = json['wed_close'];
    thuClose = json['thu_close'];
    friClose = json['fri_close'];
    satClose = json['sat_close'];
    tradStatus = json['trad_status'];
    tradOther = json['trad_other'];
    penltyStatus = json['penlty_status'];
    penltyOther = json['penlty_other'];
    bankStatus = json['bank_status'];
    bankOther = json['bank_other'];
    keyFName = json['key_f_name'];
    keyFLname = json['key_f_lname'];
    keyDesignation = json['key_designation'];
    keyPhone = json['key_phone'];
    keyEmail = json['key_email'];
    keyProof = json['key_proof'];
    keyBankStatus = json['key_bank_status'];
    keyBankOther = json['key_bank_other'];
    levelFName = json['level_f_name'];
    levelFLname = json['level_f_lname'];
    levelDesignation = json['level_designation'];
    levelPhone = json['level_phone'];
    levelEmail = json['level_email'];
    levelProof = json['level_proof'];
    levelBankStatus = json['level_bank_status'];
    levelBankOther = json['level_bank_other'];
    keyPerson = json['key_person'];
    levelPerson = json['level_person'];
    organEmail = json['organ_email'];
    land = json['land'];
    licenseType = json['license_type'];
    inactiveRemarks = json['inactive_remarks'];
    verifiedOn = json['verified_on'];
    slAppliedOn = json['sl_applied_on'];
    agentId = json['agent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['com_name'] = this.comName;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['email'] = this.email;
    data['p_no'] = this.pNo;
    data['pass'] = this.pass;
    data['reg'] = this.reg;
    data['fax'] = this.fax;
    data['address'] = this.address;
    data['website'] = this.website;
    data['pan'] = this.pan;
    data['logo'] = this.logo;
    data['desig'] = this.desig;
    data['com_reg'] = this.comReg;
    data['com_type'] = this.comType;
    data['com_year'] = this.comYear;
    data['com_nat'] = this.comNat;
    data['no_em'] = this.noEm;
    data['work_per'] = this.workPer;
    data['no_dire'] = this.noDire;
    data['country'] = this.country;
    data['currency'] = this.currency;
    data['bank_name'] = this.bankName;
    data['acconut_name'] = this.acconutName;
    data['sort_code'] = this.sortCode;
    data['others_type'] = this.othersType;
    data['nature_type'] = this.natureType;
    data['no_em_work'] = this.noEmWork;
    data['con_num'] = this.conNum;
    data['authemail'] = this.authemail;
    data['trad_name'] = this.tradName;
    data['address2'] = this.address2;
    data['road'] = this.road;
    data['city'] = this.city;
    data['zip'] = this.zip;
    data['status'] = this.status;
    data['verify'] = this.verify;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['employee_link'] = this.employeeLink;
    data['licence'] = this.licence;
    data['proof'] = this.proof;
    data['sun_status'] = this.sunStatus;
    data['sun_time'] = this.sunTime;
    data['mon_status'] = this.monStatus;
    data['mon_time'] = this.monTime;
    data['tue_status'] = this.tueStatus;
    data['tue_time'] = this.tueTime;
    data['wed_status'] = this.wedStatus;
    data['thu_status'] = this.thuStatus;
    data['thu_time'] = this.thuTime;
    data['fri_status'] = this.friStatus;
    data['fri_time'] = this.friTime;
    data['sat_status'] = this.satStatus;
    data['sat_time'] = this.satTime;
    data['sun_close'] = this.sunClose;
    data['mon_close'] = this.monClose;
    data['tue_close'] = this.tueClose;
    data['wed_close'] = this.wedClose;
    data['thu_close'] = this.thuClose;
    data['fri_close'] = this.friClose;
    data['sat_close'] = this.satClose;
    data['trad_status'] = this.tradStatus;
    data['trad_other'] = this.tradOther;
    data['penlty_status'] = this.penltyStatus;
    data['penlty_other'] = this.penltyOther;
    data['bank_status'] = this.bankStatus;
    data['bank_other'] = this.bankOther;
    data['key_f_name'] = this.keyFName;
    data['key_f_lname'] = this.keyFLname;
    data['key_designation'] = this.keyDesignation;
    data['key_phone'] = this.keyPhone;
    data['key_email'] = this.keyEmail;
    data['key_proof'] = this.keyProof;
    data['key_bank_status'] = this.keyBankStatus;
    data['key_bank_other'] = this.keyBankOther;
    data['level_f_name'] = this.levelFName;
    data['level_f_lname'] = this.levelFLname;
    data['level_designation'] = this.levelDesignation;
    data['level_phone'] = this.levelPhone;
    data['level_email'] = this.levelEmail;
    data['level_proof'] = this.levelProof;
    data['level_bank_status'] = this.levelBankStatus;
    data['level_bank_other'] = this.levelBankOther;
    data['key_person'] = this.keyPerson;
    data['level_person'] = this.levelPerson;
    data['organ_email'] = this.organEmail;
    data['land'] = this.land;
    data['license_type'] = this.licenseType;
    data['inactive_remarks'] = this.inactiveRemarks;
    data['verified_on'] = this.verifiedOn;
    data['sl_applied_on'] = this.slAppliedOn;
    data['agent_id'] = this.agentId;
    return data;
  }
}

class CompanyRti {
  String? title;
  String? name;
  String? department;
  String? designation;
  String? emid;
  String? jobType;
  String? immigration;

  CompanyRti(
      {this.title,
        this.name,
        this.department,
        this.designation,
        this.emid,
        this.jobType,
        this.immigration});

  CompanyRti.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    name = json['name'];
    department = json['department'];
    designation = json['designation'];
    emid = json['emid'];
    jobType = json['job_type'];
    immigration = json['immigration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['name'] = this.name;
    data['department'] = this.department;
    data['designation'] = this.designation;
    data['emid'] = this.emid;
    data['job_type'] = this.jobType;
    data['immigration'] = this.immigration;
    return data;
  }
}
