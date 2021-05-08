import 'package:get_it/get_it.dart';
import 'package:ptma_flutter_client/data/network/ptma_api.dart';
import 'package:ptma_flutter_client/data/network/ptma_network_datasource.dart';
import 'package:ptma_flutter_client/domain/interactor/appointment_interactor.dart';
import 'package:ptma_flutter_client/domain/interactor/auth_interactor.dart';
import 'package:ptma_flutter_client/domain/interactor/workout_interactor.dart';

final injector = GetIt.instance;

void initDependencies() {
  injector.registerSingleton<PtmaApi>(PtmaApi());

  injector.registerSingleton(
    PtmaNetworkDataSource(injector<PtmaApi>()),
  );

  injector.registerSingletonAsync(
    () async {
      return AuthInteractor(
        injector<PtmaNetworkDataSource>(),
      );
    },
  );

  injector.registerSingletonAsync(
    () async {
      return AppointmentInteractor(
        injector<PtmaNetworkDataSource>(),
      );
    },
  );

  injector.registerSingletonAsync(
    () async {
      return WorkoutInteractor(
        injector<PtmaNetworkDataSource>(),
      );
    },
  );
}
