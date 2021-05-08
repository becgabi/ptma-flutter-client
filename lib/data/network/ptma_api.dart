import 'package:dio/dio.dart';
import 'package:ptma_flutter_client/data/network/model/appointment_min_dto.dart';
import 'package:retrofit/retrofit.dart';

import 'model/auth_result_dto.dart';
import 'model/user_credentials_dto.dart';
import 'model/workout_dto.dart';

part 'ptma_api.g.dart';

@RestApi(baseUrl: "https://https://ptma-test.herokuapp.com//")
abstract class PtmaApi {
  factory PtmaApi() {
    final _dio = Dio();
    // TODO jwt interceptor
    _dio.interceptors.add(LogInterceptor());
    return _PtmaApi(_dio);
  }

  @GET("/api/appointments/own")
  Future<List<AppointmentMinDto>> findOwn();

  @POST("/api/auth/login")
  Future<AuthResultDto> login(@Body() UserCredentialsDto userCredentialsDto);

  @GET("/api/workouts")
  Future<List<WorkoutDto>> findAll();

  @GET("/api/workouts/{id}")
  Future<WorkoutDto> getOne(@Path() String id);
}
