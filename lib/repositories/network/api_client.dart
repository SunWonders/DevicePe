import 'dart:convert';
import 'dart:io';

import 'package:devicepe_client/repositories/network/api_url.dart';
import 'package:dio/dio.dart';

class ApiClient {
  static var dio = Dio(
    BaseOptions(
      baseUrl: BASE_URL,
    ),
  );

  static var versionCheck = Dio(
    BaseOptions(
      baseUrl: "http://api.aeiou.co.in:90/",
      headers: {
        HttpHeaders.authorizationHeader:
            "Basic " + base64.encode(utf8.encode("sunwonders:sunwonders@123"))
      },
    ),
  );
}
