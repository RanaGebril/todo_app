import 'dart:convert';

class UserModel {
  String id;
  String userName;
  String email;
  String phone;
  int age;

  UserModel(
      {this.id = "",
      required this.userName,
      required this.email,
      required this.phone,
      required this.age});

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json["id"],
            userName: json["userNae"],
            email: json["email"],
            phone: json["phone"],
            age: json["age"]);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      " userName": userName,
      " email": email,
      "phone": phone,
      "age": age
    };
  }
}
