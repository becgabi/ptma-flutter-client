import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ptma_flutter_client/domain/interactor/appointment_interactor.dart';
import 'package:ptma_flutter_client/domain/model/appointment.dart';

part 'appointment_list_state.dart';

class AppointmentListCubit extends Cubit<AppointmentListState> {
  final AppointmentInteractor _interactor;

  AppointmentListCubit(this._interactor) : super(Loading());

  void findOwn() async {
    emit(Loading());
    try {
      final appointments = await _interactor.findOwn();
      emit(ListReady(appointments));
    } on Exception catch (e) {
      print("Error occurred during loading the list: ${e.toString()}");
      // TODO: load data from cache
    }
  }
}
