import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:media/component/text_field.dart";
import "package:media/home/chat_ui.dart";
import "package:media/services/chat_service.dart";

class ChatPage extends StatefulWidget {
  final String receiverEmail;
  final String receiverUserID;
  const ChatPage(
      {super.key, required this.receiverEmail, required this.receiverUserID});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _chatcontroller = TextEditingController();
  final chatService _service = chatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    if (_chatcontroller.text.isNotEmpty) {
      await _service.sendMessage(_chatcontroller.text, widget.receiverUserID);
      _chatcontroller.clear();
          FocusScope.of(context).unfocus();

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text(widget.receiverEmail),
      ),
      body: Column(
        children: [Expanded(child: _builderList()), _builderUserInput()],
      ),
    );
  }

  Widget _builderList() {
    return StreamBuilder(
        stream: _service.getMessage(
            widget.receiverUserID, _firebaseAuth.currentUser!.uid),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading.....");
          }
          return ListView(
            children:
                snapshot.data!.docs.map((doc) => _builderItem(doc)).toList(),
          );
        });
  }

  Widget _builderItem(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    var alignment = (data["senderId"] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;
    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment: (data["senderId"] == _firebaseAuth.currentUser!.uid)
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        mainAxisAlignment: (data["senderId"] == _firebaseAuth.currentUser!.uid)
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20,left: 20,top: 8),
            child: Text(
              data["senderName"],
              style: TextStyle(color: Colors.black),
            ),
          ),
          ChatUi(mess: data["actual_message"])
        ],
      ),
    );
  }

  Widget _builderUserInput() {
    return Row(
      children: [
        Expanded(
            child: TextFieldComp(
                type: _chatcontroller,
                text: "Enter the message",
                obstrue: false)),
        IconButton(onPressed: (){
           sendMessage();
        }, icon: Icon(Icons.send_rounded))
      ],
    );
  }
}
