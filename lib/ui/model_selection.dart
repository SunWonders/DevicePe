import 'package:devicepe_client/repositories/network/controllers/model_controller.dart';
import 'package:devicepe_client/repositories/network/models/model_detail_response.dart';
import 'package:devicepe_client/ui/common/no_dat_found.dart';
import 'package:devicepe_client/ui/device_model_details.dart';
import 'package:devicepe_client/ui/common/progress_bar.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModelSelectionPage extends StatefulWidget {
  ModelSelectionPage({Key key}) : super(key: key);

  @override
  _ModelSelectionPageState createState() => _ModelSelectionPageState();
}

class _ModelSelectionPageState extends State<ModelSelectionPage> {
  ModelController modelController = Get.put(ModelController());

  ModelData _selectedModel;

  Widget gridViewSelection() {
    return modelController.modelDetails.isNotEmpty
        ? GridView.count(
            crossAxisCount:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? 2
                    : 3,
            padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1),
            children: modelController.modelDetails.map(
              (iconData) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedModel = iconData;
                    });
                  },
                  child:
                      BrandModelGridItem(iconData, _selectedModel == iconData),
                );
              },
            ).toList(),
          )
        : NoDataFound();
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
      //body: gridViewSelection(),
      body: Obx(() => modelController.isLoading.value
          ? ProgressBar()
          : gridViewSelection()),
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.primaryLight),
        ),
        onPressed: () {
          if (_selectedModel == null) {
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
  final ModelData _modelDetail;
  final bool _isSelected;

  BrandModelGridItem(this._modelDetail, this._isSelected);

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
                _modelDetail.modelIconUrl,
                height: 96,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Image(
                      image: AssetImage('assets/images/mobile.png'),
                    ),
                  );
                },
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                _modelDetail.modelName,
                style: TextStyle(
                  color: AppColors.primaryDark,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
