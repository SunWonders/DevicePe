import 'package:devicepe_client/routes/routes.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';

class OrderSuccessDialog extends StatefulWidget {
  OrderSuccessDialog({Key? key, this.orderId}) : super(key: key);
  final String? orderId;

  @override
  _OrderSuccessDialogState createState() =>
      _OrderSuccessDialogState(this.orderId == null ? "" : this.orderId!);
}

class _OrderSuccessDialogState extends State<OrderSuccessDialog> {
  final String orderId;

  _OrderSuccessDialogState(this.orderId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteText,
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Congratulations",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: AppColors.primaryLight,
                ),
              ),
            ),

            Image(
              image: AssetImage('assets/images/order_booked_success.gif'),
            ),
            // Image.asset(
            //   "assets/images/order_booked_success.gif",
            // ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Order Placed. Your Order Id Is",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.primaryDark,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                orderId,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.primaryLight,
                ),
              ),
            ),

            SizedBox(height: 30),

            FloatingActionButton(
                heroTag: null,
                onPressed: () {
                  launchScreen(context, home);
                },
                child: Icon(Icons.home, color: AppColors.primaryDark),
                backgroundColor: AppColors.secondary),
          ],
        ),
      ),
    );
  }
}
