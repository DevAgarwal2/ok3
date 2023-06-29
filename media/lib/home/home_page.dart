

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:media/auth/auth_method.dart";
import "package:media/home/chat_page.dart";
import "package:provider/provider.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void signout() {
    final auth_service = Provider.of<authService>(context, listen: false);
    auth_service.signout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(
              onPressed: () {
                return signout();
              },
              icon: Icon(Icons.logout))
        ]),
        body: builderlist());
  }

  Widget builderlist() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("user posts").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error");
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading....");
          } else {
            return ListView(
              children: snapshot.data!.docs.map<Widget>((doc) => listUsers(doc)).toList(),
            );
          }
        });
  }
  Widget listUsers(DocumentSnapshot document){
   Map<String,dynamic> data = document.data()! as Map<String,dynamic>;
   if(_auth.currentUser!.email != data["email"]){
    return ListTile(
      title: Text(data["email"]),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatPage(
          receiverEmail: data["email"],
          receiverUserID: data["uid"],
        )));
      },
    );

   }
   else{
    return Container();
   }
  }
}
