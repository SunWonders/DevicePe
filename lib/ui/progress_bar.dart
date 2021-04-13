import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  ProgressBar({Key key}) : super(key: key);

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            LinearProgressIndicator(color: AppColors.card1),
            Expanded(
              child: Center(
                child: Text("Loading..!",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.card1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
