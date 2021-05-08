import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:ptma_flutter_client/domain/model/exercise_detail.dart';

@immutable
class Workout extends Equatable {
  final int id;
  final String name;
  final int trainerId;
  final List<ExerciseDetail> exercises;

  const Workout({
    required this.id,
    required this.name,
    required this.trainerId,
    required this.exercises,
  });

  Workout copyWith({
    int? id,
    String? name,
    int? trainerId,
    List<ExerciseDetail>? exercises,
  }) {
    return new Workout(
      id: id ?? this.id,
      name: name ?? this.name,
      trainerId: trainerId ?? this.trainerId,
      exercises: exercises ?? this.exercises,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        trainerId,
        exercises,
      ];
}
