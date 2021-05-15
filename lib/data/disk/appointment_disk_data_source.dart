import 'package:ptma_flutter_client/data/disk/dao/appointment_dao.dart';
import 'package:ptma_flutter_client/data/disk/model/floor_appointment.dart';
import 'package:ptma_flutter_client/domain/model/appointment.dart';

class AppointmentDiskDataSource {
  final AppointmentDao _appointmentDao;

  AppointmentDiskDataSource(this._appointmentDao);

  Future<List<Appointment>> findAll() async {
    return (await _appointmentDao.findAll() ?? [])
        .map((appointment) => appointment.toDomain())
        .toList();
  }

  Future<void> update(List<Appointment> appointments) async {
    await _deleteAll();
    await _insert(appointments);
  }

  Future _deleteAll() async {
    await _appointmentDao.deleteAll();
  }

  Future<void> _insert(List<Appointment> appointments) async {
    await _appointmentDao.insert(appointments
        .map((appointment) => appointment.toFloorEntity())
        .toList());
  }
}

extension on FloorAppointment {
  Appointment toDomain() {
    return Appointment(
      id: this.id,
      start: this.start,
      end: this.end,
      locationName: this.locationName,
      trainerName: this.trainerName,
      status: this.status,
    );
  }
}

extension on Appointment {
  FloorAppointment toFloorEntity() {
    return FloorAppointment(
      id: this.id,
      start: this.start,
      end: this.end,
      locationName: this.locationName,
      trainerName: this.trainerName,
      status: this.status,
    );
  }
}
