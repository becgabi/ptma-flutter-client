import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'appointment_min_dto.g.dart';

@immutable
@JsonSerializable()
class AppointmentMinDto {
  final int id;
  final DateTime start;
  final DateTime end;
  final String locationName;
  final String trainerName;
  final AppointmentStatus status;

  AppointmentMinDto(this.id, this.start, this.end, this.locationName,
      this.trainerName, this.status);

  static const fromJsonFactory = _$AppointmentMinDtoFromJson;

  factory AppointmentMinDto.fromJson(Map<String, dynamic> json) =>
      _$AppointmentMinDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentMinDtoToJson(this);
}

enum AppointmentStatus { REQUESTED, ACCEPTED, CANCELED }
