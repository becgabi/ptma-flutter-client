import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DioConfig {
  Dio get dio {
    final _dio = Dio();
    _dio.interceptors.add(
      InterceptorsWrapper(onRequest: (request, handler) async {
        final storage = new FlutterSecureStorage();
        String jwtToken = await storage.read(key: "jwtToken") ?? "";
        request.headers["Authorization"] = "Bearer $jwtToken";
        handler.next(request);
      }),
    );
    _dio.interceptors.add(LogInterceptor());
    return _dio;
  }
}
