import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat/models/message.dart';

class ChatRoom {
  factory ChatRoom(DocumentSnapshot doc) {
    if (doc == null || !doc.exists) {
      return null;
    }

    return ChatRoom._new()
      ..id = doc.documentID
      ..name = doc.data['name']
      ..lastMessage =
          Message.fromMap(Map<String, dynamic>.from(doc.data['lastMessage']));
  }

  ChatRoom._new();

  String id;
  String name;
  Message lastMessage;
}
