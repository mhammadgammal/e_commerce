import 'package:hive_flutter/hive_flutter.dart';

part 'user_model.g.dart';
@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String email;
  @HiveField(3)
  String phone;
  @HiveField(4)
  String image;
  @HiveField(5)
  String token;
  @HiveField(6)
  String points;
  @HiveField(7)
  String credit;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.token,
    required this.points,
    required this.credit,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'].toString(),
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      token: json['token'],
      points: json['points'].toString(),
      credit: json['credit'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'token': token,
      'points': points,
      'credit': credit,
    };
  }
}
