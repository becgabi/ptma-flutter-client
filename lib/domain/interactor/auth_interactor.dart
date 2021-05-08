import 'package:ptma_flutter_client/data/network/ptma_network_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInteractor {
  final PtmaNetworkDataSource _dataSource;

  AuthInteractor(this._dataSource);

  Future<void> login(String email, String password) async {
    final authResult = await _dataSource.login(email, password);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwtToken', authResult.jwtToken);
  }
}
