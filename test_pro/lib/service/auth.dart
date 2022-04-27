import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:test_pro/homepages/homepage.dart';

import 'package:test_pro/pages/namepage.dart';
import 'package:test_pro/pages/pageview.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  inputData() async {
    final User? user = await _auth.currentUser;
    final uid = user!.uid;
    return uid.toString();
  }

/*   Future<User?> singInAnonymously(BuildContext context) async {
    UserCredential sonuc = await _auth.signInAnonymously();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  useruid: sonuc.user!.uid,
                )));
    return sonuc.user;
  } */

/*   getCurrentUser() async {
    final User? user = await _auth.currentUser();
    final uid = user!.uid;
    // Similarly we can get email as well
    //final uemail = user.email;
    print(uid);
    //print(uemail);
  }

 */

  Future<User?> signIn(
      String email, String password, BuildContext context) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  useruid: user.user!.uid,
                )));

    return user.user;
  }

  signout() async {
    return await _auth.signOut();
  }

  Future<User?> createPerson(
      String email, String password, BuildContext context) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore.collection("Person").doc(user.user!.uid).set({
      'email': email,
      'password': password,
      "userName": " ",
      "gender": " ",
      "old": " ",
      "length": " ",
      "weight": " ",
    }).then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => YourName(
                    useruid: user.user!.uid,
                  )));
    });

    return user.user;
  }

  @override
  readUser(String useruid) async {
    DocumentSnapshot<Object> _okunanUser =
        await _firestore.collection("Person").doc(useruid).get();

    return _okunanUser;
  }

  Future<UserCredential?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
