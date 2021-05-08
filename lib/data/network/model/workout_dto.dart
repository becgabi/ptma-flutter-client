import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'exercise_detail_dto.dart';

part 'workout_dto.g.dart';

@immutable
@JsonSerializable()
class WorkoutDto {
  final int id;
  final String name;
  final int trainerId;
  final List<ExerciseDetailDto> exercises;

  WorkoutDto(this.id, this.name, this.trainerId, this.exercises);

  static const fromJsonFactory = _$WorkoutDtoFromJson;

  factory WorkoutDto.fromJson(Map<String, dynamic> json) =>
      _$WorkoutDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutDtoToJson(this);
}
