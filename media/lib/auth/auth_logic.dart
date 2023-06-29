import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:media/auth/toggle_page.dart";
import "package:media/home/home_page.dart";
class AuthPages extends StatefulWidget {
  const AuthPages({super.key});

  @override
  State<AuthPages> createState() => _AuthPagesState();
}

class _AuthPagesState extends State<AuthPages> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context,snapshot){
       if(snapshot.hasData){
        return HomePage();
       }
       else{
        return TogglePage();
       }
    });
  }
}