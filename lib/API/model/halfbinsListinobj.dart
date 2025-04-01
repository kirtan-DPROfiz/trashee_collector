class HalfBinsListInObj {
  String? status;
  int? totalHalfFullDustbins;
  List<Dustbins>? dustbins;

  HalfBinsListInObj({this.status, this.totalHalfFullDustbins, this.dustbins});

  HalfBinsListInObj.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalHalfFullDustbins = json['total_half_full_dustbins'];
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
    data['total_half_full_dustbins'] = this.totalHalfFullDustbins;
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
