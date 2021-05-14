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
  BrandSelectionPage({Key? key}) : super(key: key);

  @override
  _BrandSelectionPageState createState() => _BrandSelectionPageState();
}

class _BrandSelectionPageState extends State<BrandSelectionPage> {
  BrandController brandController = Get.put(BrandController());

  BrandData? _selectedBrand;

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
                    SharedPref().saveBrandSelection(
                        _selectedBrand?.id == null ? 0 : _selectedBrand!.id!);
                    Get.to(() => ModelSelectionPage());
                  });
                },
                child: BrandGridItem(brandData, _selectedBrand == brandData),
              );
            }).toList(),
          )
        : NoDataFound();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.primaryLight),
        backgroundColor: AppColors.nutralLight,
        title: Text(
          "Select Brand",
          style: TextStyle(color: AppColors.primaryLight),
        ),
      ),
      body: Obx(
        () => brandController.isLoading.value
            ? ProgressBar()
            : gridViewSelection(),
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
          border: Border.all(
              color: _isSelected ? AppColors.primaryLight : Colors.transparent),
          borderRadius: BorderRadius.circular(15),
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
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 5.0,
            ),
            // Container(
            //   width: 24,
            //   height: 24,
            //   child: _isSelected
            //       ? Icon(
            //           Icons.task_alt,
            //           color: AppColors.primaryLight,
            //         )
            //       : Container(),
            // ),
            _isSelected
                ? SizedBox(
                    height: 5.0,
                  )
                : Container(),
            Image.network(
              _brandDetail.brandIconUrl != null
                  ? _brandDetail.brandIconUrl!
                  : "",
              height: 40,
              errorBuilder: (context, error, stackTrace) {
                print(error); //do something
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
            SizedBox(
              height: 5.0,
            ),
            Text(
              "${_brandDetail.brandName}",
              style: TextStyle(
                color: AppColors.primaryDark,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
