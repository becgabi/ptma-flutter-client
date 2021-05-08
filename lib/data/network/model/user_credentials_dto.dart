import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_credentials_dto.g.dart';

@immutable
@JsonSerializable()
class UserCredentialsDto {
  final String email;
  final String password;

  UserCredentialsDto(this.email, this.password);

  static const fromJsonFactory = _$UserCredentialsDtoFromJson;

  factory UserCredentialsDto.fromJson(Map<String, dynamic> json) =>
      _$UserCredentialsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserCredentialsDtoToJson(this);
}
