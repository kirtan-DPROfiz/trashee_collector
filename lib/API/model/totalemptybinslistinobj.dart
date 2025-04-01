class TotalEmptyListInObj {
  String? status;
  int? totalEmptyDustbins;
  List<Dustbins>? dustbins;

  TotalEmptyListInObj({this.status, this.totalEmptyDustbins, this.dustbins});

  TotalEmptyListInObj.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalEmptyDustbins = json['total_empty_dustbins'];
    if (json['dustbins'] != null) {
      dustbins = <Dustbins>[];
      json['dustbins'].forEach((v) {
        dustbins!.add(new Dustbins.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['total_empty_dustbins'] = this.totalEmptyDustbins;
    if (this.dustbins != null) {
      data['dustbins'] = this.dustbins!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dustbins {
  int? dustbinId;
  String? city;
  String? area;
  String? location;
  String? status;

  Dustbins({this.dustbinId, this.city, this.area, this.location, this.status});

  Dustbins.fromJson(Map<String, dynamic> json) {
    dustbinId = json['dustbin_id'];
    city = json['city'];
    area = json['area'];
    location = json['location'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dustbin_id'] = this.dustbinId;
    data['city'] = this.city;
    data['area'] = this.area;
    data['location'] = this.location;
    data['status'] = this.status;
    return data;
  }
}
