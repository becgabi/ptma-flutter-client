import 'package:floor/floor.dart';
import 'package:ptma_flutter_client/data/network/model/exercise_detail_dto.dart';

@Entity(tableName: "workout")
class FloorWorkout {
  @primaryKey
  int id;
  String name;
  final int trainerId;
  List<ExerciseDetailDto> exercises;

  FloorWorkout({
    required this.id,
    required this.name,
    required this.trainerId,
    required this.exercises,
  });
}
