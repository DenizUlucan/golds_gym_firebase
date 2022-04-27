import 'package:flutter/material.dart';

class YellowBlackButton extends StatelessWidget {
  final String text;

  final VoidCallback ontap;
  YellowBlackButton({
    required this.ontap,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.yellow.shade400,
                borderRadius: BorderRadius.circular(13)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(text,
                    style: TextStyle(fontSize: 20, color: Colors.black)),
              ),
            ),
          )),
    );
  }
}
