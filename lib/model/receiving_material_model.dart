class ReceivingMaterialModel {
  int? code;
  String? status;
  List<Result>? result;

  ReceivingMaterialModel({this.code, this.status, this.result});

  ReceivingMaterialModel.fromJson(Map<String, dynamic> json) {
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
  String? requiredId;
  String? requestId;
  String? orderQty;
  String? receivedQty;
  String? orderDate;
  String? createBy;
  String? createDate;
  String? ip;
  String? floorNum;
  String? floorName;
  String? stageId;
  String? stageName;
  String? matName;
  String? requiredQty;
  String? requestQty;

  Result(
      {this.id,
        this.siteId,
        this.requiredId,
        this.requestId,
        this.orderQty,
        this.receivedQty,
        this.orderDate,
        this.createBy,
        this.createDate,
        this.ip,
        this.floorNum,
        this.floorName,
        this.stageId,
        this.stageName,
        this.matName,
        this.requiredQty,
        this.requestQty});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    siteId = json['site_id'];
    requiredId = json['required_id'];
    requestId = json['request_id'];
    orderQty = json['order_qty'];
    receivedQty = json['received_qty'];
    orderDate = json['order_date'];
    createBy = json['create_by'];
    createDate = json['create_date'];
    ip = json['ip'];
    floorNum = json['floor_num'];
    floorName = json['floor_name'];
    stageId = json['stage_id'];
    stageName = json['stage_name'];
    matName = json['mat_name'];
    requiredQty = json['required_qty'];
    requestQty = json['request_qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['site_id'] = siteId;
    data['required_id'] = requiredId;
    data['request_id'] = requestId;
    data['order_qty'] = orderQty;
    data['received_qty'] = receivedQty;
    data['order_date'] = orderDate;
    data['create_by'] = createBy;
    data['create_date'] = createDate;
    data['ip'] = ip;
    data['floor_num'] = floorNum;
    data['floor_name'] = floorName;
    data['stage_id'] = stageId;
    data['stage_name'] = stageName;
    data['mat_name'] = matName;
    data['required_qty'] = requiredQty;
    data['request_qty'] = requestQty;
    return data;
  }
}
