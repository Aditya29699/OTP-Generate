class TodoModel {
  OtpListResult? otpListResult;

  TodoModel({this.otpListResult});

  TodoModel.fromJson(Map<String, dynamic> json) {
    otpListResult = json['OtpListResult'] != null
        ? new OtpListResult.fromJson(json['OtpListResult'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.otpListResult != null) {
      data['OtpListResult'] = this.otpListResult!.toJson();
    }
    return data;
  }
}

class OtpListResult {
  LogMessage? logMessage;
  List<OtpDetail>? otpDetail;

  OtpListResult({this.logMessage, this.otpDetail});

  OtpListResult.fromJson(Map<String, dynamic> json) {
    logMessage = json['LogMessage'] != null
        ? new LogMessage.fromJson(json['LogMessage'])
        : null;
    if (json['otpDetail'] != null) {
      otpDetail = <OtpDetail>[];
      json['otpDetail'].forEach((v) {
        otpDetail!.add(new OtpDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.logMessage != null) {
      data['LogMessage'] = this.logMessage!.toJson();
    }
    if (this.otpDetail != null) {
      data['otpDetail'] = this.otpDetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LogMessage {
  Null? errorMsg;
  bool? success;

  LogMessage({this.errorMsg, this.success});

  LogMessage.fromJson(Map<String, dynamic> json) {
    errorMsg = json['ErrorMsg'];
    success = json['Success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ErrorMsg'] = this.errorMsg;
    data['Success'] = this.success;
    return data;
  }
}

class OtpDetail {
  String? cODE;
  String? iSCUSTOMERORVENDOR;
  String? isVendorVisible;
  String? nAME;
  String? oTP;
  String? valid;
  String? mobileNo;

  OtpDetail(
      {this.cODE,
        this.iSCUSTOMERORVENDOR,
        this.isVendorVisible,
        this.nAME,
        this.oTP,
        this.valid,
        this.mobileNo});

  OtpDetail.fromJson(Map<String, dynamic> json) {
    cODE = json['CODE'];
    iSCUSTOMERORVENDOR = json['ISCUSTOMER_OR_VENDOR'];
    isVendorVisible = json['IsVendorVisible'];
    nAME = json['NAME'];
    oTP = json['OTP'];
    valid = json['Valid'];
    mobileNo = json['mobileNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CODE'] = this.cODE;
    data['ISCUSTOMER_OR_VENDOR'] = this.iSCUSTOMERORVENDOR;
    data['IsVendorVisible'] = this.isVendorVisible;
    data['NAME'] = this.nAME;
    data['OTP'] = this.oTP;
    data['Valid'] = this.valid;
    data['mobileNo'] = this.mobileNo;
    return data;
  }
}
