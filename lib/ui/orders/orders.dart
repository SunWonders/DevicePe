import 'package:devicepe_client/repositories/network/controllers/save_order_controller.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserOrders extends StatefulWidget {
  UserOrders({Key? key}) : super(key: key);

  @override
  _UserOrdersState createState() => _UserOrdersState();
}

class _UserOrdersState extends State<UserOrders> {
  OrderController orderController = Get.put(OrderController());
  void initState() {
    super.initState();
    orderController.getOrderDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Image(
          image: AssetImage('assets/images/coming_soon.png'),
        ),
      ),
    );
  }
}
