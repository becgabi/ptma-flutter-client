import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_result_dto.g.dart';

@immutable
@JsonSerializable()
class AuthResultDto {
  final String jwtToken;

  AuthResultDto(this.jwtToken);

  static const fromJsonFactory = _$AuthResultDtoFromJson;

  factory AuthResultDto.fromJson(Map<String, dynamic> json) =>
      _$AuthResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResultDtoToJson(this);
}
