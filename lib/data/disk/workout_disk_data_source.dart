import 'package:ptma_flutter_client/data/disk/dao/workout_dao.dart';
import 'package:ptma_flutter_client/data/disk/model/floor_workout.dart';
import 'package:ptma_flutter_client/data/network/model/exercise_detail_dto.dart';
import 'package:ptma_flutter_client/data/network/model/exercise_dto.dart';
import 'package:ptma_flutter_client/data/network/ptma_network_datasource.dart';
import 'package:ptma_flutter_client/domain/model/exercise.dart';
import 'package:ptma_flutter_client/domain/model/exercise_detail.dart';
import 'package:ptma_flutter_client/domain/model/workout.dart';

class WorkoutDiskDataSource {
  final WorkoutDao _workoutDao;

  WorkoutDiskDataSource(this._workoutDao);

  Future<List<Workout>> findAll() async {
    return (await _workoutDao.findAll() ?? [])
        .map((workout) => workout.toDomain())
        .toList();
  }

  Future<void> update(List<Workout> workouts) async {
    await _deleteAll();
    await _insert(workouts);
  }

  Future _deleteAll() async {
    await _workoutDao.deleteAll();
  }

  Future<void> _insert(List<Workout> workouts) async {
    await _workoutDao
        .insert(workouts.map((workout) => workout.toFloorEntity()).toList());
  }

  Future<void> updateWorkout(Workout workout) async {
    await _workoutDao.upsert(workout.toFloorEntity());
  }

  Future<Workout?> findById(int id) async {
    return (await _workoutDao.findById(id))?.toDomain();
  }
}

extension FloorWorkoutExtension on FloorWorkout {
  Workout toDomain() {
    return Workout(
      id: this.id,
      name: this.name,
      trainerId: this.trainerId,
      exercises: this.exercises.map((exercise) => exercise.toDomain()).toList(),
    );
  }
}

extension on Workout {
  FloorWorkout toFloorEntity() {
    return FloorWorkout(
      id: this.id,
      name: this.name,
      trainerId: this.trainerId,
      exercises: this.exercises.map((exercise) => exercise.toDto()).toList(),
    );
  }
}

extension on ExerciseDetail {
  ExerciseDetailDto toDto() {
    return ExerciseDetailDto(
      this.id,
      this.sets,
      this.reps,
      this.duration,
      this.exercise.toDto(),
    );
  }
}

extension on Exercise {
  ExerciseDto toDto() {
    return ExerciseDto(
      this.id,
      this.name,
      this.description,
      this.muscleGroups,
    );
  }
}
