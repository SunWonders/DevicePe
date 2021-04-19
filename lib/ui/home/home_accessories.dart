import 'package:devicepe_client/repositories/network/controllers/accessories_controller.dart';
import 'package:devicepe_client/repositories/network/models/accessaries_details_response.dart';
import 'package:devicepe_client/ui/brand_selection.dart';
import 'package:devicepe_client/ui/common/progress_bar.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAccessory extends StatefulWidget {
  HomeAccessory({Key key}) : super(key: key);

  @override
  _HomeAccessoryState createState() => _HomeAccessoryState();
}

class _HomeAccessoryState extends State<HomeAccessory> {
  AccessoriesController a = Get.put(AccessoriesController());

  Widget buildWidget(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1.4,
      children: a.accessoriesDetails
          .map(
            (element) => GestureDetector(
              onTap: () {
                Get.to(() => BrandSelectionPage());
              },
              child: AccessariesGridItem(element),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Obx(
            () => a.isLoading.value ? ProgressBar() : buildWidget(context)));
  }
}

class AccessariesGridItem extends StatelessWidget {
  final AccessoriesDetailData data;

  AccessariesGridItem(this.data);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [
              AppColors.card1,
              AppColors.primaryLight,
            ],
          ),
        ),
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 5.0,
            ),
            Text(
              data.type,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.0,
            ),
            Image(
              image: AssetImage('assets/images/mobile.png'),
            ),
          ],
        ),
      ),
    );
  }
}
