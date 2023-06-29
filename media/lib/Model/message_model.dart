import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
  final String senderId;
  final String senderName;
  final String recieverId;
  final String actual_message;
  final  Timestamp timestamp;

  Message({
    required this.senderId,
    required this.senderName,
    required this.recieverId,
    required this.actual_message,
    required this.timestamp
  });
  Map<String,dynamic> toMap(){
    return{
      "senderId":senderId,
      "senderName":senderName,
      "recieverId":recieverId,
      "actual_message":actual_message,
      "timestamp":timestamp
    };

  }
}