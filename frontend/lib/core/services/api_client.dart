import 'package:dio/dio.dart';
import '../config/config.dart';
import 'secure_storage_service.dart';

class ApiClient {
  late final Dio _dio;
  final SecureStorageService _storage = SecureStorageService();

  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.apiBaseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _storage.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) {
          // Log errors or handle token expiration globally if needed
          return handler.next(e);
        },
      ),
    );
  }

  Dio get dio => _dio;
}
