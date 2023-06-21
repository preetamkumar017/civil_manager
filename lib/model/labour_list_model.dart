class LabourListModel {
  List<LabourList>? labourList;

  LabourListModel({this.labourList});

  LabourListModel.fromJson(Map<String, dynamic> json) {
    if (json['labour_list'] != null) {
      labourList = <LabourList>[];
      json['labour_list'].forEach((v) {
        labourList!.add(LabourList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (labourList != null) {
      data['labour_list'] = labourList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LabourList {
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
  String? headName;

  LabourList(
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
        this.ip,
        this.headName});

  LabourList.fromJson(Map<String, dynamic> json) {
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
    headName = json['head_name'];
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
    data['head_name'] = headName;
    return data;
  }
}