import 'package:devicepe_client/repositories/network/api_url.dart';
import 'package:dio/dio.dart';

class ApiClient {
  static var dio = Dio(
    BaseOptions(
      baseUrl: BASE_URL,
    ),
  );
}
