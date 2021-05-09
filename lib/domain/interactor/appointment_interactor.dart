import 'package:ptma_flutter_client/data/disk/appointment_disk_data_source.dart';
import 'package:ptma_flutter_client/data/network/ptma_network_datasource.dart';
import 'package:ptma_flutter_client/domain/model/appointment.dart';

class AppointmentInteractor {
  final PtmaNetworkDataSource _networkDataSource;
  final AppointmentDiskDataSource _diskDataSource;

  AppointmentInteractor(this._networkDataSource, this._diskDataSource);

  Future<List<Appointment>> getCachedAppointmentList() async {
    return await _diskDataSource.findAll();
  }

  Future<List<Appointment>> findOwn() async {
    final appointments = await _networkDataSource.findOwn();
    if (appointments.isNotEmpty) {
      await _diskDataSource.update(appointments);
    }
    return appointments;
  }
}
