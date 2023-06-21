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
        result!.add(Result.fromJson(v));
      });
    }
    if (json['floor'] != null) {
      floor = <Floor>[];
      json['floor'].forEach((v) {
        floor!.add(Floor.fromJson(v));
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
    if (floor != null) {
      data['floor'] = floor!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? cnt;
  String? stageId;
  String? stageName;
  String? floorNum;
  String? floorName;

  Result(
      {this.cnt, this.stageId, this.stageName, this.floorNum, this.floorName});

  Result.fromJson(Map<String, dynamic> json) {
    cnt = json['cnt'];
    stageId = json['stage_id'];
    stageName = json['stage_name'];
    floorNum = json['floor_num'];
    floorName = json['floor_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cnt'] = cnt;
    data['stage_id'] = stageId;
    data['stage_name'] = stageName;
    data['floor_num'] = floorNum;
    data['floor_name'] = floorName;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['floor_num'] = floorNum;
    return data;
  }
}
