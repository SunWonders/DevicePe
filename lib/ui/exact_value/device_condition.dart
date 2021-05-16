import 'package:devicepe_client/dto/selection_item.dart';
import 'package:devicepe_client/ui/summary/device_summary.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:devicepe_client/utils/sahred_pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceConditionPage extends StatefulWidget {
  DeviceConditionPage({Key? key}) : super(key: key);

  @override
  _DeviceConditionPageState createState() => _DeviceConditionPageState();
}

class _DeviceConditionPageState extends State<DeviceConditionPage> {
  List<SelectionItem> _icons = [
    SelectionItem(
        "https://firebasestorage.googleapis.com/v0/b/test-ec84e.appspot.com/o/good.png?alt=media&token=bf3697e5-dd3d-40df-96e9-c93a5c147f2b",
        "Excellent",
        description:
            "No Scratches.,No Signs of usage.,No dents or cracks on panel."),
    SelectionItem(
        "https://firebasestorage.googleapis.com/v0/b/suntransfer-28afc.appspot.com/o/user-interface.png?alt=media&token=600732ed-3118-4aae-8cdb-eaf5c2d19f84",
        "Good",
        description:
            "Minor Scratches.,Normal Signs of Usage.,NO Dents /Cracks on Panel"),
    SelectionItem(
        "https://firebasestorage.googleapis.com/v0/b/test-ec84e.appspot.com/o/like_new.png?alt=media&token=7347a2f5-cfda-4db4-8b14-527c0ebd517a",
        "Average",
        description:
            "Scratches / Dents on Panel.,Discoloration of panel.,External housing intact with minor cracks"),
    SelectionItem(
        "https://firebasestorage.googleapis.com/v0/b/test-ec84e.appspot.com/o/very_good.png?alt=media&token=47222c6c-c64e-4c9d-af5d-7701e4efb96a",
        "Below Average",
        description:
            "Multiple Scratches on dents.,Panel Broken.,Rough body Condition"),
  ];

  SelectionItem? _selectedIcons;

  initState() {
    super.initState();
    addFields();
  }

  var showGridView = false.obs;

  addFields() async {
    var singleSelection =
        await SharedPref().readString(SharedPref.SINGLE_SELECTION);
    var showExcellent = true;
    var showGood = true;
    if (!singleSelection.contains("Below 3 Months")) {
      showExcellent = false;
    }

    if (singleSelection.contains("Faulty Display") ||
        singleSelection.contains("Having Issue")) {
      showExcellent = false;
      showGood = false;
    }

    _icons.removeWhere(
        (value) => value.name == "Excellent" && showExcellent == false);
    _icons.removeWhere((value) => value.name == "Good" && showGood == false);

    showGridView.value = true;
  }

  Widget gridViewSelection() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount:
          MediaQuery.of(context).orientation == Orientation.portrait ? 1 : 1,
      padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1),
      children: _icons.map((SelectionItem iconData) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIcons = iconData;
            });
          },
          child: SingleGridItem(iconData, _selectedIcons == iconData),
        );
      }).toList(),
    );
  }

  Widget listViewSelection() {
    return ListView.builder(
        itemCount: _icons.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          SelectionItem selectionItem = _icons[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIcons = selectionItem;
              });
            },
            child:
                SingleGridItem(selectionItem, _selectedIcons == selectionItem),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.primaryLight),
        backgroundColor: AppColors.nutralLight,
        title: Text(
          "Device Condition",
          style: TextStyle(color: AppColors.primaryLight),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.centerLeft,
              child: Text(
                "Select Device Condition",
                style: TextStyle(
                  color: AppColors.blackText.withOpacity(0.75),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.centerLeft,
              child: Text(
                "Please Select Any one of the following",
                style: TextStyle(
                  fontSize: 14.0,
                  color: AppColors.blackText.withOpacity(0.75),
                ),
              ),
            ),
            Obx(() => Flexible(
                  child: showGridView.value ? listViewSelection() : Container(),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: AppColors.primaryLight,
                height: 60,
                width: Get.width - 1,
                child: TextButton(
                  onPressed: () async {
                    if (_selectedIcons == null) {
                      Get.defaultDialog(
                          title: "🙁  Alert 🙁",
                          middleText: "Please Select Device Condition",
                          radius: 10,
                          buttonColor: AppColors.primaryDark,
                          onConfirm: () {
                            Get.back();
                          });
                      return;
                    }

                    SharedPref().saveString(SharedPref.DEVICE_CONDITION,
                        "${_selectedIcons?.name}-${_selectedIcons?.description}");

                    Get.to(() => DeviceSummaryPage());
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
          ],
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
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: Container(
        margin: EdgeInsets.all(5.0),
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [
              AppColors.whiteSubText,
              AppColors.whiteSubText,

              /// _isSelected
              //  ? AppColors.secondary.withOpacity(0.5)
              //: AppColors.nutralLight,
            ],
          ),
        ),
        padding: EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: !_isSelected
                                  ? AppColors.whiteText
                                  : AppColors.secondary),
                          color: !_isSelected
                              ? AppColors.whiteText
                              : AppColors.secondary.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Image.network(
                        _selectionItem.imageUrl,
                        height: 48,
                        fit: BoxFit.fitWidth,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    _selectionItem.name,
                    style: TextStyle(
                      color: _isSelected
                          ? AppColors.primaryDark
                          : AppColors.primaryLight,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Expanded(
              child: Container(
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                    colors: [
                      AppColors.whiteSubText,
                      _isSelected
                          ? AppColors.secondary.withOpacity(0.5)
                          : AppColors.nutralLight,
                    ],
                  ),
                ),
                height: 4 * 40.toDouble(),
                child: DescriptionListView(
                    _selectionItem.description != null
                        ? _selectionItem.description!.split(",")
                        : [],
                    _isSelected),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DescriptionListView extends StatelessWidget {
  final List<String> _descriptionList;
  final bool _isSelected;

  DescriptionListView(this._descriptionList, this._isSelected);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: _descriptionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          horizontalTitleGap: 0,
          leading: Icon(
            Icons.task_alt,
            size: 20,
            color: _isSelected
                ? AppColors.primaryDark
                : AppColors.primaryLight.withOpacity(0.8),
          ),
          title: Text(
            _descriptionList[index],
            style: TextStyle(
              color: _isSelected
                  ? AppColors.primaryDark
                  : AppColors.primaryLight.withOpacity(0.8),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      },
    );
  }
}
