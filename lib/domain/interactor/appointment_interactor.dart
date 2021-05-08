import 'package:ptma_flutter_client/data/network/ptma_network_datasource.dart';
import 'package:ptma_flutter_client/domain/model/appointment.dart';

class AppointmentInteractor {
  final PtmaNetworkDataSource _dataSource;

  AppointmentInteractor(this._dataSource);

  Future<List<Appointment>> findOwn() async {
    return await _dataSource.findOwn();
  }
}
