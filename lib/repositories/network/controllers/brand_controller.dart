import 'package:devicepe_client/repositories/network/services/brand_service.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  var brandDetails = [].obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    getAllBrandDetails();
    super.onInit();
  }

  void getAllBrandDetails() async {
    isLoading(true);
    try {
      var response = await BrandService.getBrandList();

      if (response != null && response.data != null) {
        brandDetails = response.data!;
      }
    } catch (e) {
      print("Error - $e");
    } finally {
      isLoading(false);
    }
  }
}
