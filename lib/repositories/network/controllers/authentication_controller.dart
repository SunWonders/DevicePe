import 'dart:async';

import 'package:devicepe_client/repositories/local/dao/login_request_dao.dart';
import 'package:devicepe_client/repositories/local/dao/login_response_dao.dart';
import 'package:devicepe_client/repositories/network/models/login_request.dart';
import 'package:devicepe_client/repositories/network/models/login_response.dart';
import 'package:devicepe_client/repositories/network/models/otp_validate_request.dart';
import 'package:devicepe_client/repositories/network/models/otp_validate_response.dart';
import 'package:devicepe_client/repositories/network/models/register_request.dart';
import 'package:devicepe_client/repositories/network/models/register_response.dart';
import 'package:devicepe_client/repositories/network/services/authentication_service.dart';
import 'package:devicepe_client/repositories/network/services/version_check_service.dart';
import 'package:devicepe_client/ui/authentication/login_page.dart';
import 'package:devicepe_client/ui/authentication/otp_page.dart';
import 'package:devicepe_client/ui/common/progress_dialog.dart';
import 'package:devicepe_client/ui/get_started.dart';
import 'package:devicepe_client/ui/home/home.dart';
import 'package:devicepe_client/ui/orders/service_unavailable.dart';
import 'package:devicepe_client/utils/sahred_pref.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  var registerResponse = RegisterResponse().obs;
  var otpValidateResponse = OtpValidateResponse().obs;
  var loginResponse = LoginResponse().obs;
  var isLoading = false.obs;
  var isFinished = false.obs;

  void registerUser(RegisterRequest registerRequest) async {
    isLoading(true);
    isFinished = false.obs;
    showLoaderDialog();
    try {
      var response = await AuthenticationService.registerUser(registerRequest);
      Get.back();
      if (response != null) {
        registerResponse.value = response;
        if (response.checkStatus()) {
          Get.to(() => OtpPage(registerRequest));
        } else {
          Get.snackbar("Alert", "Registration Failed");
        }
      }
    } catch (e) {
      print("Error - $e");
    } finally {
      isLoading(false);
    }
  }

  void validateOtp(OtpValidateRequest otpValidateRequest) async {
    isLoading(true);
    try {
      showLoaderDialog();
      var response =
          await AuthenticationService.validateOtp(otpValidateRequest);
      Get.back();
      if (response != null) {
        otpValidateResponse.value = response;
        if (response.status == 202) {
          Get.offAll(() => LoginPage());
        }
      }
    } catch (e) {
      print("Error - $e");
    } finally {
      isLoading(false);
    }
  }

  void login(LoginRequest loginRequest) async {
    isLoading(true);
    try {
      showLoaderDialog();
      LoginRequestDao().insert(loginRequest);
      var response = await AuthenticationService.login(loginRequest);

      Get.back();
      if (response != null) {
        loginResponse.value = response;
        if (response.jwtToken != null) {
          LoginResponseDao().insert(response);

          SharedPref().saveString(SharedPref.JWT_TOKEN, response.jwtToken!);

          Get.offAll(() => HomePage());
        }
      } else {
        Get.snackbar("Failed", "Login Failed");
      }
    } catch (e) {
      print("Error - $e");

      Get.snackbar("Failed", "Login Failed");
    } finally {
      isLoading(false);
    }
  }

  void versionCheck() async {
    var a = await LoginRequestDao().retrieve();
    print(a);
    isLoading(true);
    try {
      var response = await VersionCheckService.versionCheck();

      if (response != null) {
        if (response.isActive == true) {
          checkLogin();
        } else {
          Get.offAll(() => ServiceUnAvailable());
        }
      } else {
        checkLogin();
        //Get.offAll(() => ServiceUnAvailable());
      }
    } catch (e) {
      checkLogin();
      //Get.offAll(() => ServiceUnAvailable());
    } finally {
      isLoading(false);
    }
  }

  checkLogin() async {
    var token = await SharedPref().readString(SharedPref.JWT_TOKEN);
    if (token == null || token.isEmpty) {
      Timer(
        Duration(seconds: 2),
        () => Get.offAll(() => GetStartedPage()),
      );
    } else {
      Timer(
        Duration(seconds: 2),
        () => Get.offAll(() => HomePage()),
      );
    }
  }
}
