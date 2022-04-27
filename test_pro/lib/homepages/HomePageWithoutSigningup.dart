import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_pro/CustomWidgets/TextFormFields.dart';
import 'package:test_pro/CustomWidgets/YellowBlackButton.dart';
import 'package:test_pro/service/auth.dart';
import 'package:test_pro/pages/welcome.dart';

class HomePageWithoutSigningUp extends StatefulWidget {
  HomePageWithoutSigningUp({Key? key}) : super(key: key);

  @override
  State<HomePageWithoutSigningUp> createState() =>
      _HomePageWithoutSigningUpState();
}

class _HomePageWithoutSigningUpState extends State<HomePageWithoutSigningUp> {
  TextEditingController lengthcontroller = TextEditingController();
  TextEditingController weightcontroller = TextEditingController();
  double? bmi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Text(
            "Gold's Gym BMI Calculator",
            style: TextStyle(fontSize: 22),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Opacity(
                      opacity: 0.04,
                      child: Image.asset("assets/images/goldgym.svg.jpg"),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      TextFormFields(
                          controller: lengthcontroller,
                          topText: "Length",
                          keybordType: TextInputType.number),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormFields(
                          controller: weightcontroller,
                          topText: "Weight",
                          keybordType: TextInputType.number),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: YellowBlackButton(
                            ontap: () {
                              setState(() {
                                bmi = (int.parse(weightcontroller.text) /
                                    (int.parse(lengthcontroller.text) *
                                        int.parse(lengthcontroller.text) /
                                        10000));
                              });
                            },
                            text: "Calculate"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${bmi!.toStringAsPrecision(2)}",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          YellowBlackButton(
              ontap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Welcome()));
              },
              text: "Sign Out"),
          Spacer(),
        ],
      ),
    );
  }
}
