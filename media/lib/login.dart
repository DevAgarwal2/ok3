import "package:flutter/material.dart";
import "package:media/auth/auth_method.dart";
import "package:media/component/button.dart";
import "package:media/component/text_field.dart";
import "package:provider/provider.dart";

class LoginPage extends StatefulWidget {
  final Function()? ontap;
  const LoginPage({super.key,required this.ontap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  void login()async{
    showDialog(context: context, builder: ((context) {
      return Center(child: CircularProgressIndicator());
      
    }));
    final authLogic = Provider.of<authService>(context,listen: false);

    try{
      await authLogic.signinWithEmailandPassword(email.text, password.text);
      Navigator.pop(context);

    }
    catch (e){
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString()))
      );
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
                  height: 160,
                ),
                Icon(
                  Icons.message_rounded,
                  size: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Welcome Back You have been missed",
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
                  height: 20,
                ),
                myButton(name: "LOGIN", ontap: ()=>login()),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't Have Any account"),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: widget.ontap,
                      child: Text(
                        "Register Now",
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
