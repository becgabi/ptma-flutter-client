import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:ptma_flutter_client/domain/model/exercise.dart';

@immutable
class ExerciseDetail extends Equatable {
  final int id;
  final int sets;
  final int reps;
  final int duration;
  final Exercise exercise;

  const ExerciseDetail({
    required this.id,
    required this.sets,
    required this.reps,
    required this.duration,
    required this.exercise,
  });

  ExerciseDetail copyWith({
    int? id,
    int? sets,
    int? reps,
    int? duration,
    Exercise? exercise,
  }) {
    return new ExerciseDetail(
      id: id ?? this.id,
      sets: sets ?? this.sets,
      reps: reps ?? this.reps,
      duration: duration ?? this.duration,
      exercise: exercise ?? this.exercise,
    );
  }

  @override
  List<Object?> get props => [
        id,
        sets,
        reps,
        duration,
        exercise,
      ];
}
