// class LabourHeadListModel {
//   List<String>? data;

//   LabourHeadListModel({this.data});

//   LabourHeadListModel.fromJson(Map<String, dynamic> json) {
//     data = json['data'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['data'] = this.data;
//     return data;
//   }
// }

class LabourHeadListModel {
  List<LabourHead>? labourHead;

  LabourHeadListModel({this.labourHead});

  LabourHeadListModel.fromJson(Map<String, dynamic> json) {
    if (json['labour_head'] != null) {
      labourHead = <LabourHead>[];
      json['labour_head'].forEach((v) {
        labourHead!.add(LabourHead.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (labourHead != null) {
      data['labour_head'] = labourHead!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LabourHead {
  String? fullName;
  String? id;

  LabourHead({this.fullName, this.id});

  LabourHead.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['full_name'] = fullName;
    data['id'] = id;
    return data;
  }
}