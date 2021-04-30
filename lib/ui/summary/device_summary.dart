import 'package:devicepe_client/utils/colors.dart';
import 'package:devicepe_client/utils/sahred_pref.dart';
import 'package:flutter/material.dart';

class DeviceSummaryPage extends StatefulWidget {
  @override
  _DeviceSummaryPageState createState() => _DeviceSummaryPageState();
}

class _DeviceSummaryPageState extends State<DeviceSummaryPage> {
  getData() async {
    var a = await SharedPref().readString(SharedPref.SINGLE_SELECTION);
    var b = await SharedPref().readString(SharedPref.MULTIPLE_SELECTION);
    print(a.split("---")[0].split("--")[0]);
    print(b);
  }

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
