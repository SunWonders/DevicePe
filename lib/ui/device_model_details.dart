import 'package:devicepe_client/repositories/local/dao/variant_data_dao.dart';
import 'package:devicepe_client/repositories/network/controllers/variant_controller.dart';
import 'package:devicepe_client/ui/common/progress_bar.dart';
import 'package:devicepe_client/ui/device_details/device_slider.dart';
import 'package:devicepe_client/ui/device_details/specification_list_view.dart';
import 'package:devicepe_client/ui/exact_value/power_selection.dart';
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

  Widget selectVarientView() {
    var h = (variantController.variantDetails.length / 3).ceilToDouble() * 80;

    return Container(
      height: h,
      child: GridView.count(
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
                            ? AppColors.card1
                            : Colors.black12,
                        border: Border.all(
                          color: data.varientName ==
                                  variantController
                                      .selectedVariantData.value.varientName
                              ? AppColors.card1
                              : AppColors.background,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Text(data.varientName,
                        style: TextStyle(
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
        backgroundColor: AppColors.nutralLight,
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.whiteText),
          backgroundColor: AppColors.primaryLight,
          title: Text(
            variantController.isLoading.value
                ? "Device Details"
                : variantController.selectedVariantData.value.varientName ==
                        null
                    ? ""
                    : variantController.selectedVariantData.value.varientName,
            style: TextStyle(color: AppColors.whiteText),
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
        floatingActionButton: variantController.isLoading.value
            ? Container()
            : ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Container(
                  color: AppColors.primaryLight,
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
        bottomNavigationBar: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Container(
              color: AppColors.primaryDark,
              padding: EdgeInsets.all(2),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                child: Container(
                  color: AppColors.nutralLight,
                  padding: EdgeInsets.all(10),
                  width: 100,
                  height: 60,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Get Upto",
                        style: TextStyle(fontSize: 14, color: AppColors.dark),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        "\u20B9 ${variantController.selectedVariantData.value.basePrice == null ? 0 : variantController.selectedVariantData.value.basePrice}",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.dark),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
