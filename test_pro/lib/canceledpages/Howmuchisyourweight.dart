/* import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:test_pro/CustomWidgets/BackButton.dart';

class HowMuchIsYourWeight extends StatefulWidget {
  HowMuchIsYourWeight({Key? key}) : super(key: key);

  @override
  State<HowMuchIsYourWeight> createState() => _HowMuchIsYourWeightState();
}

class _HowMuchIsYourWeightState extends State<HowMuchIsYourWeight> {
  int kg = 10;
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
    );
  }
}
 */