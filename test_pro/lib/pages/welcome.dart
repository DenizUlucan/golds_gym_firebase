import 'package:flutter/material.dart';
import 'package:test_pro/CustomWidgets/SignUpButtons.dart';
import 'package:test_pro/homepages/HomePageWithoutSigningup.dart';
import 'package:test_pro/homepages/homepage.dart';
import 'package:test_pro/pages/namepage.dart';
import 'package:test_pro/pages/register.dart';
import 'package:test_pro/service/auth.dart';

class Welcome extends StatelessWidget {
  Welcome({Key? key}) : super(key: key);
  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white24),
        child: Column(children: [
          Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80.0),
            child: Image.asset("assets/images/goldgym.svg.jpg"),
          ),
          Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              "Welcome To The Gold's Gym App",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(
            flex: 1,
          ),
          SignUpButtons(
              color: Colors.blue,
              image: "assets/images/mail.png",
              text: "Sign Up With Mail",
              ontap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterPage()))),
          SizedBox(
            height: 20,
          ),
          Spacer(
            flex: 2,
          ),
          InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePageWithoutSigningUp())),
            child: Text(
              "Continue Without Signing Up",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          ),
          Spacer(
            flex: 2,
          ),
        ]),
      ),
    );
  }
}
