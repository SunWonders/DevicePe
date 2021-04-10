import 'package:devicepe_client/ui/device_model_details.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';

class SpecificationListView extends StatefulWidget {
  SpecificationListView(this.specificationDetails);
  final List<SpecificationDetails> specificationDetails;

  @override
  _SpecificationListViewState createState() =>
      _SpecificationListViewState(specificationDetails);
}

class _SpecificationListViewState extends State<SpecificationListView> {
  List<SpecificationDetails> specificationDetails;
  _SpecificationListViewState(this.specificationDetails);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.height / 2 - 10
          : MediaQuery.of(context).size.width / 3 - 10,
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: specificationDetails.length,
        itemBuilder: (BuildContext context, int index) {
          var title = specificationDetails[index].title;
          var values = specificationDetails[index].details;
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                height: 1,
              ),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: 120,
                      padding: const EdgeInsets.all(10),
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
                      alignment: Alignment.centerRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: values
                            .map((e) => Column(
                                  children: [
                                    Text(" - " + e),
                                    SizedBox(height: 7)
                                  ],
                                ))
                            .toList(),
                      ),
                    ),
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
