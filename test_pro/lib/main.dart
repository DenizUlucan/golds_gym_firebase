import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_pro/homepages/HomePageWithoutSigningup.dart';
import 'package:test_pro/canceledpages/Howmuchisyourlength.dart';
import 'package:test_pro/canceledpages/Howmuchisyourweight.dart';
import 'package:test_pro/canceledpages/Howoldareyou.dart';
import 'package:test_pro/homepages/homepage.dart';
import 'package:test_pro/pages/namepage.dart';
import 'package:test_pro/pages/pageview.dart';
import 'package:test_pro/pages/register.dart';
import 'package:test_pro/pages/welcome.dart';
import 'package:test_pro/canceledpages/whatisyoursex.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Welcome(),
    );
  }
}
