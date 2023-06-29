import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:media/auth/auth_method.dart";
import "package:media/component/text_field.dart";
import "package:provider/provider.dart";

import "component/button.dart";
class RegisterPage extends StatefulWidget {
  final Function()? ontap;
  const RegisterPage({super.key,required this.ontap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirm = TextEditingController();
  void signup()async{
    showDialog(context: context, builder: ((context) {
      return Center(child: CircularProgressIndicator());
      
    }));
    if(password.text != confirm.text){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password does not match")));
      return;

    }
    try{
      final _authservice = Provider.of<authService>(context,listen: false);
      await _authservice.createuser(email.text, password.text);
            Navigator.pop(context);

    }
     catch(e){
            Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                ),
                Icon(
                  Icons.message_rounded,
                  size: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Let's Create an Account For You!",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFieldComp(type: email, text: "Email", obstrue: false),
                SizedBox(
                  height: 10,
                ),
                TextFieldComp(type: password, text: "Password", obstrue: true),
                SizedBox(
                  height: 10,
                ),
                TextFieldComp(type: confirm, text: "Confirm Password", obstrue: true),
                SizedBox(
                  height: 20,
                ),
                myButton(name: "SIGNIN", ontap: ()=>signup()),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already Have an account"),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: widget.ontap,
                      child: Text(
                        "Login Now",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}