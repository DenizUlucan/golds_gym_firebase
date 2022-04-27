import 'package:flutter/material.dart';

class SignUpButtons extends StatelessWidget {
  Color color;
  String text;
  String image;
  VoidCallback ontap;

  SignUpButtons({
    required this.ontap,
    required this.image,
    required this.text,
    required this.color,
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
              color: color, borderRadius: BorderRadius.circular(13)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    image,
                    height: 25,
                    width: 25,
                  ),
                ),
                Expanded(
                    flex: 8,
                    child: Center(
                      child: Text(text,
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    )),
                Spacer(
                  flex: 1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
