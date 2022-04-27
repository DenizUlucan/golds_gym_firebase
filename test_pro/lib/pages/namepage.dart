import 'package:flutter/material.dart';
import 'package:test_pro/CustomWidgets/BackButton.dart';
import 'package:test_pro/CustomWidgets/TextFormFields.dart';
import 'package:test_pro/CustomWidgets/YellowBlackButton.dart';
import 'package:test_pro/pages/pageview.dart';
import 'package:test_pro/pages/register.dart';
import 'package:test_pro/service/auth.dart';
import 'package:test_pro/canceledpages/whatisyoursex.dart';

class YourName extends StatelessWidget {
  String? useruid;
  YourName({this.useruid, key}) : super(key: key);
  TextEditingController nicknamecontroller = TextEditingController();
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomBackButton(ontap: () {
            _authService.signout();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegisterPage()));
          }),
          Spacer(flex: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Name?",
                style: TextStyle(fontSize: 22),
              ),
            ),
          ),
          TextFormFields(
              topText: "",
              keybordType: TextInputType.name,
              controller: nicknamecontroller),
          Spacer(flex: 5),
          YellowBlackButton(
              text: "Continue",
              ontap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PageViewDesign(
                                name: nicknamecontroller.text,
                                useruid: useruid,
                              )),
                    ),
                  }),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
