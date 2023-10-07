class LabourListAfterAttendanceModel {
  int? code;
  String? status;
  String? dateRange;
  String? siteId;
  String? labourHeadId;
  List<Result>? result;

  LabourListAfterAttendanceModel(
      {this.code,
        this.status,
        this.dateRange,
        this.siteId,
        this.labourHeadId,
        this.result});

  LabourListAfterAttendanceModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    dateRange = json['date_range'];
    siteId = json['site_id'];
    labourHeadId = json['labour_head_id'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['date_range'] = this.dateRange;
    data['site_id'] = this.siteId;
    data['labour_head_id'] = this.labourHeadId;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
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
  String? absent;
  String? present;
  String? halfday;
  String? night;
  String? overTime;
  String? attandanceDate;
  String? createDate;
  String? updateDate;
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
        this.overTime,
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
    overTime = json['over_time'];
    attandanceDate = json['attandance_date'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
    ip = json['ip'];
    userId = json['user_id'];
    userName = json['user_name'];
    imageName = json['image_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['site_id'] = this.siteId;
    data['site_name'] = this.siteName;
    data['labour_head_id'] = this.labourHeadId;
    data['labour_head_name'] = this.labourHeadName;
    data['labour_type'] = this.labourType;
    data['labour_id'] = this.labourId;
    data['labour_name'] = this.labourName;
    data['labour_work'] = this.labourWork;
    data['salary'] = this.salary;
    data['absent'] = this.absent;
    data['present'] = this.present;
    data['halfday'] = this.halfday;
    data['night'] = this.night;
    data['over_time'] = this.overTime;
    data['attandance_date'] = this.attandanceDate;
    data['create_date'] = this.createDate;
    data['update_date'] = this.updateDate;
    data['ip'] = this.ip;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['image_name'] = this.imageName;
    return data;
  }
}
