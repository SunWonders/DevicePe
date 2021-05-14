import 'package:devicepe_client/repositories/local/dao/variant_data_dao.dart';
import 'package:devicepe_client/repositories/network/models/variant_response_model.dart';
import 'package:devicepe_client/repositories/network/services/varient_service.dart';
import 'package:devicepe_client/utils/sahred_pref.dart';
import 'package:get/get.dart';

class VariantController extends GetxController {
  var variantDetails = <VariantData>[].obs;
  var isLoading = false.obs;
  Rx<VariantData> selectedVariantData = VariantData().obs;

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
        variantDetails =
            (response.data != null ? response.data : <VariantData>[].obs)!;
        if (variantDetails.isNotEmpty) {
          selectedVariantData = variantDetails[0].obs;
          SharedPref().saveInt(
              SharedPref.VARIANT_ID,
              selectedVariantData.value.id == null
                  ? 0
                  : selectedVariantData.value.id!);
          SharedPref().saveDouble(
              SharedPref.BASE_PRICE,
              selectedVariantData.value.basePrice == null
                  ? 0.0
                  : selectedVariantData.value.basePrice!);
          VariantDataDao().insert(variantDetails[0]);
        }
      }
      print(response);
    } catch (e) {
      print("Error - $e");
    } finally {
      isLoading(false);
    }
  }
}
