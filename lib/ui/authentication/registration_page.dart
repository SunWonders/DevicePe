import 'package:devicepe_client/repositories/network/controllers/authentication_controller.dart';
import 'package:devicepe_client/repositories/network/models/register_request.dart';
import 'package:devicepe_client/ui/authentication/login_page.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:get/get.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key key}) : super(key: key);
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  var phoneNumber = "".obs;
  var countryCode = "+91".obs;
  var _password = "".obs;
  var _name = "".obs;
  AuthenticationController authenticationController =
      Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Stack(
                          children: <Widget>[
                            Center(
                              child: Container(
                                height: 220,
                                constraints:
                                    const BoxConstraints(maxWidth: 500),
                                margin: const EdgeInsets.only(top: 100),
                                decoration: const BoxDecoration(
                                    color: Color(0xFFE1E0F5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                              ),
                            ),
                            Center(
                              child: Container(
                                  constraints:
                                      const BoxConstraints(maxHeight: 340),
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child:
                                      Image.asset('assets/images/login.png')),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('Register',
                              style: TextStyle(
                                  color: AppColors.primaryLight,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800)))
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10),
                      new Container(
                        padding: const EdgeInsets.fromLTRB(25.0, 5, 20, 5),
                        color: Colors.white,
                        child: new TextFormField(
                            decoration: new InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.primaryLight),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.primaryLight),
                              ),
                              border: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.primaryLight),
                              ),
                              labelText: "Enter Name",
                              labelStyle:
                                  TextStyle(color: AppColors.primaryLight),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            style: new TextStyle(
                              fontFamily: "Poppins",
                              color: AppColors.primaryLight,
                            ),
                            onChanged: (name) {
                              _name.value = name;
                            }),
                      ),
                      new Container(
                        padding: const EdgeInsets.fromLTRB(25.0, 5, 20, 5),
                        color: Colors.white,
                        child: new TextFormField(
                          obscureText: true,
                          decoration: new InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primaryLight),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primaryLight),
                            ),
                            border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primaryLight),
                            ),
                            labelText: "Enter Password",
                            labelStyle:
                                TextStyle(color: AppColors.primaryLight),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                            color: AppColors.primaryLight,
                          ),
                          onChanged: (password) {
                            _password.value = password;
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        constraints: const BoxConstraints(maxWidth: 500),
                        child: IntlPhoneField(
                          initialCountryCode: 'IN',
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primaryLight),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primaryLight),
                            ),
                            border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primaryLight),
                            ),
                            labelText: 'Phone Number',
                            labelStyle:
                                TextStyle(color: AppColors.primaryLight),
                          ),
                          onChanged: (phone) {
                            print(phone.completeNumber);
                            phoneNumber.value = phone.number;
                            countryCode.value = phone.countryCode;
                          },
                          onCountryChanged: (phone) {
                            countryCode.value = phone.countryCode;
                          },
                        ),
                      ),
                      Container(
                        constraints: const BoxConstraints(maxWidth: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: 'We will send you an ',
                                style:
                                    TextStyle(color: AppColors.primaryLight)),
                            TextSpan(
                                text: 'One Time Password ',
                                style: TextStyle(
                                    color: AppColors.primaryLight,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: 'on this mobile number',
                                style:
                                    TextStyle(color: AppColors.primaryLight)),
                          ]),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.primaryLight.withAlpha(180),
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.0))),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        constraints: const BoxConstraints(maxWidth: 500),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child: TextButton(
                            onPressed: () {
                              registerUser();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                      Container(
                        child: TextButton(
                          onPressed: () {
                            Get.off(() => LoginPage());
                          },
                          child: Container(
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.red, fontSize: 16),
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
        ),
      ),
    );
  }

  registerUser() {
    if (_name.isEmpty) {
      Get.snackbar("Alert", "Enter Your Name");
      return;
    }

    if (_password.isEmpty) {
      Get.snackbar("Alert", "Enter Password");
      return;
    }
    if (_password.value.length < 6) {
      Get.snackbar("Alert", "Enter Minimum 6 characters");
      return;
    }

    if (phoneNumber.isEmpty) {
      Get.snackbar("Alert", "Enter Mobile Number");
    } else if (phoneNumber.value.length < 10) {
      Get.snackbar("Alert", "Enter Valid Mobile Number");
    } else {
      var registerRequest = RegisterRequest(
          phoneNumber: this.phoneNumber.value,
          password: _password.value,
          firstName: _name.value);
      authenticationController.registerUser(registerRequest);
    }
  }
}
