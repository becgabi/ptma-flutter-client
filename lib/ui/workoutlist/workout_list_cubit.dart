import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ptma_flutter_client/domain/interactor/workout_interactor.dart';
import 'package:ptma_flutter_client/domain/model/workout.dart';

part 'workout_list_state.dart';

class WorkoutListCubit extends Cubit<WorkoutListState> {
  final WorkoutInteractor _interactor;

  WorkoutListCubit(this._interactor) : super(Loading());

  void findAll() async {
    emit(Loading());
    try {
      final workouts = await _interactor.findAll();
      emit(ListReady(workouts));
    } on Exception catch (e) {
      print("Error occurred during loading the list: ${e.toString()}");
      final workouts = await _interactor.getCachedWorkoutList();
      emit(ListReady(workouts));
    }
  }
}
