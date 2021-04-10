import 'package:flutter/material.dart';

class UserOrders extends StatefulWidget {
  UserOrders({Key key}) : super(key: key);

  @override
  _UserOrdersState createState() => _UserOrdersState();
}

class _UserOrdersState extends State<UserOrders> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Orders Coming Soon"),
    );
  }
}
