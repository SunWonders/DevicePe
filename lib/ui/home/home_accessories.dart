import 'package:devicepe_client/repositories/network/controllers/accessories_controller.dart';
import 'package:devicepe_client/repositories/network/models/accessaries_details_response.dart';
import 'package:devicepe_client/ui/brand_selection.dart';
import 'package:devicepe_client/ui/common/progress_bar.dart';
import 'package:devicepe_client/ui/select_city.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:devicepe_client/utils/sahred_pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAccessory extends StatefulWidget {
  HomeAccessory({Key? key}) : super(key: key);

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
              onTap: () async {
                var location =
                    await SharedPref().readString(SharedPref.LOCATION);
                if (location != null && location.isNotEmpty) {
                  SharedPref().saveInt(SharedPref.ACCESSORY_ID,
                      element.id == null ? 0 : element.id!);
                  Get.to(() => BrandSelectionPage());
                } else {
                  Get.defaultDialog(
                      title: "Info",
                      middleText: "Please Update Your Location To Continue.",
                      onConfirm: () {
                        Get.back();
                        Get.to(() => SelectCity());
                      },
                      textConfirm: "Select City");
                }
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
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        // decoration: new BoxDecoration(
        //   gradient: new LinearGradient(
        //     colors: [
        //       AppColors.card1,
        //       AppColors.primaryLight,
        //     ],
        //   ),
        // ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('${data.imageUrl}'),
            fit: BoxFit.cover,
          ),
        ),
        margin: EdgeInsets.all(5.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: Get.width,
              height: 30,
              color: AppColors.shadowOne.withOpacity(0.8),
              child: Text(
                "${data.name}",
                style: TextStyle(
                  color: AppColors.whiteSubText,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
