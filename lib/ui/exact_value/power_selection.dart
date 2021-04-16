import 'package:devicepe_client/constants/constants.dart';
import 'package:devicepe_client/repositories/network/controllers/check_list_controller.dart';
import 'package:devicepe_client/repositories/network/models/check_list_detail_response.dart';
import 'package:devicepe_client/ui/common/not_accepting_page.dart';
import 'package:devicepe_client/ui/common/progress_bar.dart';
import 'package:devicepe_client/ui/exact_value/single_selection_list.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:devicepe_client/utils/common_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

class PowerStateSelection extends StatefulWidget {
  PowerStateSelection({Key key}) : super(key: key);

  @override
  _PowerStateSelectionState createState() => _PowerStateSelectionState();
}

class _PowerStateSelectionState extends State<PowerStateSelection> {
  CheckListController checkListDetailResponse = Get.put(CheckListController());
  List<int> _selectedCheckListIndex = [];

  @override
  Widget build(BuildContext context) {
    var isSelected = true.obs;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.whiteText),
        backgroundColor: AppColors.primaryLight,
        title: Text(
          "About Your Device",
          style: TextStyle(color: AppColors.whiteText),
        ),
      ),
      body: Obx(
        () => checkListDetailResponse.isLoading.value
            ? ProgressBar()
            : SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "Tell Us Few things about Your device Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      getCheckListDetails(),
                    ],
                  ),
                ),
              ),
      ),
      bottomNavigationBar: ClipRRect(
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
                    "\u20B9 1028",
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
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Container(
          width: 100,
          color: AppColors.primaryLight,
          child: TextButton(
            onPressed: () => {
              isSelected.value = true,
              checkListDetailResponse.checkListDetails
                  .forEach((CheckListData checkListData) => {
                        if (checkListData.isMandatory == 1)
                          {
                            if (!_selectedCheckListIndex
                                .contains(checkListData.id))
                              {isSelected.value = false}
                          },
                      }),
              if (isSelected.value == false)
                {
                  //{Get.snackbar("Please Select Yes Or No", "")},
                  Get.to(
                    () => NotAcceptingPage(
                      NOT_ACCEPTING,
                      heading: VALUE_TOO_LOW,
                    ),
                  ),
                }
              else
                {
                  Get.to(() => SingleSelectionPage()),
                },
            },
            child: Text(
              "Proceed",
              style: TextStyle(color: AppColors.whiteText),
            ),
          ),
        ),
      ),
    );
  }

  Widget getCheckListDetails() {
    return Container(
      child: Column(
        children: CommonUtility()
            .mapIndexed(
              checkListDetailResponse.checkListDetails,
              (index, CheckListData checkListData) => new Column(
                children: [
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${index + 1}. " + checkListData.description,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  ToggleSwitch(
                    minWidth: 90.0,
                    cornerRadius: 10.0,
                    activeBgColor: AppColors.primaryLight,
                    activeFgColor: AppColors.whiteText,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: AppColors.shadowThree,
                    labels: ['YES', 'NO'],
                    initialLabelIndex: checkListData.isMandatory == 1 ? -1 : -1,
                    icons: [Icons.verified, Icons.dangerous],
                    onToggle: (index) {
                      if (!_selectedCheckListIndex.contains(checkListData.id)) {
                        _selectedCheckListIndex.add(checkListData.id);
                      }
                    },
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
