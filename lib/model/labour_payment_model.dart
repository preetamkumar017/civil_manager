class LabourPaymentModel {
  int? code;
  String? status;
  String? siteId;
  String? labourHeadId;
  String? dateRange;
  Result? result;

  LabourPaymentModel(
      {this.code,
        this.status,
        this.siteId,
        this.labourHeadId,
        this.dateRange,
        this.result});

  LabourPaymentModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    siteId = json['site_id'];
    labourHeadId = json['labour_head_id'];
    dateRange = json['date_range'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['site_id'] = this.siteId;
    data['labour_head_id'] = this.labourHeadId;
    data['date_range'] = this.dateRange;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  List<LabourList>? labourList;
  int? mishtriCount;
  int? rezaCount;
  int? kuliCount;

  Result({this.labourList, this.mishtriCount, this.rezaCount, this.kuliCount});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['labour_list'] != null) {
      labourList = <LabourList>[];
      json['labour_list'].forEach((v) {
        labourList!.add(new LabourList.fromJson(v));
      });
    }
    mishtriCount = json['mishtriCount'];
    rezaCount = json['rezaCount'];
    kuliCount = json['kuliCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.labourList != null) {
      data['labour_list'] = this.labourList!.map((v) => v.toJson()).toList();
    }
    data['mishtriCount'] = this.mishtriCount;
    data['rezaCount'] = this.rezaCount;
    data['kuliCount'] = this.kuliCount;
    return data;
  }
}

class LabourList {
  String? id;
  String? labourId;
  String? labourType;
  String? salary;
  String? siteName;
  String? labourHeadId;
  String? labourName;
  String? tpresent;
  String? thalfday;
  String? tnight;
  String? tabsent;

  LabourList(
      {this.id,
        this.labourId,
        this.labourType,
        this.salary,
        this.siteName,
        this.labourHeadId,
        this.labourName,
        this.tpresent,
        this.thalfday,
        this.tnight,
        this.tabsent});

  LabourList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    labourId = json['labour_id'];
    labourType = json['labour_type'];
    salary = json['salary'];
    siteName = json['site_name'];
    labourHeadId = json['labour_head_id'];
    labourName = json['labour_name'];
    tpresent = json['tpresent'];
    thalfday = json['thalfday'];
    tnight = json['tnight'];
    tabsent = json['tabsent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['labour_id'] = this.labourId;
    data['labour_type'] = this.labourType;
    data['salary'] = this.salary;
    data['site_name'] = this.siteName;
    data['labour_head_id'] = this.labourHeadId;
    data['labour_name'] = this.labourName;
    data['tpresent'] = this.tpresent;
    data['thalfday'] = this.thalfday;
    data['tnight'] = this.tnight;
    data['tabsent'] = this.tabsent;
    return data;
  }
}
