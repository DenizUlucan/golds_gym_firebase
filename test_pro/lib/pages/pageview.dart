import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test_pro/CustomWidgets/BackButton.dart';
import 'package:test_pro/CustomWidgets/YellowBlackButton.dart';
import 'package:test_pro/canceledpages/Howmuchisyourlength.dart';
import 'package:test_pro/canceledpages/Howmuchisyourweight.dart';
import 'package:test_pro/canceledpages/Howoldareyou.dart';
import 'package:test_pro/homepages/homepage.dart';

import 'package:test_pro/pages/register.dart';
import 'package:test_pro/service/auth.dart';
import 'package:test_pro/canceledpages/whatisyoursex.dart';

class PageViewDesign extends StatefulWidget {
/*   String? userId;
  int age, length, weight;
  String gender, name; */
  String name;
  String? useruid;

  PageViewDesign(
      {this.name = "",
      this.useruid,
      /* this.userId,
      
      this.age = 0,
      this.length = 73,
      this.weight = 10,
      this.gender = "", */
      Key? key})
      : super(key: key);

  @override
  State<PageViewDesign> createState() => _PageViewDesignState();
}

class _PageViewDesignState extends State<PageViewDesign> {
  AuthService _authService = AuthService();

  int kg = 10;
  int length = 73;
  int age = 0;
  bool male = false;
  bool female = false;
  String finalgender = " ";
  int pageIndex = 0;
  final PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height - 150,
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (int index) => setState(() {
              pageIndex = index;
            }),
            controller: controller,
            children: [
              Scaffold(
                body: Column(children: [
                  CustomBackButton(
                    ontap: (() => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()))),
                  ),
                  Spacer(),
                  Text(
                    "What is your sex?",
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.6),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.female,
                              size: 150,
                              color:
                                  female == false ? Colors.grey : Colors.pink,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              male = false;
                              female = true;
                              finalgender = "female";
                            });
                          },
                        ),
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.6),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.male,
                              size: 150,
                              color: male == false ? Colors.grey : Colors.blue,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              male = true;
                              female = false;
                              finalgender = "male";
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                ]),
              ),
              Scaffold(
                body: Center(
                  child: Column(
                    children: [
                      CustomBackButton(
                        ontap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PageViewDesign())),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Text(
                        "How old are you?",
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      NumberPicker(
                        value: age,
                        itemWidth: 350,
                        haptics: true,
                        textStyle: TextStyle(color: Colors.black, fontSize: 25),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              width: 1.0,
                              color: Colors.black,
                            ),
                            bottom: BorderSide(width: 1.0, color: Colors.black),
                          ),
                        ),
                        selectedTextStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                        minValue: 0,
                        maxValue: 70,
                        onChanged: (value) => setState(() => age = value),
                      ),
                      Spacer(flex: 1)
                    ],
                  ),
                ),
              ),
              Scaffold(
                body: Center(
                  child: Column(
                    children: [
                      CustomBackButton(
                        ontap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PageViewDesign())),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Text(
                        "How much is your length?",
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Stack(children: [
                        Container(
                          child: NumberPicker(
                            value: length,
                            itemWidth: 350,
                            haptics: true,
                            textStyle:
                                TextStyle(color: Colors.black, fontSize: 25),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  width: 1.0,
                                  color: Colors.black,
                                ),
                                bottom:
                                    BorderSide(width: 1.0, color: Colors.black),
                              ),
                            ),
                            selectedTextStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 35),
                            minValue: 73,
                            maxValue: 251,
                            onChanged: (value) =>
                                setState(() => length = value),
                          ),
                        ),
                        Positioned(
                            bottom: 9,
                            right: 55,
                            height: 75,
                            width: 75,
                            child: Text(
                              "cm",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))
                      ]),
                      Spacer(flex: 1)
                    ],
                  ),
                ),
              ),
              Scaffold(
                body: Center(
                  child: Column(
                    children: [
                      CustomBackButton(
                          ontap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PageViewDesign()))),
                      Spacer(
                        flex: 1,
                      ),
                      Text(
                        "How much is your weight?",
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Stack(children: [
                        Container(
                          child: NumberPicker(
                            value: kg,
                            itemWidth: 350,
                            haptics: true,
                            textStyle:
                                TextStyle(color: Colors.black, fontSize: 25),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  width: 1.0,
                                  color: Colors.black,
                                ),
                                bottom:
                                    BorderSide(width: 1.0, color: Colors.black),
                              ),
                            ),
                            selectedTextStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 35),
                            minValue: 10,
                            maxValue: 251,
                            onChanged: (value) => setState(() => kg = value),
                          ),
                        ),
                        Positioned(
                            bottom: 9,
                            right: 55,
                            height: 75,
                            width: 75,
                            child: Text(
                              "kg",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))
                      ]),
                      Spacer(flex: 1)
                    ],
                  ),
                ),
              ),
              /* WhatIsYourSex(),
              HowOldAreYou(),
              HowMuchIsYourLength(),
              HowMuchIsYourWeight() */
            ],
          ),
        ),
        Spacer(),
        SmoothPageIndicator(
            controller: controller,
            count: 4,
            effect: JumpingDotEffect(
              activeDotColor: Colors.yellow,
              dotColor: Colors.black54,
              dotHeight: 10,
              dotWidth: 10,
              spacing: 10,
              jumpScale: 3,
            )),
        SizedBox(
          height: 20,
        ),
        YellowBlackButton(
            text: "Next",
            ontap: () {
              if (controller.page == 3) {
                if (age == 0 &&
                    finalgender == " " &&
                    length == 73 &&
                    kg == 10) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PageViewDesign()));
                } else {
                  String? useruid;
                  FirebaseFirestore.instance
                      .collection('Person')
                      .doc(widget.useruid.toString())
                      .update({
                        'userName': widget.name,
                        'old': age,
                        'length': length,
                        'weight': kg,
                        'gender': finalgender,
                      })
                      .then((_) => {
                            useruid = widget.useruid,
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (
                                  context,
                                ) =>
                                        HomePage(
                                          useruid: useruid.toString(),
                                        )))
                          })
                      .catchError((error) => print('Failed: $error'));
                }
              } else {
                controller.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.linear);
              }
            }),
        SizedBox(
          height: 30,
        )
      ]),
    );
  }
}
