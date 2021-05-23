import 'package:devicepe_client/repositories/network/controllers/save_order_controller.dart';
import 'package:devicepe_client/ui/agreement/aggreement.dart';
import 'package:devicepe_client/ui/orders/order_success.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class BookOrder extends StatefulWidget {
  BookOrder({Key? key}) : super(key: key);

  @override
  _BookOrderState createState() => _BookOrderState();
}

class _BookOrderState extends State<BookOrder> {
  final _formKey = GlobalKey<FormBuilderState>();
  OrderController orderController = Get.put(OrderController());

  String _nameError = "";
  String _emailError = "";
  String _phoneNumberError = "";
  String _appointmentDateError = "";

  String _addressError = "";
  String _cityError = "";
  String _stetError = "";
  String _pinCodeError = "";
  var genderOptions = ["Male", "Female", "Others"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteText,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.primaryLight),
        backgroundColor: AppColors.whiteText,
        title: Text(
          "Book Order",
          style: TextStyle(color: AppColors.primaryLight),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "PickUp Location Details",
                      style: TextStyle(
                          color: AppColors.blackText,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                        "Please Enter Correct Details in order for us to arrive on time at your doorstep to collect the device."),
                    SizedBox(height: 10),
                    FormBuilder(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        children: <Widget>[
                          FormBuilderTextField(
                            name: 'name',
                            decoration: InputDecoration(
                              labelText: 'Full Name',
                              errorText: _nameError,
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                            ]),
                          ),
                          FormBuilderTextField(
                            name: 'phoneNumber',
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              errorText: _phoneNumberError,
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                              FormBuilderValidators.minLength(context, 10,
                                  errorText: "Enter Valid Mobile Number"),
                              FormBuilderValidators.maxLength(context, 10,
                                  errorText: "Enter Valid Mobile Number"),
                            ]),
                            keyboardType: TextInputType.number,
                          ),
                          FormBuilderTextField(
                            name: 'email',
                            decoration: InputDecoration(
                              labelText: 'Email',
                              errorText: _emailError,
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                              FormBuilderValidators.email(context,
                                  errorText: "Enter valid EmailId"),
                            ]),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          FormBuilderTextField(
                            name: 'address',
                            decoration: InputDecoration(
                              labelText: 'Door/Street/Area',
                              errorText: _addressError,
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                              FormBuilderValidators.max(context, 70),
                            ]),
                          ),
                          FormBuilderTextField(
                            name: 'city',
                            decoration: InputDecoration(
                              labelText: 'City',
                              errorText: _cityError,
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                            ]),
                          ),
                          FormBuilderTextField(
                            name: 'state',
                            decoration: InputDecoration(
                              labelText: 'State',
                              errorText: _stetError,
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                            ]),
                          ),
                          FormBuilderTextField(
                            name: 'pinCode',
                            decoration: InputDecoration(
                              labelText: 'Pin Code',
                              errorText: _pinCodeError,
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                              FormBuilderValidators.numeric(context,
                                  errorText: "Enter number"),
                              FormBuilderValidators.minLength(context, 6,
                                  errorText: "Enter Valid Pin Code"),
                             // FormBuilderValidators.maxLength(context, 6,
                               //   errorText: "Enter Valid Pin Code"),
                            ]),
                            keyboardType: TextInputType.number,
                          ),
                          FormBuilderDateTimePicker(
                            name: 'date',
                            // onChanged: _onChanged,
                            inputType: InputType.both,
                            decoration: InputDecoration(
                              labelText: 'Appointment Date Time',
                              errorText: _appointmentDateError,
                            ),
                            initialDate: DateTime.now().add(Duration(days: 1)),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(Duration(days: 30)),
                          ),
                          FormBuilderTextField(
                            name: 'comments',
                            decoration: InputDecoration(
                              labelText: 'Comments',
                            ),
                            onChanged: (value) {},
                            // valueTransformer: (text) => num.tryParse(text),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                              FormBuilderValidators.max(context, 70),
                            ]),
                          ),
                          FormBuilderCheckbox(
                            name: 'accept_terms',
                            initialValue: false,
                            onChanged: (value) {},
                            title: GestureDetector(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'I have read and agree to the ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: 'Terms and Conditions',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Get.bottomSheet(Aggreement());
                                }),
                            validator: FormBuilderValidators.equal(
                              context,
                              true,
                              errorText:
                                  'You must accept terms and conditions to continue',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: Get.width - 1,
                  child: Container(
                    color: AppColors.nutralLight,
                    width: Get.width - 1,
                    height: 60,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              _formKey.currentState!.reset();
                            },
                            child: Text(
                              "Reset",
                              style: TextStyle(
                                color: AppColors.dark,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: AppColors.primaryLight,
                            height: 60,
                            width: Get.width / 2,
                            child: TextButton(
                              onPressed: () {
                                _formKey.currentState!.save();
                                if (_formKey.currentState!.validate()) {
                                  orderController.buildSaveOrderRequest(
                                      _formKey.currentState!.value);
                                } else {
                                  Get.snackbar(
                                      "Alert", "Provide Valid Information");
                                }
                              },
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                  color: AppColors.whiteText,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
