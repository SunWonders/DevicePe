import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';

class RoundProgressBar extends StatefulWidget {
  RoundProgressBar({Key? key}) : super(key: key);

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<RoundProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            CircularProgressIndicator(color: AppColors.secondary),
            Expanded(
              child: Center(
                child: Text("Loading..!",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondary)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
