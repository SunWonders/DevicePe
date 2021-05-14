import 'package:devicepe_client/repositories/network/api_client.dart';
import 'package:devicepe_client/repositories/network/api_url.dart';
import 'package:devicepe_client/repositories/network/models/accessaries_details_response.dart';
import 'package:dio/dio.dart';

class AccessariesService {
  static Future<AccessoriesDetailResponse?> getAllAccessoriesDetails() async {
    print("Api Call");
    try {
      Response<String> response =
          await ApiClient.dio.get<String>(GET_ACCESSORIES_URL);
      if (response.data != null) {
        return accessoriesDetailResponseFromJson(response.data!);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
