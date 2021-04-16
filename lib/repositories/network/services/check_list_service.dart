import 'package:devicepe_client/repositories/network/api_client.dart';
import 'package:devicepe_client/repositories/network/api_url.dart';
import 'package:devicepe_client/repositories/network/models/check_list_detail_response.dart';
import 'package:devicepe_client/utils/sahred_pref.dart';
import 'package:dio/dio.dart';

class CheckListService {
  static Future<CheckListDetailResponse> getCheckListDetails() async {
    print("Api Call");
    try {
      int variantId = await SharedPref().getSelectedVarientId();
      print(variantId);
      Response<String> response =
          await ApiClient.dio.get<String>(GET_CHECK_LIST + "$variantId");
      print(response.data);
      return checkListDetailResponseFromJson(response.data);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
