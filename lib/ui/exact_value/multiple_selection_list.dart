import 'package:devicepe_client/dto/selection_item.dart';
import 'package:devicepe_client/ui/exact_value/device_condition.dart';
import 'package:devicepe_client/ui/exact_value/device_fault.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MultipleSelectionPage extends StatefulWidget {
  MultipleSelectionPage({Key key}) : super(key: key);

  @override
  _MultipleSelectionPageState createState() => _MultipleSelectionPageState();
}

class _MultipleSelectionPageState extends State<MultipleSelectionPage> {
  final List<SelectionItem> _icons = [
    SelectionItem(
      "https://image.flaticon.com/icons/png/512/189/189058.png",
      "Box",
    ),
    SelectionItem(
      "https://cdn4.iconfinder.com/data/icons/gradient-4/50/375-512.png",
      "Valid Bill",
    ),
    SelectionItem(
        "https://png.pngtree.com/png-vector/20200724/ourmid/pngtree-charging-phone-vector-illustration-with-flat-design-png-image_2312909.jpg",
        "Original Charger"),
    SelectionItem(
        "https://icons.iconarchive.com/icons/paomedia/small-n-flat/1024/headphone-icon.png",
        "Original Headphones"),
  ];

  List<SelectionItem> _selectedIcons = [];

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
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.primaryLight),
        ),
        onPressed: () {
          // if (_selectedIcons == null || _selectedIcons.isEmpty) {
          //   Get.defaultDialog(
          //       title: "🙁  Alert 🙁",
          //       middleText: "Please Select Brand to continue",
          //       radius: 10,
          //       buttonColor: AppColors.primaryDark,
          //       onConfirm: () {
          //         Get.back();
          //       });
          //   return;
          // }
          Get.to(() => DeviceFaultSelectionPage());
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
              height: 15.0,
            ),
            Text(
              _selectionItem.name,
              style: TextStyle(
                color: AppColors.primaryDark,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 5.0,
            ),
            // Text(
            //   _selectionItem.description,
            //   style: TextStyle(
            //     color: AppColors.blackText,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
