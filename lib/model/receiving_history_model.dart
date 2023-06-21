class ReceivingHistoryModel {
  int? code;
  String? status;
  List<Result>? result;

  ReceivingHistoryModel({this.code, this.status, this.result});

  ReceivingHistoryModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add( Result.fromJson(v));
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
  String? requiredId;
  String? requestId;
  String? orderId;
  String? orderQty;
  String? receivedQty;
  String? image;
  String? receivedDate;
  String? createBy;
  String? createDate;
  dynamic ip;
  String? siteName;
  String? floorNum;
  String? floorName;
  String? stageName;
  String? matName;
  String? matUnit;
  String? requiredQty;

  Result(
      {this.id,
        this.requiredId,
        this.requestId,
        this.orderId,
        this.orderQty,
        this.receivedQty,
        this.image,
        this.receivedDate,
        this.createBy,
        this.createDate,
        this.ip,
        this.siteName,
        this.floorNum,
        this.floorName,
        this.stageName,
        this.matName,
        this.matUnit,
        this.requiredQty});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    requiredId = json['required_id'];
    requestId = json['request_id'];
    orderId = json['order_id'];
    orderQty = json['order_qty'];
    receivedQty = json['received_qty'];
    image = json['image'];
    receivedDate = json['received_date'];
    createBy = json['create_by'];
    createDate = json['create_date'];
    ip = json['ip'];
    siteName = json['site_name'];
    floorNum = json['floor_num'];
    floorName = json['floor_name'];
    stageName = json['stage_name'];
    matName = json['mat_name'];
    matUnit = json['mat_unit'];
    requiredQty = json['required_qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['required_id'] = requiredId;
    data['request_id'] = requestId;
    data['order_id'] = orderId;
    data['order_qty'] = orderQty;
    data['received_qty'] = receivedQty;
    data['image'] = image;
    data['received_date'] = receivedDate;
    data['create_by'] = createBy;
    data['create_date'] = createDate;
    data['ip'] = ip;
    data['site_name'] = siteName;
    data['floor_num'] = floorNum;
    data['floor_name'] = floorName;
    data['stage_name'] = stageName;
    data['mat_name'] = matName;
    data['mat_unit'] = matUnit;
    data['required_qty'] = requiredQty;
    return data;
  }
}
