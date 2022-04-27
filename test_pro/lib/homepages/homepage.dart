import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_pro/CustomWidgets/YellowBlackButton.dart';
import 'package:test_pro/service/auth.dart';
import 'package:test_pro/pages/welcome.dart';

class HomePage extends StatefulWidget {
  String useruid;
  HomePage({required this.useruid, Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

AuthService _authService = AuthService();

class _HomePageState extends State<HomePage> {
  double? bmi;

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
                  FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('Person')
                        .doc(widget.useruid.toString())
                        .get(),
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text("Something went wrong");
                      }

                      if (snapshot.hasData && !snapshot.data!.exists) {
                        return Text("Document does not exist");
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        Map<String, dynamic> data =
                            snapshot.data!.data() as Map<String, dynamic>;
                        int length = data['length'] as int;
                        int weight = data['weight'] as int;
                        double lengthsq = length * length / 10000;
                        bmi = weight / lengthsq;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 55,
                              ),
                              Text(
                                "Welcome ${data['userName']}",
                                style: TextStyle(fontSize: 22),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Age: ${data['old']}",
                                style: TextStyle(fontSize: 22),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Lenght: ${length}",
                                style: TextStyle(fontSize: 22),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Weight :${weight}",
                                style: TextStyle(fontSize: 22),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Body Mass Index: ${bmi!.toStringAsPrecision(3)} ",
                                style: TextStyle(fontSize: 22),
                              ),
                            ],
                          ),
                        );
                      }

                      return Text("loading");
                    },
                  )
                ],
              ),
            ),
          ),
          Spacer(),
          YellowBlackButton(
              ontap: () {
                _authService.signout();
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
