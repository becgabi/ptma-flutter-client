import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ptma_flutter_client/data/network/ptma_network_datasource.dart';

class AuthInteractor {
  final PtmaNetworkDataSource _dataSource;

  AuthInteractor(this._dataSource);

  Future<void> login(String email, String password) async {
    final authResult = await _dataSource.login(email, password);
    final storage = new FlutterSecureStorage();
    await storage.write(key: "jwtToken", value: authResult.jwtToken);
  }
}
