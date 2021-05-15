import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:ptma_flutter_client/domain/interactor/workout_interactor.dart';
import 'package:ptma_flutter_client/domain/model/workout.dart';

part 'workout_detail_state.dart';

class WorkoutDetailCubit extends Cubit<WorkoutDetailState> {
  final WorkoutInteractor _interactor;

  WorkoutDetailCubit(this._interactor) : super(Loading());

  void getOne(int id) async {
    emit(Loading());

    Workout? workout;
    try {
      workout = await _interactor.getOne(id);
    } on Exception catch (e) {
      print("Error occurred during loading the workout: ${e.toString()}");
      workout = await _interactor.getCachedWorkout(id);
    }

    if (workout != null) {
      emit(DataReady(workout));
    } else {
      emit(NotFound());
    }
  }
}
