import 'package:devicepe_client/dto/selection_item.dart';
import 'package:devicepe_client/ui/summary/device_summary.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:devicepe_client/utils/sahred_pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceConditionPage extends StatefulWidget {
  DeviceConditionPage({Key key}) : super(key: key);

  @override
  _DeviceConditionPageState createState() => _DeviceConditionPageState();
}

class _DeviceConditionPageState extends State<DeviceConditionPage> {
  final List<SelectionItem> _icons = [
    SelectionItem(
        "https://firebasestorage.googleapis.com/v0/b/test-ec84e.appspot.com/o/good.png?alt=media&token=bf3697e5-dd3d-40df-96e9-c93a5c147f2b",
        "Like New",
        description: "No Scratches. No Dents, No Functional issues"),
    SelectionItem(
        "https://firebasestorage.googleapis.com/v0/b/suntransfer-28afc.appspot.com/o/user-interface.png?alt=media&token=600732ed-3118-4aae-8cdb-eaf5c2d19f84",
        "Good",
        description:
            "Minor Scratches with one or two dents, No cracks on body"),
    SelectionItem(
        "https://firebasestorage.googleapis.com/v0/b/test-ec84e.appspot.com/o/like_new.png?alt=media&token=7347a2f5-cfda-4db4-8b14-527c0ebd517a",
        "Average",
        description: "Major Scratches and dents. But body not cracked"),
    SelectionItem(
        "https://firebasestorage.googleapis.com/v0/b/test-ec84e.appspot.com/o/very_good.png?alt=media&token=47222c6c-c64e-4c9d-af5d-7701e4efb96a",
        "Below Average",
        description: "Cracked, Broken or Discolored body/Panel"),
  ];

  SelectionItem _selectedIcons;

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
              _selectedIcons = iconData;
            });
          },
          child: SingleGridItem(
              iconData,
              _selectedIcons ==
                  iconData), // Pass iconData and a boolean that specifies if the icon is selected or not
        );
      }).toList(), // Convert the map to a list of widgets
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.whiteText),
        backgroundColor: AppColors.primaryLight,
        title: Text(
          "Device Condition",
          style: TextStyle(color: AppColors.whiteText),
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
                "Please Select Any one of the following",
                style: TextStyle(fontSize: 14.0),
              ),
            ),
            Flexible(
              child: gridViewSelection(),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.primaryLight),
        ),
        onPressed: () {
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
              "${_selectedIcons.name}-${_selectedIcons.description}");

          Get.to(() => DeviceSummaryPage());
        },
        child: Text("Next"),
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
        decoration: new BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowOne,
              blurRadius: 1.0,
            ),
          ],
          gradient: new LinearGradient(
            colors: [
              AppColors.whiteSubText,
              AppColors.whiteSubText,
            ],
          ),
        ),
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 5.0,
            ),
            Container(
              width: 24,
              height: 24,
              child: _isSelected
                  ? Icon(
                      Icons.task_alt,
                      color: AppColors.primaryLight,
                    )
                  : Container(),
            ),
            _isSelected
                ? SizedBox(
                    height: 5.0,
                  )
                : Container(),
            Image.network(
              _selectionItem.imageUrl,
              height: 48,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              _selectionItem.name,
              style: TextStyle(
                color: AppColors.primaryDark,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                _selectionItem.description,
                style: TextStyle(
                  color: AppColors.blackText,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
