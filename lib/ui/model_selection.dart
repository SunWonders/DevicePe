import 'package:devicepe_client/dto/selection_item.dart';
import 'package:devicepe_client/ui/device_model_details.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModelSelectionPage extends StatefulWidget {
  ModelSelectionPage({Key key}) : super(key: key);

  @override
  _ModelSelectionPageState createState() => _ModelSelectionPageState();
}

class _ModelSelectionPageState extends State<ModelSelectionPage> {
  final List<SelectionItem> _icons = [
    SelectionItem(
        "https://rukminim1.flixcart.com/image/416/416/j7qi9ow0/mobile/6/t/q/apple-iphone-6s-mn0w2hn-a-original-imaexw6smfzjgqsz.jpeg?q=70",
        "Iphone 6s"),
    SelectionItem(
        "https://rukminim1.flixcart.com/image/416/416/jnj7iq80/mobile/u/b/g/apple-iphone-xr-mryj2hn-a-original-imafa6zkm7qhv2zd.jpeg?q=70",
        "Iphone xr"),
    SelectionItem(
        "https://rukminim1.flixcart.com/image/416/416/kg8avm80/mobile/j/f/9/apple-iphone-12-dummyapplefsn-original-imafwg8dhe5aeyhk.jpeg?q=70",
        "Iphone 12"),
  ];

  SelectionItem _selectedIcons;

  Widget gridViewSelection() {
    return GridView.count(
      crossAxisCount:
          MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3,
      padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1),
      children: _icons.map(
        (SelectionItem iconData) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIcons = iconData;
              });
            },
            child: BrandModelGridItem(
                iconData,
                _selectedIcons ==
                    iconData), // Pass iconData and a boolean that specifies if the icon is selected or not
          );
        },
      ).toList(), // Convert the map to a list of widgets
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.whiteText),
        backgroundColor: AppColors.primaryLight,
        title: Text(
          "Select Model",
          style: TextStyle(color: AppColors.whiteText),
        ),
      ),
      body: gridViewSelection(),
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.primaryLight),
        ),
        onPressed: () {
          if (_selectedIcons == null) {
            Get.defaultDialog(
              title: "🙁  Alert 🙁",
              middleText: "Please Select Model to continue",
              radius: 10,
              buttonColor: AppColors.primaryDark,
              onConfirm: () {
                Get.back();
              },
            );
            return;
          }
          Get.to(() => DeviceModelDetails());
        },
        child: Text("Next"),
      ),
    );
  }
}

class BrandModelGridItem extends StatelessWidget {
  final SelectionItem _brandDetail;
  final bool _isSelected;

  BrandModelGridItem(this._brandDetail, this._isSelected);

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
        child: Container(
          alignment: Alignment.center,
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
                _brandDetail.imageUrl,
                height: 100,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                _brandDetail.name,
                style: TextStyle(
                  color: AppColors.primaryDark,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class SelectionItem {
//   final String _imageUrl;
//   final String _name;

//   SelectionItem(this._imageUrl, this._name);
// }
