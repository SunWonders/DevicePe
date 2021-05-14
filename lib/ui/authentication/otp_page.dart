import 'package:devicepe_client/repositories/network/controllers/authentication_controller.dart';
import 'package:devicepe_client/repositories/network/models/otp_validate_request.dart';
import 'package:devicepe_client/repositories/network/models/register_request.dart';
import 'package:devicepe_client/ui/common/progress_dialog.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class OtpPage extends StatefulWidget {
  final RegisterRequest registerRequest;
  const OtpPage(this.registerRequest, {Key? key}) : super(key: key);
  @override
  _OtpPageState createState() => _OtpPageState(this.registerRequest);
}

class _OtpPageState extends State<OtpPage> {
  final RegisterRequest registerRequest;

  _OtpPageState(this.registerRequest);

  final CountdownController _controller = new CountdownController();
  AuthenticationController authenticationController =
      Get.put(AuthenticationController());

  String text = '';

  void _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
  }

  Widget otpNumberWidget(int position) {
    try {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Center(
            child: Text(
          text[position],
          style: TextStyle(color: Colors.black),
        )),
      );
    } catch (e) {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
      );
    }
  }

  Widget getOtpTimer() {
    return Center(
      child: Countdown(
        controller: _controller,
        seconds: 150,
        build: (_, double time) => Obx(
          () => authenticationController.isFinished.value
              ? Container(
                  child: TextButton(
                    onPressed: () {
                      if (_controller.isCompleted == true) {
                        _controller.restart();
                        showLoaderDialog();
                      }
                    },
                    child: Container(
                      child: Text(
                        'Resend',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    ),
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.timer),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                        '${((time.toInt()) ~/ 60).toString().padLeft(2, '0')}: ${((time.toInt()) % 60).toString().padLeft(2, '0')}')
                  ],
                ),
        ),
        interval: Duration(milliseconds: 100),
        onFinished: () {
          authenticationController.isFinished.value = true;
          authenticationController.isFinished.refresh();
          print('Timer is done!');
          Get.back();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: AppColors.primaryLight.withAlpha(20),
            ),
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryLight,
              size: 16,
            ),
          ),
          onPressed: () => Get.back(),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                                'Enter 6 digits verification code sent to your number',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w500))),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 500),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              otpNumberWidget(0),
                              otpNumberWidget(1),
                              otpNumberWidget(2),
                              otpNumberWidget(3),
                              otpNumberWidget(4),
                              otpNumberWidget(5),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  getOtpTimer(),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.primaryLight.withAlpha(180),
                        borderRadius: BorderRadius.all(Radius.circular(7.0))),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: TextButton(
                        onPressed: () {
                          if (text.length < 6) {
                            Get.snackbar("Alert", "Enter Valid OTP.");
                            return;
                          }

                          authenticationController.validateOtp(
                              OtpValidateRequest(
                                  mobileNumber: registerRequest.phoneNumber,
                                  otp: text));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Confirm',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  color: AppColors.primaryLight,
                                ),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  NumericKeyboard(
                    onKeyboardTap: _onKeyboardTap,
                    textColor: AppColors.primaryLight,
                    rightIcon: Icon(
                      Icons.backspace,
                      color: AppColors.primaryLight,
                    ),
                    rightButtonFn: () {
                      setState(() {
                        if (text.length > 0) {
                          text = text.substring(0, text.length - 1);
                        }
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
