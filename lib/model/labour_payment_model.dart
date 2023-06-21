class LabourPaymentModel {
  int? code;
  String? status;
  String? siteId;
  String? dateRange;
  Result? result;
  String? reset;

  LabourPaymentModel(
      {this.code,
        this.status,
        this.siteId,
        this.dateRange,
        this.result,
        this.reset});

  LabourPaymentModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    siteId = json['site_id'];
    dateRange = json['date_range'];
    result =
    json['result'] != null ? Result.fromJson(json['result']) : null;
    reset = json['reset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['site_id'] = siteId;
    data['date_range'] = dateRange;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['reset'] = reset;
    return data;
  }
}

class Result {
  List<LabourList>? labourList;
  List<LabourHead>? labourHead;
  List<SiteList>? siteList;

  Result({this.labourList, this.labourHead, this.siteList});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['labour_list'] != null) {
      labourList = <LabourList>[];
      json['labour_list'].forEach((v) {
        labourList!.add(LabourList.fromJson(v));
      });
    }
    if (json['labour_head'] != null) {
      labourHead = <LabourHead>[];
      json['labour_head'].forEach((v) {
        labourHead!.add(LabourHead.fromJson(v));
      });
    }
    if (json['site_list'] != null) {
      siteList = <SiteList>[];
      json['site_list'].forEach((v) {
        siteList!.add(SiteList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (labourList != null) {
      data['labour_list'] = labourList!.map((v) => v.toJson()).toList();
    }
    if (labourHead != null) {
      data['labour_head'] = labourHead!.map((v) => v.toJson()).toList();
    }
    if (siteList != null) {
      data['site_list'] = siteList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LabourList {
  String? labourType;
  String? salary;
  String? siteName;
  String? labourHeadId;
  String? labourName;
  String? tpresent;
  String? thalfday;
  String? tnight;
  dynamic tabsent;

  LabourList(
      {this.labourType,
        this.salary,
        this.siteName,
        this.labourHeadId,
        this.labourName,
        this.tpresent,
        this.thalfday,
        this.tnight,
        this.tabsent});

  LabourList.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['labour_type'] = labourType;
    data['salary'] = salary;
    data['site_name'] = siteName;
    data['labour_head_id'] = labourHeadId;
    data['labour_name'] = labourName;
    data['tpresent'] = tpresent;
    data['thalfday'] = thalfday;
    data['tnight'] = tnight;
    data['tabsent'] = tabsent;
    return data;
  }
}

class LabourHead {
  String? id;
  String? fullName;
  String? labourType;
  String? salary;
  String? mobile;
  String? address;
  dynamic joiningDate;
  String? isLabourHead;
  String? labourHead;
  String? status;
  String? createDate;
  String? updateDate;
  dynamic ip;

  LabourHead(
      {this.id,
        this.fullName,
        this.labourType,
        this.salary,
        this.mobile,
        this.address,
        this.joiningDate,
        this.isLabourHead,
        this.labourHead,
        this.status,
        this.createDate,
        this.updateDate,
        this.ip});

  LabourHead.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    labourType = json['labour_type'];
    salary = json['salary'];
    mobile = json['mobile'];
    address = json['address'];
    joiningDate = json['joining_date'];
    isLabourHead = json['is_labour_head'];
    labourHead = json['labour_head'];
    status = json['status'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
    ip = json['ip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['labour_type'] = labourType;
    data['salary'] = salary;
    data['mobile'] = mobile;
    data['address'] = address;
    data['joining_date'] = joiningDate;
    data['is_labour_head'] = isLabourHead;
    data['labour_head'] = labourHead;
    data['status'] = status;
    data['create_date'] = createDate;
    data['update_date'] = updateDate;
    data['ip'] = ip;
    return data;
  }
}

class SiteList {
  String? id;
  String? catId;
  String? name;
  String? status;
  String? createDate;
  String? updateDate;
  String? ip;

  SiteList(
      {this.id,
        this.catId,
        this.name,
        this.status,
        this.createDate,
        this.updateDate,
        this.ip});

  SiteList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catId = json['cat_id'];
    name = json['name'];
    status = json['status'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
    ip = json['ip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cat_id'] = catId;
    data['name'] = name;
    data['status'] = status;
    data['create_date'] = createDate;
    data['update_date'] = updateDate;
    data['ip'] = ip;
    return data;
  }
}