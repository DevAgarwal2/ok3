import "package:flutter/material.dart";
class TextFieldComp extends StatelessWidget {
  final TextEditingController type;
  final String text;
  final bool obstrue;

  const TextFieldComp({super.key,required this.type,required this.text,required this.obstrue});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(left: 20,right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12)
      ),
      child: TextField(
        keyboardType:TextInputType.emailAddress,
        controller: type,
        obscureText: obstrue,
        decoration: InputDecoration(
          hintText: text,
          border: InputBorder.none
        ),
        
      ),
    );
  }
}