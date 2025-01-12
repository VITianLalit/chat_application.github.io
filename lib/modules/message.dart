import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderID;
  final String senderEmail;
  final String receiverID;
  final String message;
  final Timestamp timestamp;

  Message(
      {required this.senderID,
      required this.senderEmail,
      required this.message,
      required this.timestamp,
      required this.receiverID});

  //convert to a map
  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'senderID': senderID,
      'senderEmail': receiverID,
      'receiverID': receiverID,
      'timestamp': timestamp,
    };
  }
}
