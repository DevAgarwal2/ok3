import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:media/Model/message_model.dart';

class chatService extends ChangeNotifier {
  //instance for firebase
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  //Send Message
  Future<void> sendMessage(String message, String recieverId) async {
    final String currentUserName =
        _firebaseAuth.currentUser!.email.toString().split("@")[0];
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final Timestamp timestamp = Timestamp.now();

    Message messageModel = Message(
        senderId: currentUserId,
        senderName: currentUserName,
        recieverId: recieverId,
        actual_message: message,
        timestamp: timestamp);
    List<String> id = [currentUserId, recieverId];
    id.sort();

    String chatRoomId = id.join("_");
    await _firebaseFirestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .add(messageModel.toMap());
  }

  Stream<QuerySnapshot> getMessage(String userId, String otherUserId) {
    List<String> id = [userId, otherUserId];
    id.sort();
    String chatRoomId = id.join("_");
    return _firebaseFirestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
