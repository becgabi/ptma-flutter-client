import 'package:floor/floor.dart';
import 'package:ptma_flutter_client/data/disk/model/floor_workout.dart';

@dao
abstract class WorkoutDao {

  @Query("SELECT * FROM workout")
  Future<List<FloorWorkout>?> findAll();

  @Insert()
  Future<void> insert(List<FloorWorkout> workouts);

  @Query("DELETE FROM workout")
  Future<void> deleteAll();

  @Query("SELECT * FROM workout WHERE id = :id")
  Future<FloorWorkout?> findById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> upsert(FloorWorkout workout);

}
