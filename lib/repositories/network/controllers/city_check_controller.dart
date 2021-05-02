import 'package:devicepe_client/repositories/network/services/varient_service.dart';
import 'package:devicepe_client/ui/common/progress_dialog.dart';
import 'package:devicepe_client/utils/sahred_pref.dart';
import 'package:get/get.dart';

class CityCheckController extends GetxController {
  var isLoading = false.obs;

  void checkCity(String city) async {
    isLoading(true);
    try {
      showLoaderDialog();
      var response = await CityCheckService.checkCity(city);

      if (response != null && response.isActive == true) {
      } else {
        Get.snackbar("Alert!", "Service is not available in your area.");
      }
      SharedPref().saveString(SharedPref.LOCATION, city);

      Get.back();
    } catch (e) {
      print("Error - " + e);
    } finally {
      isLoading(false);
    }
  }
}
