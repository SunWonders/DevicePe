import 'package:devicepe_client/repositories/network/controllers/save_order_controller.dart';
import 'package:devicepe_client/ui/agreement/aggreement.dart';
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
                    SizedBox(height: 20),
                    FormBuilder(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          FormBuilderTextField(
                            name: 'name',
                            decoration: InputDecoration(
                              labelText: 'Full Name',
                              //errorText: _nameError,
                              labelStyle:
                                  TextStyle(color: AppColors.primaryLight),
                              hintStyle: TextStyle(color: AppColors.hintGrey),
                              //border: OutlineInputBorder(),
                              fillColor: AppColors.shadowThree,
                              // enabledBorder: OutlineInputBorder(
                              //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              //   borderSide: BorderSide(color: AppColors.primaryLight),
                              // ),
                              // focusedBorder: OutlineInputBorder(
                              //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              //   borderSide: BorderSide(color: AppColors.primaryLight),
                              // ),
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context,
                                  errorText: "Enter Full Name"),
                            ]),
                          ),
                          FormBuilderTextField(
                            name: 'phoneNumber',
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              //errorText: _phoneNumberError,
                              labelStyle:
                                  TextStyle(color: AppColors.primaryLight),
                              hintStyle: TextStyle(color: AppColors.hintGrey),
                              fillColor: AppColors.shadowThree,
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context,
                                  errorText: "Enter Mobile Number"),
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
                              labelStyle:
                                  TextStyle(color: AppColors.primaryLight),
                              hintStyle: TextStyle(color: AppColors.hintGrey),
                              fillColor: AppColors.shadowThree,
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context,
                                  errorText: "Enter Email ID"),
                              FormBuilderValidators.email(context,
                                  errorText: "Enter valid Email ID"),
                            ]),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          FormBuilderTextField(
                            name: 'address',
                            decoration: InputDecoration(
                              labelText: 'Door/Street/Area',
                              labelStyle:
                                  TextStyle(color: AppColors.primaryLight),
                              hintStyle: TextStyle(color: AppColors.hintGrey),
                              fillColor: AppColors.shadowThree,
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context,
                                  errorText: "Enter Door Street Area"),
                              FormBuilderValidators.max(context, 70,
                                  errorText:
                                      "More Than 70 characters not allowed"),
                            ]),
                          ),
                          FormBuilderTextField(
                            name: 'city',
                            decoration: InputDecoration(
                              labelText: 'City',
                              labelStyle:
                                  TextStyle(color: AppColors.primaryLight),
                              hintStyle: TextStyle(color: AppColors.hintGrey),
                              fillColor: AppColors.shadowThree,
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context,
                                  errorText: "Enter City"),
                            ]),
                          ),
                          FormBuilderTextField(
                            name: 'state',
                            decoration: InputDecoration(
                              labelText: 'State',
                              labelStyle:
                                  TextStyle(color: AppColors.primaryLight),
                              hintStyle: TextStyle(color: AppColors.hintGrey),
                              fillColor: AppColors.shadowThree,
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context,
                                  errorText: "Enter State"),
                            ]),
                          ),
                          FormBuilderTextField(
                            name: 'pinCode',
                            decoration: InputDecoration(
                              labelText: 'Pin Code',
                              labelStyle:
                                  TextStyle(color: AppColors.primaryLight),
                              hintStyle: TextStyle(color: AppColors.hintGrey),
                              fillColor: AppColors.shadowThree,
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context,
                                  errorText: "Enter Pin Code"),
                              FormBuilderValidators.numeric(context,
                                  errorText: "Enter number"),
                              FormBuilderValidators.minLength(context, 6,
                                  errorText: "Enter Valid Pin Code"),
                              FormBuilderValidators.maxLength(context, 6,
                                  errorText: "Enter Valid Pin Code"),
                            ]),
                            keyboardType: TextInputType.number,
                          ),
                          FormBuilderDateTimePicker(
                            name: 'date',
                            // onChanged: _onChanged,
                            inputType: InputType.both,
                            decoration: InputDecoration(
                              labelText: 'Appointment Date Time',
                              labelStyle:
                                  TextStyle(color: AppColors.primaryLight),
                              hintStyle: TextStyle(color: AppColors.hintGrey),
                              fillColor: AppColors.shadowThree,
                            ),
                            initialDate: DateTime.now().add(Duration(days: 1)),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(Duration(days: 30)),
                          ),
                          FormBuilderTextField(
                            name: 'comments',
                            decoration: InputDecoration(
                              labelText: 'Comments',
                              labelStyle:
                                  TextStyle(color: AppColors.primaryLight),
                              hintStyle: TextStyle(color: AppColors.hintGrey),
                              fillColor: AppColors.shadowThree,
                            ),
                            //onChanged: (value) {},
                            // valueTransformer: (text) => num.tryParse(text),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context,
                                  errorText: "Enter Comments"),
                              FormBuilderValidators.max(context, 70),
                            ]),
                          ),
                          FormBuilderCheckbox(
                            name: 'accept_terms',
                            initialValue: false,
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
