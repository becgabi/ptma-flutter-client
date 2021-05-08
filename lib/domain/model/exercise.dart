import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:ptma_flutter_client/data/network/model/exercise_dto.dart';

@immutable
class Exercise extends Equatable {
  final int id;
  final String name;
  final String description;
  final List<MuscleGroup> muscleGroups;

  const Exercise({
    required this.id,
    required this.name,
    required this.description,
    required this.muscleGroups,
  });

  Exercise copyWith({
    int? id,
    String? name,
    String? description,
    List<MuscleGroup>? muscleGroups,
  }) {
    return new Exercise(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      muscleGroups: muscleGroups ?? this.muscleGroups,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        muscleGroups,
      ];
}
