import 'package:devicepe_client/repositories/network/services/model_service.dart';
import 'package:get/get.dart';

class ModelController extends GetxController {
  var modelDetails = [].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    getAllModelDetailsForSelectedBrand();
    super.onInit();
  }

  void getAllModelDetailsForSelectedBrand() async {
    isLoading(true);
    try {
      var response = await ModelService.getModelByBrandId();

      if (response != null) {
        modelDetails = response.data;
        isLoading(false);
      } else {
        isLoading(false);
      }
    } catch (e) {
      print("Error - " + e);
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }
}
