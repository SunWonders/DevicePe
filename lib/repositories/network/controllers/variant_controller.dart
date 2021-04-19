import 'package:devicepe_client/repositories/network/models/accessaries_details_response.dart';
import 'package:devicepe_client/repositories/network/models/variant_response_model.dart';
import 'package:devicepe_client/repositories/network/services/varient_service.dart';
import 'package:get/get.dart';

class VariantController extends GetxController {
  var variantDetails = <VariantData>[].obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    getAllVarientDetails();
    super.onInit();
  }

  void getAllVarientDetails() async {
    isLoading(true);
    try {
      var response = await VariantService.getAllVarientDetails();

      if (response != null) {
        variantDetails = response.data;
      }
    } catch (e) {
      print("Error - " + e);
    } finally {
      isLoading(false);
    }
  }
}
