class UserModel {
  int? code;
  String? status;
  String? message;
  List<Result>? result;

  UserModel({this.code, this.status, this.message, this.result});

  UserModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? id;
  String? userName;
  String? password;
  String? mobile;
  String? email;
  String? userType;
  String? designation;
  String? accessAuth;
  dynamic profileImg;
  String? salary;
  String? petrolingRate;
  String? accountNo;
  String? ifscCode;
  String? bankName;
  String? bankAddress;
  dynamic joiningDate;
  String? ukcid;
  String? createDate;
  String? updateDate;
  String? status;
  dynamic ip;

  Result(
      {this.id,
        this.userName,
        this.password,
        this.mobile,
        this.email,
        this.userType,
        this.designation,
        this.accessAuth,
        this.profileImg,
        this.salary,
        this.petrolingRate,
        this.accountNo,
        this.ifscCode,
        this.bankName,
        this.bankAddress,
        this.joiningDate,
        this.ukcid,
        this.createDate,
        this.updateDate,
        this.status,
        this.ip});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    password = json['password'];
    mobile = json['mobile'];
    email = json['email'];
    userType = json['user_type'];
    designation = json['designation'];
    accessAuth = json['access_auth'];
    profileImg = json['profile_img'];
    salary = json['salary'];
    petrolingRate = json['petroling_rate'];
    accountNo = json['account_no'];
    ifscCode = json['ifsc_code'];
    bankName = json['bank_name'];
    bankAddress = json['bank_address'];
    joiningDate = json['joining_date'];
    ukcid = json['ukcid'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
    status = json['status'];
    ip = json['ip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_name'] = userName;
    data['password'] = password;
    data['mobile'] = mobile;
    data['email'] = email;
    data['user_type'] = userType;
    data['designation'] = designation;
    data['access_auth'] = accessAuth;
    data['profile_img'] = profileImg;
    data['salary'] = salary;
    data['petroling_rate'] = petrolingRate;
    data['account_no'] = accountNo;
    data['ifsc_code'] = ifscCode;
    data['bank_name'] = bankName;
    data['bank_address'] = bankAddress;
    data['joining_date'] = joiningDate;
    data['ukcid'] = ukcid;
    data['create_date'] = createDate;
    data['update_date'] = updateDate;
    data['status'] = status;
    data['ip'] = ip;
    return data;
  }
}