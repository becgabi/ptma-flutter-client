part of 'workout_detail_cubit.dart';

@immutable
abstract class WorkoutDetailState extends Equatable {}

class Loading extends WorkoutDetailState {
  @override
  List<Object?> get props => [];
}

class NotFound extends WorkoutDetailState {
  @override
  List<Object?> get props => [];
}

class DataReady extends WorkoutDetailState {
  final Workout workout;

  DataReady(this.workout);

  DataReady copyWith({Workout? workout}) {
    return DataReady(workout ?? this.workout);
  }

  @override
  List<Object> get props => [workout];
}
