import 'package:devicepe_client/repositories/network/api_client.dart';
import 'package:devicepe_client/repositories/network/api_url.dart';
import 'package:devicepe_client/repositories/network/models/variant_response_model.dart';
import 'package:devicepe_client/utils/sahred_pref.dart';
import 'package:dio/dio.dart';

class VariantService {
  static Future<VarientDetailResponse> getAllVarientDetails() async {
    print("Api Call");
    int modelId = await SharedPref().readInt(SharedPref.MODEL_ID);
    try {
      Response<String> response =
          await ApiClient.dio.get<String>(GET_VARIANT_DETAILS + "$modelId");
      print(response.data);
      return varientDetailResponseFromJson(response.data);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
