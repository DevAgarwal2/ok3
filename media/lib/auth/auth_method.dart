
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class authService extends ChangeNotifier {
  //instance of auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //instance of firestore
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  //login
  Future<UserCredential> signinWithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      _firebaseFirestore.collection("user posts").doc(userCredential
      .user!.uid).set({
        "uid":userCredential.user!.uid,
        "email":email.split("@")[0]
      }, SetOptions(merge: true));
      return userCredential;
    } on FirebaseException catch (e) {
      throw Exception(e.code);
    }
  }

  //signout
  Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
  }

  //signin create new user
  Future<UserCredential> createuser(String email, String password) async {
try{
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    _firebaseFirestore.collection("user posts").doc(userCredential.user!.uid).set({
      "uid":userCredential.user!.uid,
      "email":email
    });
    return userCredential;
}
on FirebaseAuthException catch(e){
  throw Exception(e.code);
}
  }
}
