class ImageCalenderModel {
  String? status;
  int? code;
  String? message;
  List<Result>? result;

  ImageCalenderModel({this.status, this.code, this.message, this.result});

  ImageCalenderModel.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? id;
  String? siteId;
  String? dateTime;
  String? createDate;
  String? uploadBy;
  String? remark;

  Result(
      { this.id,
        this.siteId,
        this.dateTime,
        this.createDate,
        this.uploadBy,
        this.remark});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    siteId = json['site_id'];
    dateTime = json['date_time'];
    createDate = json['create_date'];
    uploadBy = json['upload_by'];
    remark = json['remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['site_id'] = siteId;
    data['date_time'] = dateTime;
    data['create_date'] = createDate;
    data['upload_by'] = uploadBy;
    data['remark'] = remark;
    return data;
  }
}
