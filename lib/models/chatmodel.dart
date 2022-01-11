import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final String msg;
  final Timestamp date;

  ChatModel({
    required this.msg,
    required this.date,
  });
  // from map which reads the data from the database

  factory ChatModel.fromMap(Map<String, dynamic> json) => ChatModel(
        msg: json["msg"],
        date: json["date"],
      );
  // toMap()
  Map<String, dynamic> toMap() => {
        "msg": msg,
        "date": date,
      };
}
