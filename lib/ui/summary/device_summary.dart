import 'package:devicepe_client/ui/exact_value/power_selection.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';

class DeviceSummaryPage extends StatefulWidget {
  @override
  _DeviceSummaryPageState createState() => _DeviceSummaryPageState();
}

class _DeviceSummaryPageState extends State<DeviceSummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.whiteText),
        backgroundColor: AppColors.primaryLight,
        title: Text(
          "Summary",
          style: TextStyle(color: AppColors.whiteText),
        ),
      ),
    );
  }
}
