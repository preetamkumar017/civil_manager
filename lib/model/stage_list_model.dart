class StageListModel {
  int? code;
  String? status;
  List<Result>? result;
  List<Floor>? floor;

  StageListModel({this.code, this.status, this.result, this.floor});

  StageListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
    if (json['floor'] != null) {
      floor = <Floor>[];
      json['floor'].forEach((v) {
        floor!.add(new Floor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    if (this.floor != null) {
      data['floor'] = this.floor!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? stageId;
  String? floorNum;
  String? floorName;
  String? stageName;

  Result({this.stageId, this.floorNum, this.floorName, this.stageName});

  Result.fromJson(Map<String, dynamic> json) {
    stageId = json['stage_id'];
    floorNum = json['floor_num'];
    floorName = json['floor_name'];
    stageName = json['stage_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stage_id'] = this.stageId;
    data['floor_num'] = this.floorNum;
    data['floor_name'] = this.floorName;
    data['stage_name'] = this.stageName;
    return data;
  }
}

class Floor {
  String? floorNum;

  Floor({this.floorNum});

  Floor.fromJson(Map<String, dynamic> json) {
    floorNum = json['floor_num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['floor_num'] = this.floorNum;
    return data;
  }
}
