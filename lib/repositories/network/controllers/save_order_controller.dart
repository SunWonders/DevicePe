import 'package:devicepe_client/repositories/local/dao/login_response_dao.dart';
import 'package:devicepe_client/repositories/local/dao/variant_data_dao.dart';
import 'package:devicepe_client/repositories/network/models/save_order_request.dart';
import 'package:devicepe_client/repositories/network/models/save_order_response.dart';
import 'package:devicepe_client/repositories/network/services/order_save_service.dart';
import 'package:devicepe_client/ui/common/progress_dialog.dart';
import 'package:devicepe_client/ui/orders/order_success.dart';
import 'package:devicepe_client/utils/sahred_pref.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  var saveOrderResponse = SaveOrderResponse().obs;
  var isLoading = false.obs;

  void buildSaveOrderRequest(Map<String, dynamic> formData) async {
    isLoading(true);
    showLoaderDialog();

    var variantData = await VariantDataDao().retrieve();
    var price = await SharedPref().readDouble(SharedPref.FINAL_PRICE);
    var loginData = await LoginResponseDao().retrieve();

    var singleSelection =
        await SharedPref().readString(SharedPref.SINGLE_SELECTION);
    var singleSelectionList = singleSelection.split("---");
    var data = <CheckListDatum>[];
    for (int i = 0; i < singleSelectionList.length; i++) {
      data.add(CheckListDatum(
          checkListId: int.parse(singleSelectionList[i].split("--")[0]),
          userSelectedValue: [
            int.parse(singleSelectionList[i + 1].split("--")[0])
          ]));
      i++;
    }

    var b = await SharedPref().readString(SharedPref.MULTIPLE_SELECTION);
    var c = b.split(",");

    c.forEach((element) {
      var multipleSelectionList = element.split("---");
      var checkListId = multipleSelectionList[0].split("--")[0];
      var values = multipleSelectionList[1].split("--");
      var val = <int>[];

      for (int j = 0; j < values.length - 1; j++) {
        val.add(int.parse(values[j]));
        j++;
      }

      data.add(CheckListDatum(
          checkListId: int.parse(checkListId), userSelectedValue: val));
    });

    var request = SaveOrderRequest();
    request.varientId = variantData.id;
    request.checkListData = data;
    request.price = price;

    request.address = formData["address"];
    request.fullname = formData["name"];
    request.mobileNumber = formData["phoneNumber"];
    request.emailId = formData["email"];
    request.city = formData["city"];
    request.state = formData["state"];
    request.pincode = formData["pinCode"];
    request.pickuptime = (formData["date"] as DateTime).millisecond;
    request.description = formData["comments"];
    request.latitude = 0.0;
    request.longitude = 0.0;
    request.userId = loginData.userId;
    saveOrder(request);
  }

  void saveOrder(SaveOrderRequest saveOrderRequest) async {
    try {
      var response = await SaveOrderService.saveOrder(saveOrderRequest);
      Get.back();
      if (response != null) {
        saveOrderResponse.value = response;
        if (response.checkStatus()) {
          Get.offAll(() => OrderSuccessDialog(
                orderId: response.data,
              ));
        } else {
          Get.snackbar("Alert", "Unable To Book an Order. Please Try Again..!");
        }
      }
    } catch (e) {
      print("Error - " + e);
    } finally {
      isLoading(false);
    }
  }
}
