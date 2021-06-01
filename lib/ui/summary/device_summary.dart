import 'package:devicepe_client/constants/constants.dart';
import 'package:devicepe_client/repositories/local/dao/selection_item_dao.dart';
import 'package:devicepe_client/repositories/local/dao/variant_data_dao.dart';
import 'package:devicepe_client/repositories/network/models/variant_response_model.dart';
import 'package:devicepe_client/ui/common/not_accepting_page.dart';
import 'package:devicepe_client/ui/common/progress_bar.dart';
import 'package:devicepe_client/ui/device_details/specification_list_view.dart';
import 'package:devicepe_client/ui/orders/book_order.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:devicepe_client/utils/sahred_pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceSummaryPage extends StatefulWidget {
  @override
  _DeviceSummaryPageState createState() => _DeviceSummaryPageState();
}

class _DeviceSummaryPageState extends State<DeviceSummaryPage> {
  var variantData = Rx<VariantData?>(null);
  var isLoading = true.obs;
  var price = 0.0.obs;
  var checkListData = <Specification>[].obs;
  var deviceConditionDetail = <Specification>[].obs;
  var accessoryDetail = <Specification>[].obs;

  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    variantData.value = await VariantDataDao().retrieve();
    var singleSelection =
        await SharedPref().readString(SharedPref.SINGLE_SELECTION);
    var d = singleSelection.split(",");
    var single = <Specification>[];

    d.forEach((element) {
      var singleSelectionList = element.split("---");
      for (int i = 0; i < singleSelectionList.length; i++) {
        single.add(Specification(
            key: singleSelectionList[i].split("--")[1],
            value: singleSelectionList[i + 1].split("--")[1]));
        i++;
      }
      print(single);
    });

    var b = await SharedPref().readString(SharedPref.MULTIPLE_SELECTION);
    var c = b.split(",");

    c.forEach((element) {
      if (element.isNotEmpty && element != null) {
        var multipleSelectionList = element.split("---");
        var key = multipleSelectionList[0].split("--")[1];
        var values = multipleSelectionList[1].split("--");
        var val = "";
        for (int j = 0; j < values.length - 1; j++) {
          val += values[j + 1] + ",";
          j++;
        }
        single.add(Specification(key: key, value: val));
      }
    });
    checkListData.value = single;

    var dc = await SharedPref().readString(
      SharedPref.DEVICE_CONDITION,
    );

    var dcList = dc.split("-");
    var pr = 0.0;
    if (dcList[0].contains("Excellent")) {
      pr += variantData.value!.likeNew!;
    } else if (dcList[0].contains("Good")) {
      pr += variantData.value!.good!;
    } else if (dcList[0].contains("Average")) {
      pr += variantData.value!.average!;
    } else {
      pr += variantData.value!.belowAverage!;
    }

    var basePrice = await SharedPref().readDouble(SharedPref.BASE_PRICE);
    var checkListPrice =
        await SharedPref().readDouble(SharedPref.CHECK_LIST_AMOUNT);
    var accoriesAmount =
        await SharedPref().readDouble(SharedPref.ACCESSORIES_PRICE);

    price.value = checkListPrice + accoriesAmount - pr;

    SharedPref().saveDouble(SharedPref.FINAL_PRICE, price.value);

    var deviceCondition =
        await SharedPref().readString(SharedPref.DEVICE_CONDITION);
    var f = deviceCondition.split("-");
    deviceConditionDetail.value = [Specification(key: f.first, value: f.last)];

    var accessories = await SelectionItemDao().retrieve();

    var accessory = "";

    accessories.forEach((e) => {accessory += (e.name + ",")});

    if (accessory.length > 1) {
      accessoryDetail.value = [
        Specification(key: "Accessories", value: accessory)
      ];
    } else {
      accessoryDetail.value = [Specification(key: "Accessories", value: "NA")];
    }

    isLoading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return //Obx(
        //() =>
        Scaffold(
      backgroundColor: AppColors.whiteText,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.primaryLight),
        backgroundColor: AppColors.whiteText,
        title: Text(
          "Device Report",
          style: TextStyle(color: AppColors.primaryLight),
        ),
      ),
      body: Obx(
        () => isLoading.value
            ? ProgressBar()
            : SingleChildScrollView(
                child: Container(
                  color: AppColors.whiteText,
                  child: Column(
                    children: [
                      getMobileDetail(),
                      getSpecificationDetails(),
                      getCheckListDetails(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          color: AppColors.primaryLight,
                          height: 60,
                          width: Get.width - 1,
                          child: TextButton(
                            onPressed: () {
                              if (price.value < 100) {
                                Get.to(
                                  () => NotAcceptingPage(
                                    NOT_ACCEPTING,
                                    heading: VALUE_TOO_LOW,
                                  ),
                                );
                              } else {
                                Get.to(() => BookOrder());
                              }
                            },
                            child: Text(
                              "Book Order",
                              style: TextStyle(
                                color: AppColors.whiteText,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget getMobileDetail() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: Container(
        height: 180,
        width: Get.width,
        decoration: new BoxDecoration(
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: AppColors.bgColor,
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 0),
            ),
          ],
          gradient: new LinearGradient(
            colors: [
              AppColors.whiteText,
              AppColors.whiteText,
            ],
          ),
        ),
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(10.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "${variantData.value?.varientName}",
                  style: TextStyle(
                    color: AppColors.dark,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  addDeviceImage(),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Text(
                        "Selling Price",
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.blackText.withOpacity(
                            0.7,
                          ),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "\u20B9 ${price.value}",
                        style: TextStyle(
                          fontSize: 22,
                          color: AppColors.card2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("❇︎ Safe Pickup"),
                      SizedBox(height: 2),
                    ],
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getCheckListDetails() {
    var h = 80 + (checkListData.value.length * 85).toInt();
    if (checkListData.value.isEmpty) {
      h += 60;
    }
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: Container(
        height: h.toDouble(),
        width: Get.width,
        decoration: new BoxDecoration(
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: AppColors.bgColor,
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 0),
            ),
          ],
          gradient: new LinearGradient(
            colors: [
              AppColors.whiteText,
              AppColors.whiteText,
            ],
          ),
        ),
        margin: EdgeInsets.fromLTRB(10, 0, 10, 10.0),
        padding: EdgeInsets.all(10.0),
        child: Container(
            child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: Text(
                "CheckList",
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
            if (checkListData.value != null && checkListData.value.isNotEmpty)
              SpecificationListView(checkListData.value)
            else
              Container(
                margin: EdgeInsets.all(20.0),
                child: Text("CheckList Details Not Available"),
              ),
          ],
        )),
      ),
    );
  }

  Widget getSpecificationDetails() {
    var h = 200 + 75 + (variantData.value!.specifications!.length * 80).toInt();
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: Container(
        height: h.toDouble(),
        width: Get.width,
        decoration: new BoxDecoration(
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: AppColors.bgColor,
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 0),
            ),
          ],
          gradient: new LinearGradient(
            colors: [
              AppColors.whiteText,
              AppColors.whiteText,
            ],
          ),
        ),
        margin: EdgeInsets.fromLTRB(10, 0, 10, 10.0),
        padding: EdgeInsets.all(10.0),
        child: Container(
            child: Column(
          children: [
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
              color: AppColors.whiteText,
              height: 1,
            ),
            if (variantData.value != null &&
                variantData.value!.specifications != null &&
                variantData.value!.specifications!.isNotEmpty)
              SpecificationListView(variantData.value!.specifications!)
            else
              Container(
                margin: EdgeInsets.all(20.0),
                child: Text("Specification Details Not Available"),
              ),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: Text(
                "Device Condition",
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
            if (deviceConditionDetail.value != null &&
                deviceConditionDetail.value.isNotEmpty)
              SpecificationListView(deviceConditionDetail.value)
            else
              Container(
                margin: EdgeInsets.all(20.0),
                child: Text("Device Details Not Available"),
              ),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: Text(
                "Accessories",
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
            if (accessoryDetail.value != null &&
                accessoryDetail.value.isNotEmpty)
              SpecificationListView(accessoryDetail.value)
            else
              Container(
                margin: EdgeInsets.all(20.0),
                child: Text("Accessories Not Available"),
              ),
          ],
        )),
      ),
    );
  }

  Widget addDeviceImage() {
    if (variantData.value?.varientIconUrl?.isNotEmpty == true) {
      return Image.network(
        "${variantData.value?.varientIconUrl?[0]}",
        height: 130,
        width: 100,
        errorBuilder: (context, error, stackTrace) {
          return Padding(
            padding: EdgeInsets.all(5.0),
            child: Image(
              width: 90,
              image: AssetImage('assets/images/mobile.png'),
            ),
          );
        },
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
