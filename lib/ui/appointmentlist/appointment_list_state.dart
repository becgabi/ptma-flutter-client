part of 'appointment_list_cubit.dart';

@immutable
abstract class AppointmentListState extends Equatable {}

class Loading extends AppointmentListState {
  @override
  List<Object?> get props => [];
}

class ListReady extends AppointmentListState {
  final List<Appointment> appointments;

  ListReady(this.appointments);

  ListReady copyWith({List<Appointment>? appointments}) {
    return ListReady(appointments ?? this.appointments);
  }

  @override
  List<Object> get props => [appointments];
}
