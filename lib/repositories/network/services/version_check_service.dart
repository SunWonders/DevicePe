import 'package:devicepe_client/repositories/network/api_client.dart';
import 'package:devicepe_client/repositories/network/api_url.dart';
import 'package:devicepe_client/repositories/network/models/version_check_request.dart';
import 'package:devicepe_client/repositories/network/models/version_check_response.dart';
import 'package:dio/dio.dart';

class VersionCheckService {
  static Future<VersionCheckResponse?> versionCheck() async {
    try {
      Response<String> response = await ApiClient.versionCheck.post<String>(
          VERSION_CHECK,
          data: VersionCheckRequest(
              application: "DEVICE_PE", typeOfApp: "CUSTOMER", version: "1.0"));
      if (response.data == null)
        return null;
      else
        return versionCheckResponseFromJson(response.data!);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
