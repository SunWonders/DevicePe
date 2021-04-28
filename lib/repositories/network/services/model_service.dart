import 'package:devicepe_client/repositories/network/api_client.dart';
import 'package:devicepe_client/repositories/network/api_url.dart';
import 'package:devicepe_client/repositories/network/models/model_detail_response.dart';
import 'package:devicepe_client/utils/sahred_pref.dart';
import 'package:dio/dio.dart';

class ModelService {
  static Future<ModelDetailResponse> getModelByBrandId() async {
    try {
      int brandId = await SharedPref().getSelectedBrand();
      Response<String> response =
          await ApiClient.dio.get<String>(GET_MODEL_BY_BRAND_ID + "$brandId");
      print(response.data);
      return modelDetailResponseFromJson(response.data);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
