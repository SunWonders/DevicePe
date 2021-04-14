import 'package:devicepe_client/repositories/network/controllers/brand_controller.dart';
import 'package:devicepe_client/repositories/network/models/brand_detail_response.dart';
import 'package:devicepe_client/ui/common/no_dat_found.dart';
import 'package:devicepe_client/ui/model_selection.dart';
import 'package:devicepe_client/ui/common/progress_bar.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:devicepe_client/utils/sahred_pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandSelectionPage extends StatefulWidget {
  BrandSelectionPage({Key key}) : super(key: key);

  @override
  _BrandSelectionPageState createState() => _BrandSelectionPageState();
}

class _BrandSelectionPageState extends State<BrandSelectionPage> {
  BrandController brandController = Get.put(BrandController());

  BrandData _selectedBrand;

  Widget gridViewSelection() {
    return brandController.brandDetails.isNotEmpty
        ? GridView.count(
            crossAxisCount:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? 3
                    : 5,
            padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1),
            children: brandController.brandDetails.map((brandData) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedBrand = brandData;
                  });
                },
                child: BrandGridItem(
                    brandData,
                    _selectedBrand ==
                        brandData), // Pass iconData and a boolean that specifies if the icon is selected or not
              );
            }).toList(), // Convert the map to a list of widgets
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
          "Select Brand",
          style: TextStyle(color: AppColors.whiteText),
        ),
      ),
      body: Obx(
        () => brandController.isLoading.value
            ? ProgressBar()
            : gridViewSelection(),
      ),
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.primaryLight),
        ),
        onPressed: () {
          if (_selectedBrand == null) {
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
          SharedPref().saveBrandSelection(_selectedBrand.id);
          Get.to(() => ModelSelectionPage());
        },
        child: Text("Next"),
      ),
    );
  }
}

class BrandGridItem extends StatelessWidget {
  final BrandData _brandDetail;
  final bool _isSelected;

  BrandGridItem(this._brandDetail, this._isSelected);

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
              _brandDetail.brandIconUrl,
              height: 48,
              errorBuilder: (context, error, stackTrace) {
                print(error); //do something
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
              _brandDetail.brandName,
              style: TextStyle(
                color: AppColors.primaryDark,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
