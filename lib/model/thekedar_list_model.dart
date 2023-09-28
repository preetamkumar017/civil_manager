class ThekedarListModel {
  int? code;
  String? status;
  List<Thekedar>? thekedar;

  ThekedarListModel({this.code, this.status, this.thekedar});

  ThekedarListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    if (json['Thekedar'] != null) {
      thekedar = <Thekedar>[];
      json['Thekedar'].forEach((v) {
        thekedar!.add(new Thekedar.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    if (thekedar != null) {
      data['Thekedar'] = thekedar!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Thekedar {
  String? id;
  String? fullName;
  String? thekaTypeId;
  String? assignSite;
  String? mobileNo;
  String? password;
  String? address;
  String? status;
  String? createDate;
  String? updateDate;
  String? ip;

  Thekedar(
      {this.id,
        this.fullName,
        this.thekaTypeId,
        this.assignSite,
        this.mobileNo,
        this.password,
        this.address,
        this.status,
        this.createDate,
        this.updateDate,
        this.ip});

  Thekedar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    thekaTypeId = json['theka_type_id'];
    assignSite = json['assign_site'];
    mobileNo = json['mobile_no'];
    password = json['password'];
    address = json['address'];
    status = json['status'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
    ip = json['ip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['theka_type_id'] = thekaTypeId;
    data['assign_site'] = assignSite;
    data['mobile_no'] = mobileNo;
    data['password'] = password;
    data['address'] = address;
    data['status'] = status;
    data['create_date'] = createDate;
    data['update_date'] = updateDate;
    data['ip'] = ip;
    return data;
  }
}
