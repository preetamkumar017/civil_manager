class ManualImageModel {
  String? status;
  int? code;
  String? message;
  List<Result>? result;

  ManualImageModel({this.status, this.code, this.message, this.result});

  ManualImageModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? id;
  String? siteId;
  String? imageName;
  String? uploadLocation;
  String? uploadBy;
  String? status;
  String? createDate;
  String? updateDate;
  String? ip;

  Result(
      {this.id,
        this.siteId,
        this.imageName,
        this.uploadLocation,
        this.uploadBy,
        this.status,
        this.createDate,
        this.updateDate,
        this.ip});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    siteId = json['site_id'];
    imageName = json['image_name'];
    uploadLocation = json['upload_location'];
    uploadBy = json['upload_by'];
    status = json['status'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
    ip = json['ip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['site_id'] = this.siteId;
    data['image_name'] = this.imageName;
    data['upload_location'] = this.uploadLocation;
    data['upload_by'] = this.uploadBy;
    data['status'] = this.status;
    data['create_date'] = this.createDate;
    data['update_date'] = this.updateDate;
    data['ip'] = this.ip;
    return data;
  }
}
