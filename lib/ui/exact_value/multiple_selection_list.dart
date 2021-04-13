import 'package:devicepe_client/dto/selection_item.dart';
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
        "https://assets.stickpng.com/images/580b57fcd9996e24bc43c516.png",
        "Apple",
        description: "No Scratches"),
    SelectionItem(
        "https://assets.stickpng.com/images/580b57fcd9996e24bc43c51f.png",
        "Google",
        description: "No Scratches"),
    SelectionItem(
        "https://cdn.iconscout.com/icon/free/png-512/samsung-226432.png",
        "Samsung",
        description: "No Scratches"),
    SelectionItem(
        "https://www.pngitem.com/pimgs/m/77-776203_moto-logo-motorola-logo-hd-png-download.png",
        "Moto",
        description: "No Scratches"),
    SelectionItem(
        "https://brandslogos.com/wp-content/uploads/images/large/oneplus-logo.png",
        "One Plus",
        description: "No Scratches"),
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
          if (_selectedIcons == null || _selectedIcons.isEmpty) {
            Get.defaultDialog(
                title: "🙁  Alert 🙁",
                middleText: "Please Select Brand to continue",
                radius: 10,
                buttonColor: AppColors.primaryDark,
                onConfirm: () {
                  Get.back();
                });
            return;
          }
          Get.snackbar("Coming Soon..!", "Under Development");
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
            Text(
              _selectionItem.description,
              style: TextStyle(
                color: AppColors.blackText,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}