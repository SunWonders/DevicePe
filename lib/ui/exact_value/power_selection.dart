import 'package:devicepe_client/ui/exact_value/single_selection_list.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

class PowerStateSelection extends StatefulWidget {
  PowerStateSelection({Key key}) : super(key: key);

  @override
  _PowerStateSelectionState createState() => _PowerStateSelectionState();
}

class _PowerStateSelectionState extends State<PowerStateSelection> {
  var questions = [
    ClosedQuestionTypes("Does Your Device Power On?", selection: YesNo.Neutral)
        .obs,
    ClosedQuestionTypes("Are You Able to make and receive calls?",
            selection: YesNo.Neutral)
        .obs,
    ClosedQuestionTypes("Is There Any problem with Your Mobile Screen?",
            selection: YesNo.Neutral)
        .obs,
  ];

  @override
  Widget build(BuildContext context) {
    var isSelected = true.obs;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.whiteText),
        backgroundColor: AppColors.primaryLight,
        title: Text(
          "About Your Device",
          style: TextStyle(color: AppColors.whiteText),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Text(
                "Tell Us Few things about Your device Details",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              Container(
                child: Column(
                  children: questions
                      .map(
                        (e) => new Column(
                          children: [
                            SizedBox(height: 15),
                            Container(
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                e.value.question,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            ToggleSwitch(
                              minWidth: 90.0,
                              cornerRadius: 10.0,
                              activeBgColor: AppColors.primaryLight,
                              activeFgColor: AppColors.whiteText,
                              inactiveBgColor: Colors.grey,
                              inactiveFgColor: AppColors.shadowThree,
                              labels: ['YES', 'NO'],
                              initialLabelIndex: e.value.selection == YesNo.Yes
                                  ? 0
                                  : e.value.selection == YesNo.No
                                      ? 1
                                      : -1,
                              icons: [Icons.verified, Icons.dangerous],
                              onToggle: (index) {
                                e.update((value) {
                                  value.selection =
                                      index == 0 ? YesNo.Yes : YesNo.No;
                                });
                                print(e);
                              },
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Container(
          color: AppColors.primaryDark,
          padding: EdgeInsets.all(2),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            child: Container(
              color: AppColors.nutralLight,
              padding: EdgeInsets.all(10),
              width: 100,
              height: 60,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Get Upto",
                    style: TextStyle(fontSize: 14, color: AppColors.dark),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    "\u20B9 1028",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.dark),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Container(
          width: 100,
          color: AppColors.primaryLight,
          child: TextButton(
            onPressed: () => {
              isSelected.value = true,
              questions.forEach((element) {
                if (element.value.selection.index != 0 &&
                    element.value.selection.index != 1) {
                  isSelected.value = false;
                }
              }),
              if (isSelected.value == false)
                {
                  {Get.snackbar("Please Select Yes Or No", "")},
                }
              else
                {
                  Get.to(() => SingleSelectionPage()),
                },
            },
            child: Text(
              "Proceed",
              style: TextStyle(color: AppColors.whiteText),
            ),
          ),
        ),
      ),
    );
  }
}

class ClosedQuestionTypes {
  String question;
  YesNo selection;
  ClosedQuestionTypes(this.question, {this.selection = YesNo.Yes});
}

enum YesNo { Yes, No, Neutral }
