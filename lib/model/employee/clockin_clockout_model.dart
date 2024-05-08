class ClockInClockOutModel {
  int? id;
  String? employeeCode;
  String? employeeName;
  String? date;
  String? day;
  String? timeIn;
  String? timeOut;
  String? month;
  String? timeInLocation;
  String? timeOutLocation;
  String? dutyHours;
  String? emid;
  String? latitudes;
  String? longitudes;
  String? logoutLatitude;
  String? logoutLongitude;
  int? loginStatus;
  int? logoutStatus;
  String? monthYr;
  String? noOfWorkingDays;
  String? noOfDaysAbsent;
  String? noOfDaysLeaveTaken;
  String? noOfPresent;
  String? noOfTourLeave;
  String? noOfDaysSalary;
  String? createdAt;
  String? updatedAt;

  ClockInClockOutModel(
      {this.id,
        this.employeeCode,
        this.employeeName,
        this.date,
        this.day,
        this.timeIn,
        this.timeOut,
        this.month,
        this.timeInLocation,
        this.timeOutLocation,
        this.dutyHours,
        this.emid,
        this.latitudes,
        this.longitudes,
        this.logoutLatitude,
        this.logoutLongitude,
        this.loginStatus,
        this.logoutStatus,
        this.monthYr,
        this.noOfWorkingDays,
        this.noOfDaysAbsent,
        this.noOfDaysLeaveTaken,
        this.noOfPresent,
        this.noOfTourLeave,
        this.noOfDaysSalary,
        this.createdAt,
        this.updatedAt});

  ClockInClockOutModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeCode = json['employee_code'];
    employeeName = json['employee_name'];
    date = json['date'];
    day = json['day'];
    timeIn = json['time_in'];
    timeOut = json['time_out'];
    month = json['month'];
    timeInLocation = json['time_in_location'];
    timeOutLocation = json['time_out_location'];
    dutyHours = json['duty_hours'];
    emid = json['emid'];
    latitudes = json['latitudes'];
    longitudes = json['longitudes'];
    logoutLatitude = json['logout_latitude'];
    logoutLongitude = json['logout_longitude'];
    loginStatus = json['loginStatus'];
    logoutStatus = json['logoutStatus'];
    monthYr = json['month_yr'];
    noOfWorkingDays = json['no_of_working_days'];
    noOfDaysAbsent = json['no_of_days_absent'];
    noOfDaysLeaveTaken = json['no_of_days_leave_taken'];
    noOfPresent = json['no_of_present'];
    noOfTourLeave = json['no_of_tour_leave'];
    noOfDaysSalary = json['no_of_days_salary'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employee_code'] = this.employeeCode;
    data['employee_name'] = this.employeeName;
    data['date'] = this.date;
    data['day'] = this.day;
    data['time_in'] = this.timeIn;
    data['time_out'] = this.timeOut;
    data['month'] = this.month;
    data['time_in_location'] = this.timeInLocation;
    data['time_out_location'] = this.timeOutLocation;
    data['duty_hours'] = this.dutyHours;
    data['emid'] = this.emid;
    data['latitudes'] = this.latitudes;
    data['longitudes'] = this.longitudes;
    data['logout_latitude'] = this.logoutLatitude;
    data['logout_longitude'] = this.logoutLongitude;
    data['loginStatus'] = this.loginStatus;
    data['logoutStatus'] = this.logoutStatus;
    data['month_yr'] = this.monthYr;
    data['no_of_working_days'] = this.noOfWorkingDays;
    data['no_of_days_absent'] = this.noOfDaysAbsent;
    data['no_of_days_leave_taken'] = this.noOfDaysLeaveTaken;
    data['no_of_present'] = this.noOfPresent;
    data['no_of_tour_leave'] = this.noOfTourLeave;
    data['no_of_days_salary'] = this.noOfDaysSalary;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}