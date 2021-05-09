import 'package:floor/floor.dart';
import 'package:ptma_flutter_client/data/network/model/appointment_min_dto.dart';

@Entity(tableName: "appointment")
class FloorAppointment {
  @primaryKey
  int id;
  DateTime start;
  DateTime end;
  String locationName;
  String trainerName;
  AppointmentStatus status;

  FloorAppointment({
    required this.id,
    required this.start,
    required this.end,
    required this.locationName,
    required this.trainerName,
    required this.status,
  });
}
