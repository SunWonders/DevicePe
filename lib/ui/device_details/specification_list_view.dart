import 'package:devicepe_client/repositories/network/models/variant_response_model.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';

class SpecificationListView extends StatefulWidget {
  SpecificationListView(this.specificationDetails);
  final List<Specification> specificationDetails;

  @override
  _SpecificationListViewState createState() =>
      _SpecificationListViewState(specificationDetails);
}

class _SpecificationListViewState extends State<SpecificationListView> {
  List<Specification> specificationDetails;
  _SpecificationListViewState(this.specificationDetails);

  @override
  Widget build(BuildContext context) {
    //var h = (specificationDetails.length * 50).toInt();

    return Container(
      // height: MediaQuery.of(context).orientation == Orientation.portrait
      //   ? Get.height / 2 - 10
      // : Get.width / 3 - 10,
      //
      //height: h.toDouble(),
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
        itemCount: specificationDetails.length,
        itemBuilder: (BuildContext context, int index) {
          var title = specificationDetails[index].key;
          var value = specificationDetails[index].value;
          return Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 1, 10, 1),
                height: 1,
              ),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: 120,
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackText,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Container(
                        width: 200,
                        alignment: Alignment.centerLeft,
                        child: Text("$value")),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                color: AppColors.background,
                height: 1,
              ),
            ],
          );
        },
      ),
    );
  }
}
