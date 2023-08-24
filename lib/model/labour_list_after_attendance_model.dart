class LabourListAfterAttendanceModel {
  int? code;
  String? status;
  List<Result>? result;

  LabourListAfterAttendanceModel({this.code, this.status, this.result});

  LabourListAfterAttendanceModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
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
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? id;
  String? siteId;
  String? siteName;
  String? labourHeadId;
  String? labourHeadName;
  String? labourType;
  String? labourId;
  String? labourName;
  String? labourWork;
  String? salary;
  dynamic absent;
  String? present;
  String? halfday;
  String? night;
  String? attandanceDate;
  String? createDate;
  dynamic updateDate;
  String? ip;
  String? userId;
  String? userName;
  String? imageName;

  Result(
      {this.id,
        this.siteId,
        this.siteName,
        this.labourHeadId,
        this.labourHeadName,
        this.labourType,
        this.labourId,
        this.labourName,
        this.labourWork,
        this.salary,
        this.absent,
        this.present,
        this.halfday,
        this.night,
        this.attandanceDate,
        this.createDate,
        this.updateDate,
        this.ip,
        this.userId,
        this.userName,
        this.imageName});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    siteId = json['site_id'];
    siteName = json['site_name'];
    labourHeadId = json['labour_head_id'];
    labourHeadName = json['labour_head_name'];
    labourType = json['labour_type'];
    labourId = json['labour_id'];
    labourName = json['labour_name'];
    labourWork = json['labour_work'];
    salary = json['salary'];
    absent = json['absent'];
    present = json['present'];
    halfday = json['halfday'];
    night = json['night'];
    attandanceDate = json['attandance_date'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
    ip = json['ip'];
    userId = json['user_id'];
    userName = json['user_name'];
    imageName = json['image_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['site_id'] = siteId;
    data['site_name'] = siteName;
    data['labour_head_id'] = labourHeadId;
    data['labour_head_name'] = labourHeadName;
    data['labour_type'] = labourType;
    data['labour_id'] = labourId;
    data['labour_name'] = labourName;
    data['labour_work'] = labourWork;
    data['salary'] = salary;
    data['absent'] = absent;
    data['present'] = present;
    data['halfday'] = halfday;
    data['night'] = night;
    data['attandance_date'] = attandanceDate;
    data['create_date'] = createDate;
    data['update_date'] = updateDate;
    data['ip'] = ip;
    data['user_id'] = userId;
    data['user_name'] = userName;
    data['image_name'] = imageName;
    return data;
  }
}