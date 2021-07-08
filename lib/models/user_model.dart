class UserModel {
  String? address;
  String? phone;
  String? name;
  String? email;
  String? url;

  UserModel({
    this.phone,
    this.address,
    this.url,
    this.email,
    this.name,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    url = json['url'];
    phone = json['phone'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['address'] = this.address;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class PublishDate {
  String? date;

  PublishDate({this.date});

  PublishDate.fromJson(Map<String, dynamic> json) {
    date = json['$date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$date'] = this.date;
    return data;
  }
}
