import 'package:devicepe_client/repositories/local/dao/check_list_data_dao.dart';
import 'package:devicepe_client/repositories/network/models/check_list_detail_response.dart';
import 'package:devicepe_client/repositories/network/services/check_list_service.dart';
import 'package:get/get.dart';

class CheckListController extends GetxController {
  var checkListDetails = <CheckListData>[].obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    getAllCheckListDetails();
    super.onInit();
  }

  void getAllCheckListDetails() async {
    isLoading(true);
    try {
      var response = await CheckListService.getCheckListDetails();

      if (response != null && response.data != null) {
        checkListDetails = response.data!;
        CheckListDataDao().insertAll(response.data!);
      }
    } catch (e) {
      print("Error - $e");
    } finally {
      isLoading(false);
    }
  }
}
