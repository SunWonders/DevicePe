import 'package:devicepe_client/ui/brand_selection.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDashBoard extends StatefulWidget {
  HomeDashBoard({Key key}) : super(key: key);

  @override
  _HomeDashBoardState createState() => _HomeDashBoardState();
}

class _HomeDashBoardState extends State<HomeDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 30, 0.0, 5.0),
              child: Text(
                "What Would You Like To Sell with Us?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => BrandSelectionPage());
                          },
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: new BoxDecoration(
                                gradient: new LinearGradient(
                                  colors: [
                                    AppColors.card1,
                                    AppColors.primaryLight,
                                  ],
                                ),
                              ),
                              margin: EdgeInsets.all(10.0),
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Mobile",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Image(
                                    image:
                                        AssetImage('assets/images/mobile.png'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.snackbar("Coming Soon..!", "Under Development");
                          },
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: new BoxDecoration(
                                gradient: new LinearGradient(
                                  colors: [
                                    AppColors.card3,
                                    AppColors.card4_end,
                                  ],
                                ),
                              ),
                              margin: EdgeInsets.all(10.0),
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Laptop",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Image(
                                    image:
                                        AssetImage('assets/images/mobile.png'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.snackbar("Coming Soon..!", "Under Development");
                          },
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: new BoxDecoration(
                                gradient: new LinearGradient(
                                  colors: [
                                    AppColors.card3,
                                    AppColors.card4_end,
                                  ],
                                ),
                              ),
                              margin: EdgeInsets.all(10.0),
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Tablet",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Image(
                                    image:
                                        AssetImage('assets/images/mobile.png'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.snackbar("Coming Soon..!", "Under Development");
                          },
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: new BoxDecoration(
                                gradient: new LinearGradient(
                                  colors: [
                                    AppColors.card1,
                                    AppColors.primaryLight,
                                  ],
                                ),
                              ),
                              margin: EdgeInsets.all(10.0),
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Service",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Image(
                                    image:
                                        AssetImage('assets/images/mobile.png'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
