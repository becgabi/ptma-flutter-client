import 'dart:async';

import 'package:floor/floor.dart';
import 'package:ptma_flutter_client/data/disk/converter/floor_appointment_status_converter.dart';
import 'package:ptma_flutter_client/data/disk/converter/floor_date_time_converter.dart';
import 'package:ptma_flutter_client/data/disk/converter/floor_exercise_detail_converter.dart';
import 'package:ptma_flutter_client/data/disk/dao/appointment_dao.dart';
import 'package:ptma_flutter_client/data/disk/dao/workout_dao.dart';
import 'package:ptma_flutter_client/data/disk/model/floor_appointment.dart';
import 'package:ptma_flutter_client/data/disk/model/floor_workout.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(
  version: 1,
  entities: [FloorAppointment, FloorWorkout],
)
@TypeConverters([
  DateTimeConverter,
  AppointmentStatusConverter,
  ExerciseDetailConverter,
])
abstract class AppDatabase extends FloorDatabase {

  AppointmentDao get appointmentDao;

  WorkoutDao get workoutDao;

}
