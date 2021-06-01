import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';

class NotAcceptingPage extends StatefulWidget {
  final String? _message;
  final String? heading;

  NotAcceptingPage(this._message, {Key? key, this.heading}) : super(key: key);

  @override
  _NotAcceptingPageState createState() =>
      _NotAcceptingPageState(_message, heading: this.heading);
}

class _NotAcceptingPageState extends State<NotAcceptingPage> {
  String? _message;
  String? heading;

  _NotAcceptingPageState(this._message, {this.heading});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteText,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.primaryLight),
        backgroundColor: AppColors.whiteText,
        title: Text(
          "Oops..!",
          style: TextStyle(color: AppColors.primaryLight),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/im_sorry.png'),
            ),
            heading != null
                ? Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      heading == null ? "Somthing Went Wrong " : heading!,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: AppColors.primaryDark,
                      ),
                    ),
                  )
                : Container(),
            Text(_message == null ? "Please Try Again..." : _message!,
                style: TextStyle(
                  wordSpacing: 2.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: AppColors.blackText,
                ),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
