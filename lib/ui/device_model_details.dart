import 'package:devicepe_client/ui/device_details/device_slider.dart';
import 'package:devicepe_client/ui/device_details/specification_list_view.dart';
import 'package:devicepe_client/ui/exact_value/power_selection.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceModelDetails extends StatefulWidget {
  DeviceModelDetails({Key key}) : super(key: key);

  @override
  _DeviceModelDetailsState createState() => _DeviceModelDetailsState();
}

class _DeviceModelDetailsState extends State<DeviceModelDetails> {
  List<SpecificationDetails> _specificationDetails = [
    SpecificationDetails(
        "Capacity", ["32 GB", "64 GB", "128 GB", "256 GB", "512 GB"]),
    SpecificationDetails("Colors", ["Black", "Red", "Blue"]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.nutralLight,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.whiteText),
        backgroundColor: AppColors.primaryLight,
        title: Text(
          "Iphone XR",
          style: TextStyle(color: AppColors.whiteText),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child:
              //Card(
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.all(Radius.circular(10))),
              InkWell(
            splashColor: AppColors.nutralLight,
            onTap: () {
              print('Card tapped.');
            },
            child: Column(
              children: [
                DeviceSliderCarousel(),
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Specification",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackText,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  color: AppColors.background,
                  height: 1,
                ),
                SpecificationListView(_specificationDetails),
              ],
            ),
          ),
          //),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Container(
          color: AppColors.primaryDark,
          padding: EdgeInsets.all(2),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            child: Container(
              color: AppColors.nutralLight,
              padding: EdgeInsets.all(10),
              width: 100,
              height: 60,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Get Upto",
                    style: TextStyle(fontSize: 14, color: AppColors.dark),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    "\u20B9 1028",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.dark),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Container(
          color: AppColors.primaryLight,
          child: TextButton(
            onPressed: () {
              Get.to(() => PowerStateSelection());
            },
            child: Text(
              "Get Exact Value",
              style: TextStyle(
                color: AppColors.whiteText,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SpecificationDetails {
  final String title;
  final List<String> details;

  SpecificationDetails(this.title, this.details);
}
