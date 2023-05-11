import '../../domain/entities/user.dart';

class UserModel {
  final String id;
  final String name;
  final String email;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String,dynamic> toJSON(){
    return {
      'id': id,
      'name': name,
      'email':email,
    };
  }


  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
    );
  }

  User toEntity() {
    return User(
      id: id,
      name: name,
      email: email,
    );
  }
}
