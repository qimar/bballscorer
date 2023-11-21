import 'dart:convert';
import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

@JsonSerializable()
class UserModel {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? lastSeen;
  Bool? disabled;
  String? displayName;
  String? avatarUrl;
  String? locale;
  String? email;
  Int? phoneNumber;
  Bool? emailVerified;
  Bool? phoneNumberVerified;
  String? defaultRole;
  bool? isAnonymous;
  String? roles;
  String? metadata;
  String? accessToken;

  UserModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.lastSeen,
    this.disabled,
    this.displayName,
    this.avatarUrl,
    this.locale,
    this.email,
    this.phoneNumber,
    this.emailVerified,
    this.phoneNumberVerified,
    this.defaultRole,
    this.isAnonymous,
    this.roles,
    this.metadata,
    this.accessToken,
  });

factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    displayName: json["display_name"],
    locale: json["locale"],
    createdAt: DateTime.parse(json["createdAt"]),
    isAnonymous: json["isAnonymous"],
    defaultRole: json["defaultRole"],
    roles: json["roles"],
    metadata: json["metadata"],
    email: json["email"],
    avatarUrl: json["avatarUrl"],
    accessToken: json["accessToken"],
  );

}
