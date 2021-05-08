import 'package:ptma_flutter_client/data/network/model/auth_result_dto.dart';
import 'package:ptma_flutter_client/data/network/ptma_api.dart';

import 'model/appointment_min_dto.dart';
import 'model/user_credentials_dto.dart';
import 'model/workout_dto.dart';

class PtmaNetworkDataSource {
  final PtmaApi _api;

  PtmaNetworkDataSource(this._api);

  Future<AuthResultDto> login(String email, String password) async {
    return await _api.login(UserCredentialsDto(email, password));
  }

  Future<List<AppointmentMinDto>> findOwn() async {
    return await _api.findOwn();
  }

  Future<List<WorkoutDto>> findAll() async {
    return await _api.findAll();
  }

  Future<WorkoutDto> getOne(String id) async {
    return await _api.getOne(id);
  }
}
