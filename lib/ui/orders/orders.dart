import 'package:devicepe_client/repositories/network/controllers/save_order_controller.dart';
import 'package:devicepe_client/repositories/network/models/order_detail_response.dart';
import 'package:devicepe_client/ui/common/progress_bar.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:devicepe_client/utils/common_utility.dart';
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

  Widget buildWidget(BuildContext context) {
    return Container(
      child: GridView.count(
        childAspectRatio: 1.5,
        shrinkWrap: true,
        crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.portrait ? 1 : 2,
        padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1),
        children: orderController.orderDetailsResponse.value.data == null
            ? []
            : orderController.orderDetailsResponse.value.data!
                .map((OrderDetailData data) {
                return GestureDetector(
                  onTap: () {
                    print("Coming Soon");
                  },
                  child: getOrderDetail(data),
                );
              }).toList(),
      ),
    );
  }

  Widget getOrderDetail(OrderDetailData data) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: Container(
        width: Get.width,
        decoration: new BoxDecoration(
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: AppColors.bgColor,
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 0),
            ),
          ],
          gradient: new LinearGradient(
            colors: [
              AppColors.whiteText,
              AppColors.whiteText,
            ],
          ),
        ),
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(10.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "${variantData.value?.varientName}",
                  style: TextStyle(
                    color: AppColors.dark,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),*/
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        " ❇︎  ${data.orderId}",
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.blackText.withOpacity(
                            0.7,
                          ),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("Device Price (Approximately)"),
                      Text(
                        " ₹  ${data.price}",
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.blackText.withOpacity(
                            0.7,
                          ),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(children: [
                        Text("Booked On "),
                        SizedBox(width: 10),
                        Text(
                          "${CommonUtility().readTimestamp(data.orderCreatedDate!)}",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.blackText.withOpacity(
                              0.7,
                            ),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ]),
                      SizedBox(height: 10),
                      Row(children: [
                        Text("PickUp Date (Expected)"),
                        SizedBox(width: 10),
                        Text(
                          "${CommonUtility().readTimestamp(data.pickUpTime == 0 ? data.orderCreatedDate! + (7 * 24 * 60 * 60 * 1000) : data.pickUpTime!)}",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.blackText.withOpacity(
                              0.7,
                            ),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ]),
                      SizedBox(height: 10),
                      Text("Status"),
                      Text(
                        "🔅 ${data.status}",
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.blackText.withOpacity(
                            0.7,
                          ),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Obx(() => orderController.isLoading.value
            ? ProgressBar()
            : buildWidget(context)));
  }
}
