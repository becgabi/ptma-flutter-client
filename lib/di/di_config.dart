import 'package:get_it/get_it.dart';
import 'package:ptma_flutter_client/data/disk/app_database.dart';
import 'package:ptma_flutter_client/data/disk/appointment_disk_data_source.dart';
import 'package:ptma_flutter_client/data/disk/dao/appointment_dao.dart';
import 'package:ptma_flutter_client/data/disk/dao/workout_dao.dart';
import 'package:ptma_flutter_client/data/disk/workout_disk_data_source.dart';
import 'package:ptma_flutter_client/data/network/dio_config.dart';
import 'package:ptma_flutter_client/data/network/ptma_api.dart';
import 'package:ptma_flutter_client/data/network/ptma_network_datasource.dart';
import 'package:ptma_flutter_client/domain/interactor/appointment_interactor.dart';
import 'package:ptma_flutter_client/domain/interactor/auth_interactor.dart';
import 'package:ptma_flutter_client/domain/interactor/workout_interactor.dart';
import 'package:ptma_flutter_client/ui/appointmentlist/appointment_list_cubit.dart';
import 'package:ptma_flutter_client/ui/login/login_cubit.dart';
import 'package:ptma_flutter_client/ui/workoutlist/workout_list_cubit.dart';

final injector = GetIt.instance;

void initDependencies() {

  _registerNetworkDependencies();

  _registerDiskDependencies();

  _registerDomainDependencies();

  _registerCubitDependencies();

}

void _registerNetworkDependencies() {
  injector.registerSingleton<DioConfig>(DioConfig());
  injector.registerFactory(() => PtmaApi(injector<DioConfig>()));
  injector.registerSingleton(PtmaNetworkDataSource(injector<PtmaApi>()));
}

void _registerDiskDependencies() {
  injector.registerSingletonAsync<AppDatabase>(() async {
    return await $FloorAppDatabase
        .inMemoryDatabaseBuilder()
        /*.databaseBuilder("ptma_database.db")*/
        .build();
  });
  injector.registerSingletonAsync<AppointmentDao>(
    () async {
      return injector<AppDatabase>().appointmentDao;
    },
    dependsOn: [AppDatabase],
  );
  injector.registerSingletonAsync(
    () async {
      return AppointmentDiskDataSource(
        injector<AppointmentDao>(),
      );
    },
    dependsOn: [AppointmentDao],
  );
  injector.registerSingletonAsync<WorkoutDao>(
    () async {
      return injector<AppDatabase>().workoutDao;
    },
    dependsOn: [AppDatabase],
  );
  injector.registerSingletonAsync(
    () async {
      return WorkoutDiskDataSource(
        injector<WorkoutDao>(),
      );
    },
    dependsOn: [WorkoutDao],
  );
}

void _registerDomainDependencies() {
  injector.registerSingletonAsync(
    () async {
      return AuthInteractor(injector<PtmaNetworkDataSource>());
    },
  );
  injector.registerSingletonAsync(
    () async {
      return AppointmentInteractor(
        injector<PtmaNetworkDataSource>(),
        injector<AppointmentDiskDataSource>(),
      );
    },
    dependsOn: [AppointmentDiskDataSource],
  );
  injector.registerSingletonAsync(
    () async {
      return WorkoutInteractor(
        injector<PtmaNetworkDataSource>(),
        injector<WorkoutDiskDataSource>(),
      );
    },
    dependsOn: [WorkoutDiskDataSource],
  );
}

void _registerCubitDependencies() {
  injector.registerFactory(
    () => LoginCubit(injector<AuthInteractor>()),
  );
  injector.registerFactory(
    () => AppointmentListCubit(injector<AppointmentInteractor>()),
  );
  injector.registerFactory(
    () => WorkoutListCubit(injector<WorkoutInteractor>()),
  );
}
