class SiteListModel {
  int? code;
  String? status;
  List<SiteList>? siteList;

  SiteListModel({this.code, this.status, this.siteList});

  SiteListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    if (json['site_list'] != null) {
      siteList = <SiteList>[];
      json['site_list'].forEach((v) {
        siteList!.add(SiteList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    if (siteList != null) {
      data['site_list'] = siteList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SiteList {
  String? id;
  String? catId;
  String? name;
  String? floorNum;
  String? status;
  String? createDate;
  String? updateDate;
  String? ip;

  SiteList(
      { this.id,
        this.catId,
        this.name,
        this.floorNum,
        this.status,
        this.createDate,
        this.updateDate,
        this.ip});

  SiteList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catId = json['cat_id'];
    name = json['name'];
    floorNum = json['floor_num'];
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
    data['floor_num'] = floorNum;
    data['status'] = status;
    data['create_date'] = createDate;
    data['update_date'] = updateDate;
    data['ip'] = ip;
    return data;
  }
}