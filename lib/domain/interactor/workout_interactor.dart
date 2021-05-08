import 'package:ptma_flutter_client/data/network/ptma_network_datasource.dart';
import 'package:ptma_flutter_client/domain/model/workout.dart';

class WorkoutInteractor {
  final PtmaNetworkDataSource _dataSource;

  WorkoutInteractor(this._dataSource);

  Future<List<Workout>> findAll() async {
    return await _dataSource.findAll();
  }

  Future<Workout> getOne(String id) async {
    return await _dataSource.getOne(id);
  }
}
