/* import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:test_pro/CustomWidgets/BackButton.dart';

class HowOldAreYou extends StatefulWidget {
  HowOldAreYou({Key? key}) : super(key: key);

  @override
  State<HowOldAreYou> createState() => _HowOldAreYouState();
}

class _HowOldAreYouState extends State<HowOldAreYou> {
  int age = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            CustomBackButton(),
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
    );
  }
}
 */