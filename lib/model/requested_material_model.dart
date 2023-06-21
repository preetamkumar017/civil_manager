class RequestedMaterialModel {
  int? code;
  String? status;
  List<Result>? result;

  RequestedMaterialModel({this.code, this.status, this.result});

  RequestedMaterialModel.fromJson(Map<String, dynamic> json) {
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
  String? floorNum;
  String? floorName;
  String? stageId;
  String? stageName;
  String? matId;
  String? matName;
  String? matQty;
  String? matUnit;
  String? requiredQty;
  String? requestQty;
  String? orderQty;
  dynamic requiredBy;
  String? requestBy;
  dynamic orderBy;
  dynamic orderDate;
  String? createBy;
  String? createDate;
  dynamic updateDate;
  dynamic ip;

  Result(
      {this.id,
        this.siteId,
        this.siteName,
        this.floorNum,
        this.floorName,
        this.stageId,
        this.stageName,
        this.matId,
        this.matName,
        this.matQty,
        this.matUnit,
        this.requiredQty,
        this.requestQty,
        this.orderQty,
        this.requiredBy,
        this.requestBy,
        this.orderBy,
        this.orderDate,
        this.createBy,
        this.createDate,
        this.updateDate,
        this.ip});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    siteId = json['site_id'];
    siteName = json['site_name'];
    floorNum = json['floor_num'];
    floorName = json['floor_name'];
    stageId = json['stage_id'];
    stageName = json['stage_name'];
    matId = json['mat_id'];
    matName = json['mat_name'];
    matQty = json['mat_qty'];
    matUnit = json['mat_unit'];
    requiredQty = json['required_qty'];
    requestQty = json['request_qty'];
    orderQty = json['order_qty'];
    requiredBy = json['required_by'];
    requestBy = json['request_by'];
    orderBy = json['order_by'];
    orderDate = json['order_date'];
    createBy = json['create_by'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
    ip = json['ip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['site_id'] = siteId;
    data['site_name'] = siteName;
    data['floor_num'] = floorNum;
    data['floor_name'] = floorName;
    data['stage_id'] = stageId;
    data['stage_name'] = stageName;
    data['mat_id'] = matId;
    data['mat_name'] = matName;
    data['mat_qty'] = matQty;
    data['mat_unit'] = matUnit;
    data['required_qty'] = requiredQty;
    data['request_qty'] = requestQty;
    data['order_qty'] = orderQty;
    data['required_by'] = requiredBy;
    data['request_by'] = requestBy;
    data['order_by'] = orderBy;
    data['order_date'] = orderDate;
    data['create_by'] = createBy;
    data['create_date'] = createDate;
    data['update_date'] = updateDate;
    data['ip'] = ip;
    return data;
  }
}
