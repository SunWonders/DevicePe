import 'dart:collection';

import 'package:devicepe_client/constants/constants.dart';
import 'package:devicepe_client/repositories/network/controllers/check_list_controller.dart';
import 'package:devicepe_client/repositories/network/models/check_list_detail_response.dart';
import 'package:devicepe_client/ui/common/not_accepting_page.dart';
import 'package:devicepe_client/ui/common/progress_bar.dart';
import 'package:devicepe_client/ui/exact_value/information_request_sheet.dart';
import 'package:devicepe_client/ui/exact_value/multiple_selection_list.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:devicepe_client/utils/common_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PowerStateSelection extends StatefulWidget {
  PowerStateSelection({Key key}) : super(key: key);

  @override
  _PowerStateSelectionState createState() => _PowerStateSelectionState();
}

class _PowerStateSelectionState extends State<PowerStateSelection> {
  CheckListController checkListDetailResponse = Get.put(CheckListController());

  HashMap<int, Option> singleSelection = new HashMap();

  HashMap<int, List<Option>> multipleSelection = new HashMap();

  @override
  void initState() {
    super.initState();
    _modalBottomSheetMenu();
  }

  void _modalBottomSheetMenu() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Get.bottomSheet(DetailsRequestAgreement(), isDismissible: false);
    });
  }

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
                            if (singleSelection[checkListData.id] == null &&
                                (multipleSelection[checkListData.id] == null ||
                                    multipleSelection[checkListData.id]
                                        .isEmpty))
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
                  Get.to(() => MultipleSelectionPage()),
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

                  getCheckListOptions(index, checkListData),

                  // ToggleSwitch(
                  //   minWidth: 90.0,
                  //   cornerRadius: 10.0,
                  //   activeBgColor: AppColors.primaryLight,
                  //   activeFgColor: AppColors.whiteText,
                  //   inactiveBgColor: Colors.grey,
                  //   inactiveFgColor: AppColors.shadowThree,
                  //   labels: ['YES', 'NO'],
                  //   initialLabelIndex: checkListData.isMandatory == 1 ? -1 : -1,
                  //   icons: [Icons.verified, Icons.dangerous],
                  //   onToggle: (index) {
                  //     if (!_selectedCheckListIndex.contains(checkListData.id)) {
                  //       _selectedCheckListIndex.add(checkListData.id);
                  //     }
                  //   },
                  // ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }

  Widget getCheckListOptions(int index, CheckListData checkListData) {
    return Container(
      //height: h,
      child: GridView.count(
        childAspectRatio: 2.5,
        shrinkWrap: true,
        crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3,
        padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1),
        children: checkListData.options.map((Option option) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  if (checkListData.type == "SINGLE") {
                    singleSelection[checkListData.id] = option;
                  } else {
                    List<Option> c = multipleSelection[checkListData.id];
                    if (c == null) {
                      c = [];
                    }
                    if (c.contains(option)) {
                      c.remove(option);
                    } else {
                      c.add(option);
                    }

                    multipleSelection[checkListData.id] = c;
                  }
                });
              },
              child: checkListData.type == "SINGLE"
                  ? OptionItem(
                      option, singleSelection[checkListData.id] == option)
                  : OptionItem(
                      option,
                      multipleSelection[checkListData.id] != null &&
                          multipleSelection[checkListData.id]
                              .contains(option)));
        }).toList(),
      ),
    );
  }
}

class OptionItem extends StatelessWidget {
  final Option _selectionItem;
  final bool _isSelected;

  OptionItem(this._selectionItem, this._isSelected);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(1.0)),
      child: Container(
        decoration: new BoxDecoration(
          border: Border.all(
              color: _isSelected ? AppColors.primaryLight : Colors.transparent),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          gradient: new LinearGradient(
            colors: _isSelected
                ? [
                    AppColors.nutralLight,
                    AppColors.nutralLight,
                  ]
                : [
                    AppColors.whiteText,
                    AppColors.whiteText,
                  ],
          ),
        ),
        margin: EdgeInsets.fromLTRB(15.0, 10, 15, 10),
        padding: EdgeInsets.all(2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 5.0,
            ),
            Text(
              _selectionItem.name,
              style: TextStyle(
                color: AppColors.primaryDark,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
