class ProfileModel {
  String? name;
  String? email;
  String? image;
  dynamic sdt;
  dynamic birthday;

  ProfileModel.fromJson(Map json) {
    name = json['name'];
    email = json['email'];
    image = json['image'];
    sdt = json['sdt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['image'] = this.image;
    data['sdt'] = this.sdt;
    return data;
  }
}
