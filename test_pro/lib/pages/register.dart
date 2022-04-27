import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test_pro/CustomWidgets/BackButton.dart';
import 'package:test_pro/CustomWidgets/SignUpButtons.dart';
import 'package:test_pro/CustomWidgets/TextFormFields.dart';
import 'package:test_pro/CustomWidgets/YellowBlackButton.dart';
import 'package:test_pro/homepages/homepage.dart';
import 'package:test_pro/pages/namepage.dart';
import 'package:test_pro/service/auth.dart';
import 'package:test_pro/pages/welcome.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthService _authService = AuthService();
  TextEditingController emailCreate = TextEditingController();
  TextEditingController passwordCreate = TextEditingController();
  TextEditingController repasswordCreate = TextEditingController();
  TextEditingController emailLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();
  TextEditingController forgetPasswordController = TextEditingController();
  double isvisible = 0;

  List<bool> isSelected = [true, false];

  late Widget pageChanger = textForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            CustomBackButton(
                ontap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Welcome()))),
            Container(
              decoration: BoxDecoration(
                color: Colors.yellow.shade400,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ToggleButtons(
                  borderColor: Colors.yellow,
                  constraints: BoxConstraints.expand(
                      width: (MediaQuery.of(context).size.width - 68) / 2),
                  fillColor: Colors.black,
                  selectedColor: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 20),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 20),
                      child: Text(
                        "Sign In",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < isSelected.length; i++) {
                        isSelected[i] = i == index;
                        if (index == 0) {
                          pageChanger = textForm();
                        } else {
                          pageChanger = signIn();
                        }
                      }
                    });
                  },
                  isSelected: isSelected,
                ),
              ),
            ),
            pageChanger
          ]),
        ),
      ),
    );
  }

  Widget textForm() {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        TextFormFields(
          topText: "Email",
          keybordType: TextInputType.emailAddress,
          controller: emailCreate,
        ),
        SizedBox(
          height: 20,
        ),
        TextFormFields(
          topText: "Create Password",
          keybordType: TextInputType.visiblePassword,
          suffixicon: true,
          controller: passwordCreate,
        ),
        SizedBox(
          height: 20,
        ),
        TextFormFields(
          topText: "Re-write Password",
          keybordType: TextInputType.visiblePassword,
          suffixicon: true,
          controller: repasswordCreate,
        ),
        SizedBox(
          height: 140,
        ),
        privacyPolicyLinkAndTermsOfService(),
        SizedBox(
          height: 20,
        ),
        YellowBlackButton(
            text: "Continue",
            ontap: () => {
                  passwordCreate.text == repasswordCreate.text
                      ? _authService.createPerson(
                          emailCreate.text, passwordCreate.text, context)
                      : _showMyDialoE()
                }),
        SizedBox(
          height: 30,
        )
      ],
    );
  }

  Widget signIn() {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        TextFormFields(
            topText: "Email",
            keybordType: TextInputType.emailAddress,
            controller: emailLogin),
        SizedBox(
          height: 20,
        ),
        TextFormFields(
          topText: "Password",
          keybordType: TextInputType.visiblePassword,
          suffixicon: true,
          controller: passwordLogin,
        ),
        TextButton(
            onPressed: () {
              _showMyDialogS();
              Future<void> resetPassword() async {
                await FirebaseAuth.instance
                    .sendPasswordResetEmail(email: emailLogin.text.trim());
              }
            },
            child: Text(
              "Forgot Password",
              style: TextStyle(
                  color: Colors.black, decoration: TextDecoration.underline),
            )),
        SizedBox(
          height: 250,
        ),
        YellowBlackButton(
            text: "Continue",
            ontap: () => _authService.signIn(
                emailLogin.text, passwordLogin.text, context)),
        SizedBox(
          height: 30,
        )
      ],
    );
  }

  Widget privacyPolicyLinkAndTermsOfService() {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
            child: Text.rich(TextSpan(
                text: 'By continuing, you agree to our ',
                style: TextStyle(fontSize: 16, color: Colors.black),
                children: <TextSpan>[
              TextSpan(
                  text: 'Terms of Service',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // code to open / launch terms of service link here
                    }),
              TextSpan(
                  text: ' and ',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // code to open / launch privacy policy link here
                          })
                  ])
            ]))),
      ),
    );
  }

  Future<void> _showMyDialoE() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Error'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showMyDialogS() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Succes'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
