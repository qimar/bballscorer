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
  bool? disabled;
  String? displayName;
  String? avatarUrl;
  String? locale;
  String? email;
  Int? phoneNumber;
  bool? emailVerified;
  bool? phoneNumberVerified;
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
        id: json["id"] as String?,
        displayName: json["display_name"] as String?,
        locale: json["locale"] as String?,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"] as String),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"] as String),
        lastSeen: json["last_seen"] == null
            ? null
            : DateTime.parse(json["last_seen"] as String),
        disabled: json["disabled"] as bool?,
        emailVerified: json["email_verified "] as bool?,
        isAnonymous: json["is_anonymous "] as bool?,
        defaultRole: json["default_role "] as String?,
        roles: json["roles"] as String?,
        metadata: json["metadata"] as String?,
        email: json["email"] as String?,
        avatarUrl: json["avatarUrl"] as String?,
        phoneNumberVerified: json["phone_number_verified"] as bool?,
      );
}
