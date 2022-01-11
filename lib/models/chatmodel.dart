import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final String message;
  final Timestamp time;

  ChatModel({
    required this.message,
    required this.time,
  });
}
