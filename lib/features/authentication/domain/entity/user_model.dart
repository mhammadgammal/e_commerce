class UserModel {
  String id;
  String name;
  String email;
  String phone;
  String image;
  String token;
  String points;
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
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      token: json['token'],
      points: json['points'],
      credit: json['credit'],
    );
  }
}
