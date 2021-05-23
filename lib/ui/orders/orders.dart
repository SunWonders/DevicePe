import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';

class UserOrders extends StatefulWidget {
  UserOrders({Key? key}) : super(key: key);

  @override
  _UserOrdersState createState() => _UserOrdersState();
}

class _UserOrdersState extends State<UserOrders> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteText,
      child: Center(
        child: Image(
          image: AssetImage('assets/images/coming_soon.png'),
        ),
      ),
    );
  }
}
