import 'package:ptma_flutter_client/data/network/ptma_network_datasource.dart';

class AuthInteractor {
  final PtmaNetworkDataSource _dataSource;

  AuthInteractor(this._dataSource);

  Future<void> login(String email, String password) async {
    final authResult = await _dataSource.login(email, password);
    // TODO save authResult.jwtToken
  }
}
