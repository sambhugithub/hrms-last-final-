class PayslipModel {
  List<Data>? data;

  PayslipModel({this.data});

  PayslipModel.fromJson(Map<String, dynamic> json) {
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
  String? empName;
  String? empDesignation;
  String? empBasicPay;
  String? monthYr;
  int? empAdjustDays;
  String? empPresentDays;
  String? empCl;
  String? empEl;
  String? empHpl;
  String? empAbsentDays;
  String? empRh;
  String? empCml;
  String? empEol;
  String? empLnd;
  String? empMaternityLeave;
  String? empPaternityLeave;
  String? empCcl;
  String? empDa;
  String? empVda;
  String? empHra;
  String? empProfTax;
  String? empOthersAlw;
  String? empTiffAlw;
  String? empConv;
  String? empMedical;
  String? empMiscAlw;
  String? empOverTime;
  String? empBouns;
  String? empCoOp;
  String? empPf;
  String? empPfInt;
  String? empApf;
  String? empITax;
  String? empInsuPrem;
  String? empPfLoan;
  String? empEsi;
  String? empAdv;
  String? empAbsentDeduction;
  String? empHrd;
  String? empGrossSalary;
  String? empTotalDeduction;
  String? empNetSalary;
  String? procesStatus;
  String? createdAt;
  String? empFurniture;
  String? empPfEmployer;
  String? empPfPension;
  String? empMiscDed;
  String? empLeaveInc;
  String? empHta;
  String? empIncomeTax;
  String? otherDeduction;
  String? otherAddition;
  String? updatedAt;
  String? url;

  Data(
      {this.id,
        this.employeeId,
        this.empName,
        this.empDesignation,
        this.empBasicPay,
        this.monthYr,
        this.empAdjustDays,
        this.empPresentDays,
        this.empCl,
        this.empEl,
        this.empHpl,
        this.empAbsentDays,
        this.empRh,
        this.empCml,
        this.empEol,
        this.empLnd,
        this.empMaternityLeave,
        this.empPaternityLeave,
        this.empCcl,
        this.empDa,
        this.empVda,
        this.empHra,
        this.empProfTax,
        this.empOthersAlw,
        this.empTiffAlw,
        this.empConv,
        this.empMedical,
        this.empMiscAlw,
        this.empOverTime,
        this.empBouns,
        this.empCoOp,
        this.empPf,
        this.empPfInt,
        this.empApf,
        this.empITax,
        this.empInsuPrem,
        this.empPfLoan,
        this.empEsi,
        this.empAdv,
        this.empAbsentDeduction,
        this.empHrd,
        this.empGrossSalary,
        this.empTotalDeduction,
        this.empNetSalary,
        this.procesStatus,
        this.createdAt,
        this.empFurniture,
        this.empPfEmployer,
        this.empPfPension,
        this.empMiscDed,
        this.empLeaveInc,
        this.empHta,
        this.empIncomeTax,
        this.otherDeduction,
        this.otherAddition,
        this.updatedAt,
        this.url});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeId = json['employee_id'];
    empName = json['emp_name'];
    empDesignation = json['emp_designation'];
    empBasicPay = json['emp_basic_pay'];
    monthYr = json['month_yr'];
    empAdjustDays = json['emp_adjust_days'];
    empPresentDays = json['emp_present_days'];
    empCl = json['emp_cl'];
    empEl = json['emp_el'];
    empHpl = json['emp_hpl'];
    empAbsentDays = json['emp_absent_days'];
    empRh = json['emp_rh'];
    empCml = json['emp_cml'];
    empEol = json['emp_eol'];
    empLnd = json['emp_lnd'];
    empMaternityLeave = json['emp_maternity_leave'];
    empPaternityLeave = json['emp_paternity_leave'];
    empCcl = json['emp_ccl'];
    empDa = json['emp_da'];
    empVda = json['emp_vda'];
    empHra = json['emp_hra'];
    empProfTax = json['emp_prof_tax'];
    empOthersAlw = json['emp_others_alw'];
    empTiffAlw = json['emp_tiff_alw'];
    empConv = json['emp_conv'];
    empMedical = json['emp_medical'];
    empMiscAlw = json['emp_misc_alw'];
    empOverTime = json['emp_over_time'];
    empBouns = json['emp_bouns'];
    empCoOp = json['emp_co_op'];
    empPf = json['emp_pf'];
    empPfInt = json['emp_pf_int'];
    empApf = json['emp_apf'];
    empITax = json['emp_i_tax'];
    empInsuPrem = json['emp_insu_prem'];
    empPfLoan = json['emp_pf_loan'];
    empEsi = json['emp_esi'];
    empAdv = json['emp_adv'];
    empAbsentDeduction = json['emp_absent_deduction'];
    empHrd = json['emp_hrd'];
    empGrossSalary = json['emp_gross_salary'];
    empTotalDeduction = json['emp_total_deduction'];
    empNetSalary = json['emp_net_salary'];
    procesStatus = json['proces_status'];
    createdAt = json['created_at'];
    empFurniture = json['emp_furniture'];
    empPfEmployer = json['emp_pf_employer'];
    empPfPension = json['emp_pf_pension'];
    empMiscDed = json['emp_misc_ded'];
    empLeaveInc = json['emp_leave_inc'];
    empHta = json['emp_hta'];
    empIncomeTax = json['emp_income_tax'];
    otherDeduction = json['other_deduction'];
    otherAddition = json['other_addition'];
    updatedAt = json['updated_at'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employee_id'] = this.employeeId;
    data['emp_name'] = this.empName;
    data['emp_designation'] = this.empDesignation;
    data['emp_basic_pay'] = this.empBasicPay;
    data['month_yr'] = this.monthYr;
    data['emp_adjust_days'] = this.empAdjustDays;
    data['emp_present_days'] = this.empPresentDays;
    data['emp_cl'] = this.empCl;
    data['emp_el'] = this.empEl;
    data['emp_hpl'] = this.empHpl;
    data['emp_absent_days'] = this.empAbsentDays;
    data['emp_rh'] = this.empRh;
    data['emp_cml'] = this.empCml;
    data['emp_eol'] = this.empEol;
    data['emp_lnd'] = this.empLnd;
    data['emp_maternity_leave'] = this.empMaternityLeave;
    data['emp_paternity_leave'] = this.empPaternityLeave;
    data['emp_ccl'] = this.empCcl;
    data['emp_da'] = this.empDa;
    data['emp_vda'] = this.empVda;
    data['emp_hra'] = this.empHra;
    data['emp_prof_tax'] = this.empProfTax;
    data['emp_others_alw'] = this.empOthersAlw;
    data['emp_tiff_alw'] = this.empTiffAlw;
    data['emp_conv'] = this.empConv;
    data['emp_medical'] = this.empMedical;
    data['emp_misc_alw'] = this.empMiscAlw;
    data['emp_over_time'] = this.empOverTime;
    data['emp_bouns'] = this.empBouns;
    data['emp_co_op'] = this.empCoOp;
    data['emp_pf'] = this.empPf;
    data['emp_pf_int'] = this.empPfInt;
    data['emp_apf'] = this.empApf;
    data['emp_i_tax'] = this.empITax;
    data['emp_insu_prem'] = this.empInsuPrem;
    data['emp_pf_loan'] = this.empPfLoan;
    data['emp_esi'] = this.empEsi;
    data['emp_adv'] = this.empAdv;
    data['emp_absent_deduction'] = this.empAbsentDeduction;
    data['emp_hrd'] = this.empHrd;
    data['emp_gross_salary'] = this.empGrossSalary;
    data['emp_total_deduction'] = this.empTotalDeduction;
    data['emp_net_salary'] = this.empNetSalary;
    data['proces_status'] = this.procesStatus;
    data['created_at'] = this.createdAt;
    data['emp_furniture'] = this.empFurniture;
    data['emp_pf_employer'] = this.empPfEmployer;
    data['emp_pf_pension'] = this.empPfPension;
    data['emp_misc_ded'] = this.empMiscDed;
    data['emp_leave_inc'] = this.empLeaveInc;
    data['emp_hta'] = this.empHta;
    data['emp_income_tax'] = this.empIncomeTax;
    data['other_deduction'] = this.otherDeduction;
    data['other_addition'] = this.otherAddition;
    data['updated_at'] = this.updatedAt;
    data['url'] = this.url;
    return data;
  }
}
