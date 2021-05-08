import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exercise_dto.g.dart';

@immutable
@JsonSerializable()
class ExerciseDto {
  final int id;
  final String name;
  final String description;
  final List<MuscleGroup> muscleGroups;

  ExerciseDto(this.id, this.name, this.description, this.muscleGroups);

  static const fromJsonFactory = _$ExerciseDtoFromJson;

  factory ExerciseDto.fromJson(Map<String, dynamic> json) =>
      _$ExerciseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseDtoToJson(this);
}

enum MuscleGroup {
  ABS,
  BACK,
  BICEPS,
  BOOTY,
  CALVES,
  CARDIO,
  CHEST,
  HAMSTRINGS,
  SHOULDER,
  TRICEPS,
  QUADS
}
