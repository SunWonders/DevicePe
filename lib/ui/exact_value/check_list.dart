import 'dart:collection';
import 'package:devicepe_client/common/show_full_image.dart';
import 'package:devicepe_client/repositories/network/controllers/check_list_controller.dart';
import 'package:devicepe_client/repositories/network/models/check_list_detail_response.dart';
import 'package:devicepe_client/ui/common/progress_bar.dart';
import 'package:devicepe_client/ui/exact_value/information_request_sheet.dart';
import 'package:devicepe_client/ui/exact_value/multiple_selection_list.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:devicepe_client/utils/common_utility.dart';
import 'package:devicepe_client/utils/sahred_pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PowerStateSelection extends StatefulWidget {
  PowerStateSelection({Key? key}) : super(key: key);

  @override
  _PowerStateSelectionState createState() => _PowerStateSelectionState();
}

class _PowerStateSelectionState extends State<PowerStateSelection> {
  CheckListController checkListDetailResponse = Get.put(CheckListController());

  HashMap<int, Option> singleSelection = new HashMap();

  var price = 0.0.obs;

  HashMap<int, List<Option>> multipleSelection = new HashMap();

  @override
  void initState() {
    super.initState();
    _modalBottomSheetMenu();
    updatePrice();
  }

  updatePrice() async {
    price.value = await SharedPref().readDouble(SharedPref.BASE_PRICE);
  }

  void _modalBottomSheetMenu() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Get.bottomSheet(DetailsRequestAgreement(), isDismissible: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    var isSelected = true.obs;

    return Scaffold(
      backgroundColor: AppColors.whiteText,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.primaryLight),
        backgroundColor: AppColors.whiteText,
        title: Text(
          "About Your Device",
          style: TextStyle(color: AppColors.primaryLight),
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
      bottomNavigationBar: Obx(
        () => Container(
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
                          "\u20B9 ${price.value}",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.dark),
                        ),
                      ]),
                ),
                Expanded(
                  child: Container(
                    color: AppColors.primaryLight,
                    height: 60,
                    width: Get.width / 2,
                    child: TextButton(
                      onPressed: () {
                        if (checkListDetailResponse.isLoading.value) {
                          Get.showSnackbar(
                            GetBar(
                              backgroundColor: AppColors.bgColor,
                              titleText: Text(
                                "Alert",
                                style: TextStyle(
                                  color: AppColors.primaryLight,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              messageText: Text("Please Wait..!"),
                            ),
                          );
                          return;
                        }
                        isSelected.value = true;
                        checkListDetailResponse.checkListDetails
                            .forEach((CheckListData checkListData) => {
                                  if (checkListData.isMandatory == 1)
                                    {
                                      if (singleSelection[checkListData.id] ==
                                              null &&
                                          (multipleSelection[
                                                      checkListData.id] ==
                                                  null ||
                                              multipleSelection[
                                                      checkListData.id]!
                                                  .isEmpty))
                                        {isSelected.value = false}
                                    },
                                });
                        if (isSelected.value == false) {
                          Get.defaultDialog(
                              middleText:
                                  "Please Answer All Mandatory Questions");
                        } else {
                          SharedPref().saveString(
                            SharedPref.SINGLE_SELECTION,
                            single
                                .toString()
                                .replaceAll("[", "")
                                .replaceAll("]", ""),
                          );
                          SharedPref().saveString(
                            SharedPref.MULTIPLE_SELECTION,
                            multiple
                                .toString()
                                .replaceAll("[", "")
                                .replaceAll("]", ""),
                          );
                          SharedPref().saveDouble(
                              SharedPref.CHECK_LIST_AMOUNT, price.value);
                          Get.to(() => MultipleSelectionPage());
                        }
                      },
                      child: Text(
                        "Proceed",
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
                      "${index + 1}. ${checkListData.description}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  getCheckListOptions(index, checkListData),
                ],
              ),
            )
            .toList(),
      ),
    );
  }

  List<String> single = [];
  List<String> multiple = [];

  calculatePrice() async {
    double basePrice = await SharedPref().readDouble(SharedPref.BASE_PRICE);
    single = [];
    multiple = [];
    String m = "";
    checkListDetailResponse.checkListDetails
        .forEach((CheckListData checkListData) => {
              if (singleSelection[checkListData.id] != null)
                {
                  single.add(
                      "${checkListData.id}--${checkListData.description}---${singleSelection[checkListData.id]!.id!}--${singleSelection[checkListData.id]!.name!}"),
                  basePrice -= singleSelection[checkListData.id]!.price!,
                },
              if (multipleSelection[checkListData.id] != null &&
                  multipleSelection[checkListData.id]!.isNotEmpty)
                {
                  m = "${checkListData.id}--${checkListData.description}---",
                  for (Option option in multipleSelection[checkListData.id]!)
                    {
                      basePrice -= option.price!,
                      m += "${option.id}--${option.name}--",
                    },
                  multiple.add(m),
                }
            });

    price.value = basePrice;
  }

  Widget getCheckListOptions(int index, CheckListData checkListData) {
    return Container(
      //height: h,
      child: GridView.count(
        childAspectRatio: (checkListData.options?.isNotEmpty == true &&
                checkListData.options?[0].iconUrl != null &&
                (checkListData.options?[0].iconUrl?.isBlank == false))
            ? 1
            : 2.5,
        shrinkWrap: true,
        crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3,
        padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1),
        children: checkListData.options == null
            ? []
            : checkListData.options!.map((Option option) {
                return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (checkListData.type == "SINGLE") {
                          singleSelection[checkListData.id!] = option;
                        } else {
                          List<Option> c =
                              multipleSelection[checkListData.id] == null
                                  ? []
                                  : multipleSelection[checkListData.id]!;

                          if (c.contains(option)) {
                            c.remove(option);
                          } else {
                            c.add(option);
                          }

                          multipleSelection[checkListData.id!] = c;
                        }
                        calculatePrice();
                      });
                    },
                    child: checkListData.type == "SINGLE"
                        ? OptionItem(
                            option, singleSelection[checkListData.id] == option)
                        : OptionItem(
                            option,
                            multipleSelection[checkListData.id] != null &&
                                multipleSelection[checkListData.id]!
                                    .contains(option)));
              }).toList(),
      ),
    );
  }
}

class OptionItem extends StatelessWidget {
  final Option _selectionItem;
  final bool _isSelected;
  var showImage = true.obs;

  OptionItem(this._selectionItem, this._isSelected);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(1.0)),
      child: Container(
        decoration: new BoxDecoration(
          border: Border.all(
              width: 2,
              color: _isSelected ? AppColors.secondary : Colors.transparent),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 3,
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
        margin: EdgeInsets.fromLTRB(15.0, 10, 15, 10),
        padding: EdgeInsets.all(2.0),
        child: Stack(
          alignment: Alignment.topCenter,
          fit: StackFit.expand,
          children: [
            _selectionItem.iconUrl != null &&
                    _selectionItem.iconUrl.isBlank == false
                ? Align(
                    alignment: Alignment.topCenter,
                    // child: GestureDetector(
                    //   onTap: () {
                    //     Get.dialog(ShowFullImage(_selectionItem.iconUrl!));
                    //   },
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: Image.network(
                        "${_selectionItem.iconUrl}",
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                            child: Image(
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
                      ),
                      //),
                    ),
                  )
                : Container(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 50,
                width: Get.width,
                decoration: new BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.transparent,
                      spreadRadius: 1,
                      blurRadius: 1,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${_selectionItem.name}",
                      style: TextStyle(
                        color: _isSelected
                            ? AppColors.secondary
                            : AppColors.blackText,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            _selectionItem.iconUrl != null &&
                    _selectionItem.iconUrl.isBlank == false
                ? Container(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.zoom_out_map),
                      iconSize: 20,
                      color: AppColors.primaryLight,
                      splashColor: AppColors.primaryLight,
                      onPressed: () {
                        Get.dialog(ShowFullImage(_selectionItem.iconUrl!),
                            barrierDismissible: true);
                      },
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
