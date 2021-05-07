import 'package:devicepe_client/repositories/local/dao/variant_data_dao.dart';
import 'package:devicepe_client/repositories/network/controllers/variant_controller.dart';
import 'package:devicepe_client/ui/agreement/aggreement.dart';
import 'package:devicepe_client/ui/common/progress_bar.dart';
import 'package:devicepe_client/ui/device_details/device_slider.dart';
import 'package:devicepe_client/ui/device_details/specification_list_view.dart';
import 'package:devicepe_client/ui/exact_value/check_list.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:devicepe_client/utils/sahred_pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceModelDetails extends StatefulWidget {
  DeviceModelDetails({Key key}) : super(key: key);

  @override
  _DeviceModelDetailsState createState() => _DeviceModelDetailsState();
}

class _DeviceModelDetailsState extends State<DeviceModelDetails> {
  VariantController variantController = Get.put(VariantController());

  @override
  void initState() {
    super.initState();
    _modalBottomSheetMenu();
  }

  void _modalBottomSheetMenu() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Get.bottomSheet(Aggreement(), isDismissible: false);
    });
  }

  Widget selectVarientView() {
    // var h = (variantController.variantDetails.length / 3).ceilToDouble() * 80;

    return Container(
      //height: h,

      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        childAspectRatio: 1.8,
        padding: EdgeInsets.all(5.0),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: variantController.variantDetails
            .map(
              (data) => GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: data.varientName ==
                                variantController
                                    .selectedVariantData.value.varientName
                            ? AppColors.card1.withOpacity(0.7)
                            : Colors.black12,
                        border: Border.all(
                          color: data.varientName ==
                                  variantController
                                      .selectedVariantData.value.varientName
                              ? AppColors.card1.withGreen(10)
                              : AppColors.background,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Text(data.varientName,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: data.varientName ==
                                    variantController
                                        .selectedVariantData.value.varientName
                                ? AppColors.whiteText
                                : Colors.black54),
                        textAlign: TextAlign.center),
                  ),
                  onTap: () {
                    variantController.selectedVariantData.value = data;
                    SharedPref().saveInt(SharedPref.VARIANT_ID, data.id);
                    SharedPref()
                        .saveDouble(SharedPref.BASE_PRICE, data.basePrice);
                    VariantDataDao().insert(data);
                    variantController.selectedVariantData.refresh();
                  }),
            )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: //AppColors.whiteText,
            Colors.white.withOpacity(0.95),
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.primaryLight),
          backgroundColor: AppColors.nutralLight,
          title: Text(
            variantController.isLoading.value
                ? "Device Details"
                : variantController.selectedVariantData.value.varientName ==
                        null
                    ? ""
                    : variantController.selectedVariantData.value.varientName,
            style: TextStyle(color: AppColors.primaryLight),
          ),
        ),
        body: variantController.isLoading.value
            ? ProgressBar()
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      DeviceSliderCarousel(
                          imgList: variantController
                              .selectedVariantData.value.varientIconUrl),
                      Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Select Varient",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackText,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        color: AppColors.background,
                        height: 1,
                      ),
                      selectVarientView(),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        color: AppColors.background,
                        height: 1,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Specification",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackText,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        color: AppColors.background,
                        height: 1,
                      ),
                      if (variantController.selectedVariantData.value != null &&
                          variantController
                                  .selectedVariantData.value.specifications !=
                              null &&
                          variantController.selectedVariantData.value
                              .specifications.isNotEmpty)
                        SpecificationListView(variantController
                            .selectedVariantData.value.specifications)
                      else
                        Container(
                          margin: EdgeInsets.all(20.0),
                          child: Text("Specification Details Not Available"),
                        ),
                    ],
                  ),
                ),
              ),
        bottomNavigationBar: Container(
          child: Container(
            color: AppColors.nutralLight,
            height: 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Get Upto",
                          style: TextStyle(fontSize: 12, color: AppColors.dark),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 4),
                        Text(
                          "\u20B9 ${variantController.selectedVariantData.value.basePrice == null ? 0 : variantController.selectedVariantData.value.basePrice}",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.dark),
                        ),
                      ]),
                ),
                Expanded(
                  child: variantController.isLoading.value ||
                          variantController
                                  .selectedVariantData.value.basePrice ==
                              null
                      ? Container()
                      : Container(
                          color: AppColors.primaryLight,
                          height: 60,
                          width: Get.width / 2,
                          child: TextButton(
                            onPressed: () {
                              Get.to(() => PowerStateSelection());
                            },
                            child: Text(
                              "Get Exact Value",
                              style: TextStyle(
                                color: AppColors.whiteText,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
