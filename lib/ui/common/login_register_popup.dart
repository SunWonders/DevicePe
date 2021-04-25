import 'package:devicepe_client/ui/authentication/login_page.dart';
import 'package:devicepe_client/ui/authentication/registration_page.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationRequest extends StatefulWidget {
  AuthenticationRequest({Key key}) : super(key: key);

  @override
  _AuthenticationRequestState createState() => _AuthenticationRequestState();
}

class _AuthenticationRequestState extends State<AuthenticationRequest> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
          top: Radius.circular(15.0), bottom: Radius.zero),
      child: Container(
        padding: EdgeInsets.all(15.0),
        height: 430,
        color: AppColors.whiteText,
        child: Column(
          children: [
            Center(
              child: Image(
                image: AssetImage('assets/images/check_list.png'),
              ),
            ),
            Text(
              "DevicePe is a best marketplace to sell items in a easy way. To Proceed to sell we need few more details. Please Login / SignUp to continue.",
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryLight),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: TextButton(
                      onPressed: () => {
                        Get.back(),
                        Get.to(() => LoginPage()),
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: AppColors.primaryLight),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 40),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Container(
                    width: 100,
                    height: 40,
                    color: AppColors.primaryLight,
                    child: TextButton(
                      onPressed: () => {
                        Get.back(),
                        Get.to(() => RegistrationPage()),
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(color: AppColors.whiteText),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
