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
  String? remark;
  List<String>? imageNames;

  Result({this.remark, this.imageNames});

  Result.fromJson(Map<String, dynamic> json) {
    remark = json['remark'];
    imageNames = json['image_names'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['remark'] = this.remark;
    data['image_names'] = this.imageNames;
    return data;
  }
}
