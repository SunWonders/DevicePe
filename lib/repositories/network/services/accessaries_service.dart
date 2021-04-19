import 'package:devicepe_client/repositories/network/api_client.dart';
import 'package:devicepe_client/repositories/network/api_url.dart';
import 'package:devicepe_client/repositories/network/models/accessaries_details_response.dart';
import 'package:dio/dio.dart';

class AccessariesService {
  static Future<AccessoriesDetailResponse> getAllAccessoriesDetails() async {
    print("Api Call");
    try {
      Response<String> response =
          await ApiClient.dio.get<String>(GET_ACCESSORIES_URL);
      print(response.data);
      return accessoriesDetailResponseFromJson(response.data);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
