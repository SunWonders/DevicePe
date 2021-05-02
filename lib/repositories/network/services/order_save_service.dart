import 'package:devicepe_client/repositories/network/api_client.dart';
import 'package:devicepe_client/repositories/network/api_url.dart';
import 'package:devicepe_client/repositories/network/models/save_order_request.dart';
import 'package:devicepe_client/repositories/network/models/save_order_response.dart';
import 'package:dio/dio.dart';

class SaveOrderService {
  static Future<SaveOrderResponse> saveOrder(
      SaveOrderRequest registerRequest) async {
    print("Api Call");
    try {
      Response<String> response =
          await ApiClient.dio.post<String>(SAVE_ORDER, data: registerRequest);
      return saveOrderResponseFromJson(response.data);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
