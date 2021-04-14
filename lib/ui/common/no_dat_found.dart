import 'package:flutter/material.dart';

class NoDataFound extends StatefulWidget {
  NoDataFound({Key key}) : super(key: key);

  @override
  _NoDataFoundState createState() => _NoDataFoundState();
}

class _NoDataFoundState extends State<NoDataFound> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Image(
          image: AssetImage('assets/images/no_data_found.png'),
        ),
      ),
    );
  }
}
