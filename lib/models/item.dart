import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? name;
  String? type;
  Timestamp? publishedDate;
  String? thumbnailUrl;
  String? description;
  String? status;
  int? price;
  String? address;
  int? phone;

  UserModel({
    this.name,
    this.type,
    this.publishedDate,
    this.thumbnailUrl,
    this.description,
    this.status,
    this.phone,
    this.price,
    this.address,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['title'];
    type = json['shortInfo'];
    publishedDate = json['publishedDate'];
    thumbnailUrl = json['thumbnailUrl'];
    description = json['longDescription'];
    status = json['status'];
    price = json['price'];
    // phone = json['phone'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.name;
    data['shortInfo'] = this.type;
    data['price'] = this.price;
    if (this.publishedDate != null) {
      data['publishedDate'] = this.publishedDate;
    }
    data['thumbnailUrl'] = this.thumbnailUrl;
    data['longDescription'] = this.description;
    data['status'] = this.status;
    data['address'] = this.address;
    data['phone'] = this.phone;
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
