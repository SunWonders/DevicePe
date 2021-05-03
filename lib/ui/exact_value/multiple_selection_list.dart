import 'package:devicepe_client/dto/selection_item.dart';
import 'package:devicepe_client/repositories/local/dao/selection_item_dao.dart';
import 'package:devicepe_client/repositories/local/dao/variant_data_dao.dart';
import 'package:devicepe_client/ui/exact_value/device_condition.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:devicepe_client/utils/sahred_pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MultipleSelectionPage extends StatefulWidget {
  MultipleSelectionPage({Key key}) : super(key: key);

  @override
  _MultipleSelectionPageState createState() => _MultipleSelectionPageState();
}

class _MultipleSelectionPageState extends State<MultipleSelectionPage> {
  var price = 0.0.obs;

  final List<SelectionItem> _icons = [
    SelectionItem(
      "https://firebasestorage.googleapis.com/v0/b/yabaze-profile.appspot.com/o/icons%2Fbox-open.png?alt=media&token=f054c5fa-bc94-408e-8760-cbf4c26c629c",
      "Box",
    ),
    SelectionItem(
      "https://firebasestorage.googleapis.com/v0/b/yabaze-profile.appspot.com/o/icons%2Fbill_final.png?alt=media&token=07da52ff-b036-4355-a52c-9df03f79544c",
      "Valid Bill",
    ),
    SelectionItem(
        "https://firebasestorage.googleapis.com/v0/b/yabaze-profile.appspot.com/o/icons%2Fcharging-station.png?alt=media&token=1b9dd175-c1f9-4810-abb8-5a60c31537fe",
        "Original Charger"),
    SelectionItem(
        "https://firebasestorage.googleapis.com/v0/b/yabaze-profile.appspot.com/o/icons%2Fhead_phone.png?alt=media&token=63a1b372-e5fc-4feb-aed9-df95f057bf16",
        "Original Headphones"),
  ];

  List<SelectionItem> _selectedIcons = [];

  initState() {
    super.initState();
    _selectedIcons.add(_icons[0]);
    _selectedIcons.add(_icons[1]);
  }

  Widget gridViewSelection() {
    return GridView.count(
      //shrinkWrap: true,
      crossAxisCount:
          MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3,
      padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1),
      children: _icons.map((SelectionItem iconData) {
        return GestureDetector(
          onTap: () {
            setState(() {
              if (!checkIsPresent(iconData)) {
                _selectedIcons.add(iconData);
              } else {
                _selectedIcons.remove(iconData);
              }
            });
          },
          child: SingleGridItem(iconData, checkIsPresent(iconData)),
        );
      }).toList(),
    );
  }

  bool checkIsPresent(SelectionItem iconData) {
    return _selectedIcons.any((element) => element == iconData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.whiteText),
        backgroundColor: AppColors.primaryLight,
        title: Text(
          "Device Details",
          style: TextStyle(color: AppColors.whiteText),
        ),
      ),
      body: Container(
        color: AppColors.background.withOpacity(1),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.centerLeft,
              child: Text(
                "Accessories",
                style: TextStyle(
                  color: AppColors.blackText,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.centerLeft,
              child: Text(
                "Please Select Available Accessories",
                style: TextStyle(fontSize: 14.0),
              ),
            ),
            Flexible(
              child: gridViewSelection(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        child: Container(
          color: AppColors.nutralLight,
          height: 60,
          child: Expanded(
            child: Container(
              color: AppColors.primaryLight,
              height: 60,
              width: Get.width / 2,
              child: TextButton(
                onPressed: () async {
                  var variantData = await VariantDataDao().retrieve();
                  var isBoxOrBillAvailable = false;
                  _selectedIcons.forEach((element) {
                    if (element.name.contains("Box")) {
                      isBoxOrBillAvailable = true;
                      price.value += variantData.boxPrice;
                    } else if (element.name.contains("Valid Bill")) {
                      price.value += variantData.billPrice;
                      isBoxOrBillAvailable = true;
                    } else if (element.name.contains("Original Charger")) {
                      price.value += variantData.chargerPrice;
                    } else {
                      price.value += variantData.headPhonePrice;
                    }
                  });
                  if (isBoxOrBillAvailable) {
                    SelectionItemDao().insertAll(_selectedIcons);

                    SharedPref()
                        .saveDouble(SharedPref.ACCESSORIES_PRICE, price.value);

                    Get.to(() => DeviceConditionPage());
                  } else {
                    Get.defaultDialog(
                        title: "🙁  Alert 🙁",
                        middleText: "We are Not accepting without Box Or Bill.",
                        radius: 10,
                        buttonColor: AppColors.primaryDark,
                        onConfirm: () {
                          Get.back();
                        });
                  }
                },
                child: Text(
                  "Next",
                  style: TextStyle(
                    color: AppColors.whiteText,
                    fontSize: 16,
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

class SingleGridItem extends StatelessWidget {
  final SelectionItem _selectionItem;
  final bool _isSelected;

  SingleGridItem(this._selectionItem, this._isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryDark.withOpacity(0.11),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.blackText.withOpacity(0.15),
                blurRadius: 10.0,
              ),
            ],
            gradient: LinearGradient(
                colors: [AppColors.whiteText, AppColors.whiteText]),
          ),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                margin: EdgeInsets.all(11),
                width: 24,
                height: 24,
                child: _isSelected
                    ? Icon(
                        Icons.task_alt,
                        color: AppColors.primaryLight.withOpacity(0.8),
                      )
                    : Container(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                            color: AppColors.nutralLight.withOpacity(0.6),
                            shape: BoxShape.circle),
                      ),
                      Image.network(
                        _selectionItem.imageUrl,
                        height: 48,
                        fit: BoxFit.fitWidth,
                      ),
                    ],
                  ),
                  Container(
                    width: 5,
                    height: 5,
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      color: AppColors.nutralLight,
                      alignment: Alignment.center,
                      child: Text(
                        _selectionItem.name,
                        style: TextStyle(
                          color: AppColors.primaryDark,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
