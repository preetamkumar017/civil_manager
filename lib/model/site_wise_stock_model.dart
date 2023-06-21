class SiteWiseStockModel {
  int? code;
  String? status;
  List<MaterialList>? materialList;
  List<SiteList>? siteList;

  SiteWiseStockModel(
      {this.code, this.status, this.materialList, this.siteList});

  SiteWiseStockModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    if (json['material_list'] != null) {
      materialList = <MaterialList>[];
      json['material_list'].forEach((v) {
        materialList!.add(MaterialList.fromJson(v));
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
    data['code'] = code;
    data['status'] = status;
    if (materialList != null) {
      data['material_list'] =
          materialList!.map((v) => v.toJson()).toList();
    }
    if (siteList != null) {
      data['site_list'] = siteList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MaterialList {
  String? id;
  String? siteId;
  String? siteName;
  String? matId;
  String? matName;
  String? matUnit;
  String? matQty;
  String? createDate;
  String? minQty;

  MaterialList(
      {this.id,
        this.siteId,
        this.siteName,
        this.matId,
        this.matName,
        this.matUnit,
        this.matQty,
        this.createDate,
        this.minQty});

  MaterialList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    siteId = json['site_id'];
    siteName = json['site_name'];
    matId = json['mat_id'];
    matName = json['mat_name'];
    matUnit = json['mat_unit'];
    matQty = json['mat_qty'];
    createDate = json['create_date'];
    minQty = json['min_qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['site_id'] = siteId;
    data['site_name'] = siteName;
    data['mat_id'] = matId;
    data['mat_name'] = matName;
    data['mat_unit'] = matUnit;
    data['mat_qty'] = matQty;
    data['create_date'] = createDate;
    data['min_qty'] = minQty;
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
      {this.id,
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
