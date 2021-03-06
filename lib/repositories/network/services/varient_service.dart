import 'package:devicepe_client/repositories/network/api_client.dart';
import 'package:devicepe_client/repositories/network/api_url.dart';
import 'package:devicepe_client/repositories/network/models/city_check_response.dart';
import 'package:devicepe_client/repositories/network/models/variant_response_model.dart';
import 'package:devicepe_client/utils/sahred_pref.dart';
import 'package:dio/dio.dart';

class VariantService {
  static Future<VarientDetailResponse?> getAllVarientDetails() async {
    print("Api Call");
    int modelId = await SharedPref().readInt(SharedPref.MODEL_ID);
    try {
      Response<String> response =
          await ApiClient.dio.get<String>(GET_VARIANT_DETAILS + "$modelId");
      if (response.data == null)
        return null;
      else
        return varientDetailResponseFromJson(response.data!);
    } catch (e) {
      print(e);
      return null;
    }
  }
}

class CityCheckService {
  static Future<CityCheckResponse?> checkCity(String city) async {
    print("Api Call");
    try {
      Response<String> response =
          await ApiClient.dio.get<String>(CHECK_CITY + "$city");
      if (response.data == null)
        return null;
      else
        return cityCheckResponseFromJson(response.data!);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
