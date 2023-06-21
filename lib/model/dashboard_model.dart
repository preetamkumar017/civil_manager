class DashboardModel {
  int? code;
  String? status;
  Result? result;

  DashboardModel({this.code, this.status, this.result});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    result =
    json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  String? labour;
  String? site;
  String? labourHead;
  String? weeklyPayable;

  Result({this.labour, this.site, this.labourHead, this.weeklyPayable});

  Result.fromJson(Map<String, dynamic> json) {
    labour = json['labour'];
    site = json['site'];
    labourHead = json['labour_head'];
    weeklyPayable = json['weekly_payable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['labour'] = labour;
    data['site'] = site;
    data['labour_head'] = labourHead;
    data['weekly_payable'] = weeklyPayable;
    return data;
  }
}
