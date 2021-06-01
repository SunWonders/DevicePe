import 'package:devicepe_client/repositories/local/dao/login_response_dao.dart';
import 'package:devicepe_client/repositories/network/api_client.dart';
import 'package:devicepe_client/repositories/network/api_url.dart';
import 'package:devicepe_client/repositories/network/models/login_response.dart';
import 'package:devicepe_client/repositories/network/models/order_detail_response.dart';
import 'package:devicepe_client/repositories/network/models/save_order_request.dart';
import 'package:devicepe_client/repositories/network/models/save_order_response.dart';
import 'package:dio/dio.dart';

class SaveOrderService {
  static Future<SaveOrderResponse?> saveOrder(
      SaveOrderRequest registerRequest) async {
    print("Api Call");
    try {
      Response<String> response =
          await ApiClient.dio.post<String>(SAVE_ORDER, data: registerRequest);
      if (response.data == null)
        return null;
      else
        return saveOrderResponseFromJson(response.data!);
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<OrderDetailResponse?> getOrderDetails() async {
    try {
      LoginResponse? userData = await LoginResponseDao().retrieve();

      Response<String> response = await ApiClient.dio
          .get<String>(GET_ORDERS_BY_USER_ID + "${userData?.userId}");
      print(response.data);
      if (response.data == null)
        return null;
      else
        return orderDetailResponseFromJson(response.data!);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
