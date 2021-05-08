import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:ptma_flutter_client/data/network/model/appointment_min_dto.dart';

@immutable
class Appointment extends Equatable {
  final int id;
  final DateTime start;
  final DateTime end;
  final String locationName;
  final String trainerName;
  final AppointmentStatus status;

  const Appointment({
    required this.id,
    required this.start,
    required this.end,
    required this.locationName,
    required this.trainerName,
    required this.status,
  });

  Appointment copyWith({
    int? id,
    DateTime? start,
    DateTime? end,
    String? locationName,
    String? trainerName,
    AppointmentStatus? status,
  }) {
    return new Appointment(
      id: id ?? this.id,
      start: start ?? this.start,
      end: end ?? this.end,
      locationName: locationName ?? this.locationName,
      trainerName: trainerName ?? this.trainerName,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        id,
        start,
        end,
        locationName,
        trainerName,
        status,
      ];
}
