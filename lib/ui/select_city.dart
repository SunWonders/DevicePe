import 'package:devicepe_client/repositories/network/controllers/city_check_controller.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:devicepe_client/utils/sahred_pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class SelectCity extends StatefulWidget {
  SelectCity({Key key}) : super(key: key);

  @override
  _SelectCityState createState() => _SelectCityState();
}

GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
var cities = ["Cochin", "Delhi", "Hydrabad", "Jaipur", "Jai"];
var controller = Get.put(CityCheckController());

class _SelectCityState extends State<SelectCity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.whiteText),
        title: Text(
          "Select City",
          style: TextStyle(color: AppColors.whiteText),
        ),
        backgroundColor: AppColors.primaryLight,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SimpleAutoCompleteTextField(
                  key: key,
                  suggestions: cities,
                  decoration: InputDecoration(
                    hintText: 'Enter Location',
                    labelText: 'Location',
                    labelStyle: TextStyle(color: AppColors.primaryLight),
                    hintStyle: TextStyle(color: AppColors.hintGrey),
                    border: OutlineInputBorder(),
                    fillColor: AppColors.shadowThree,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: AppColors.primaryLight),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: AppColors.primaryLight),
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(Icons.search, color: AppColors.primaryLight),
                        onPressed: () {}),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10.0),
              color: AppColors.nutralLight,
              child: Text(
                "Popular Cities",
                style: TextStyle(
                    color: AppColors.primaryLight,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              height: 300,
              child: Obx(() => cityGridView()),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10.0),
              color: AppColors.nutralLight,
              child: Text(
                "All Cities",
                style: TextStyle(
                    color: AppColors.primaryLight,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(child: OtherCities(cityDetail: cities)),
          ],
        ),
      ),
    );
  }

  Widget cityGridView() {
    var a = getCityDetail();
    return GridView.count(
        crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.portrait ? 3 : 5,
        padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1),
        children: a.map(
          (value) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  controller.checkCity(value.name);
                });
              },
              child: CitySelectionGridItem(value),
            );
          },
        ).toList());
  }
}

class CityDetail {
  final String name;
  final String iconUrl;
  CityDetail(this.name, this.iconUrl);
}

List<CityDetail> getCityDetail() {
  return <CityDetail>[
    CityDetail("Bangalore",
        "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/1c504038542117.5765973d2c44e.jpg"),
    CityDetail("Chennai",
        "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/f70aaf38542117.5765973d2cb73.jpg"),
    CityDetail("Mumbai",
        "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/2ba20f38542117.5765973d219f3.jpg"),
    CityDetail("Lucknow",
        "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/b1feb538542117.5765973d2db6e.jpg"),
    CityDetail("Ahmedabad",
        "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/0b258738542117.5765973d2bf54.jpg"),
  ].obs;
}

class OtherCities extends StatelessWidget {
  final List<String> cityDetail;
  OtherCities({Key key, @required this.cityDetail}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: cityDetail.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              '${cityDetail[index]}',
              style: TextStyle(color: AppColors.shadowThree),
            ),
          );
        },
      ),
    );
  }
}

class CitySelectionGridItem extends StatelessWidget {
  final CityDetail _modelDetail;

  CitySelectionGridItem(this._modelDetail);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 5.0,
            ),
            Image.network(
              _modelDetail.iconUrl,
              height: 96.0,
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
              _modelDetail.name,
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
