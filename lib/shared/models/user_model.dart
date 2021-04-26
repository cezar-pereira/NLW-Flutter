import 'dart:convert';

class UserModel {
  final String name;
  final String photoUrl;
  final int score;

  UserModel({required this.name, required this.photoUrl, this.score = 0});

  Map<String, dynamic> toMap() =>
      {'name': name, 'photoUrl': photoUrl, 'score': score};

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> map) =>
      UserModel(name: map['name'], photoUrl: map['photoUrl']);

  factory UserModel.fromJson(String data) =>
      UserModel.fromMap(json.decode(data));
}
