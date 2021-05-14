import 'package:devicepe_client/repositories/network/models/accessaries_details_response.dart';
import 'package:devicepe_client/repositories/network/services/accessaries_service.dart';
import 'package:get/get.dart';

class AccessoriesController extends GetxController {
  var accessoriesDetails = <AccessoriesDetailData>[].obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    getAllAccessoriesDetails();
    super.onInit();
  }

  void getAllAccessoriesDetails() async {
    isLoading(true);
    try {
      var response = await AccessariesService.getAllAccessoriesDetails();

      if (response != null && response.data != null) {
        accessoriesDetails = response.data!;
      }
    } catch (e) {
      print("Error - $e");
    } finally {
      isLoading(false);
    }
  }
}
