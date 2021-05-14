import 'package:ptma_flutter_client/data/disk/workout_disk_data_source.dart';
import 'package:ptma_flutter_client/data/network/ptma_network_datasource.dart';
import 'package:ptma_flutter_client/domain/model/workout.dart';

class WorkoutInteractor {
  final PtmaNetworkDataSource _dataSource;
  final WorkoutDiskDataSource _diskDataSource;

  WorkoutInteractor(this._dataSource, this._diskDataSource);

  Future<List<Workout>> findAll() async {
    final workouts = await _dataSource.findAll();
    if (workouts.isNotEmpty) {
      await _diskDataSource.update(workouts);
    }
    return workouts;
  }

  Future<Workout?> getOne(String id) async {
    final workout = await _dataSource.getOne(id);
    if (workout != null) {
      await _diskDataSource.updateWorkout(workout);
    }
    return workout;
  }

  Future<List<Workout>> getCachedWorkoutList() async {
    return await _diskDataSource.findAll();
  }

  Future<Workout?> getCachedWorkout(int id) async {
    return await _diskDataSource.findById(id);
  }
}
