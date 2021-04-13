import 'package:devicepe_client/repositories/network/api_client.dart';
import 'package:devicepe_client/repositories/network/api_url.dart';
import 'package:devicepe_client/repositories/network/models/brand_detail_response.dart';
import 'package:dio/dio.dart';

class BrandService {
  static Future<BrandDetailResponse> getBrandList() async {
    print("Api Call");
    try {
      Response<String> response =
          await ApiClient.dio.get<String>(GET_BRAND_LIST);
      print(response.data);
      return brandDetailResponseFromJson(response.data);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
