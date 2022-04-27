/* import 'package:flutter/material.dart';
import 'package:test_pro/CustomWidgets/BackButton.dart';

class WhatIsYourSex extends StatefulWidget {
  WhatIsYourSex({Key? key}) : super(key: key);

  @override
  State<WhatIsYourSex> createState() => _WhatIsYourSexState();
}

class _WhatIsYourSexState extends State<WhatIsYourSex> {
  bool male = false;
  bool female = false;
  String finalgender = " ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CustomBackButton(),
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
                    color: female == false ? Colors.grey : Colors.pink,
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
    );
  }
}
 */