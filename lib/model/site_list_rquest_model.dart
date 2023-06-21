class SiteListRequestModel {
  int? code;
  String? status;
  List<SiteList>? siteList;

  SiteListRequestModel({this.code, this.status, this.siteList});

  SiteListRequestModel.fromJson(Map<String, dynamic> json) {
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
  String? siteId;
  String? siteName;
  String? avl;

  SiteList({this.siteId, this.siteName, this.avl});

  SiteList.fromJson(Map<String, dynamic> json) {
    siteId = json['site_id'];
    siteName = json['site_name'];
    avl = json['avl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['site_id'] = siteId;
    data['site_name'] = siteName;
    data['avl'] = avl;
    return data;
  }
}
