import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  VoidCallback ontap;
  CustomBackButton({
    required this.ontap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25.0, horizontal: 25),
                child: InkWell(child: Icon(Icons.arrow_back_ios_new_sharp)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
