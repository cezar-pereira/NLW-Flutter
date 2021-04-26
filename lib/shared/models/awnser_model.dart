import 'dart:convert';

import 'package:nlw_flutter/shared/models/user_model.dart';

class AwnserModel {
  final String title;
  final bool isRight;

  AwnserModel({required this.title, this.isRight = false});

  Map<String, dynamic> toMap() => {'title': title, 'isRight': isRight};

  String toJson() => json.encode(toMap());

  factory AwnserModel.fromMap(Map<String, dynamic> map) =>
      AwnserModel(title: map['title'], isRight: map['isRight'] ?? false);

  factory AwnserModel.fromJson(String data) =>
      AwnserModel.fromMap(json.decode(data));
}
