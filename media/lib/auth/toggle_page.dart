import "package:flutter/material.dart";
import "package:media/login.dart";
import "package:media/register.dart";
class TogglePage extends StatefulWidget {
  const TogglePage({super.key});

  @override
  State<TogglePage> createState() => _TogglePageState();
}

class _TogglePageState extends State<TogglePage> {
  bool page = true;
  void choose_page(){
    setState(() {
      page = !page;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(page){
      return LoginPage(ontap: choose_page);
    }
    else{
      return RegisterPage(ontap: choose_page);
    }
  }
}