import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'exercise_dto.dart';

part 'exercise_detail_dto.g.dart';

@immutable
@JsonSerializable()
class ExerciseDetailDto {
  final int id;
  final int? sets;
  final int? reps;
  final int duration;
  final ExerciseDto exercise;

  ExerciseDetailDto(
      this.id, this.sets, this.reps, this.duration, this.exercise);

  static const fromJsonFactory = _$ExerciseDetailDtoFromJson;

  factory ExerciseDetailDto.fromJson(Map<String, dynamic> json) =>
      _$ExerciseDetailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseDetailDtoToJson(this);
}
