import "package:flutter/material.dart";
class ChatUi extends StatelessWidget {
  final String mess;
  const ChatUi({super.key,required this.mess});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Text(mess,style: TextStyle(color: Colors.white),),
    );
  }
}