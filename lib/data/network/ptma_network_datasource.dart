import 'package:ptma_flutter_client/data/network/model/auth_result_dto.dart';
import 'package:ptma_flutter_client/data/network/ptma_api.dart';
import 'package:ptma_flutter_client/domain/model/appointment.dart';
import 'package:ptma_flutter_client/domain/model/exercise.dart';
import 'package:ptma_flutter_client/domain/model/exercise_detail.dart';
import 'package:ptma_flutter_client/domain/model/workout.dart';

import 'model/appointment_min_dto.dart';
import 'model/exercise_detail_dto.dart';
import 'model/exercise_dto.dart';
import 'model/user_credentials_dto.dart';
import 'model/workout_dto.dart';

class PtmaNetworkDataSource {
  final PtmaApi _api;

  PtmaNetworkDataSource(this._api);

  Future<AuthResultDto> login(String email, String password) async {
    return await _api.login(UserCredentialsDto(email, password));
  }

  Future<List<Appointment>> findOwn() async {
    final appointments = await _api.findOwn();
    return appointments.map((appointment) => appointment.toDomain()).toList();
  }

  Future<List<Workout>> findAll() async {
    final workouts = await _api.findAll();
    return workouts.map((workout) => workout.toDomain()).toList();
  }

  Future<Workout?> getOne(int id) async {
    final workout = await _api.getOne(id);
    return workout?.toDomain();
  }
}

extension on AppointmentMinDto {
  Appointment toDomain() {
    return Appointment(
      id: this.id,
      start: this.start,
      end: this.end,
      locationName: this.locationName,
      trainerName: this.trainerName,
      status: this.status,
    );
  }
}

extension on ExerciseDto {
  Exercise toDomain() {
    return Exercise(
      id: this.id,
      name: this.name,
      description: this.description,
      muscleGroups: this.muscleGroups,
    );
  }
}

extension ExerciseDetailExtension on ExerciseDetailDto {
  ExerciseDetail toDomain() {
    return ExerciseDetail(
      id: this.id,
      sets: this.sets,
      reps: this.reps,
      duration: this.duration,
      exercise: this.exercise.toDomain(),
    );
  }
}

extension on WorkoutDto {
  Workout toDomain() {
    return Workout(
      id: this.id,
      name: this.name,
      trainerId: this.trainerId,
      exercises: this.exercises.map((exercise) => exercise.toDomain()).toList(),
    );
  }
}
