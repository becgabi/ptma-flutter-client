part of 'workout_list_cubit.dart';

@immutable
abstract class WorkoutListState extends Equatable {}

class Loading extends WorkoutListState {
  @override
  List<Object?> get props => [];
}

class ListReady extends WorkoutListState {
  final List<Workout> workouts;

  ListReady(this.workouts);

  ListReady copyWith({List<Workout>? workouts}) {
    return ListReady(workouts ?? this.workouts);
  }

  @override
  List<Object> get props => [workouts];
}
