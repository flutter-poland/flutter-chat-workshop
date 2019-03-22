import 'package:flutter/material.dart';
import 'package:flutter_chat/models/chat_room.dart';
import 'package:flutter_chat/models/chat_rooms_model.dart';
import 'package:flutter_chat/screens/messages_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';

import 'package:scoped_model/scoped_model.dart';

class ChatRoomsPage extends StatefulWidget {
  @override
  _ChatRoomsPageState createState() => _ChatRoomsPageState();
}

class _ChatRoomsPageState extends State<ChatRoomsPage> {
  final ChatRoomsModel _model = ChatRoomsModel();

  @override
  void initState() {
    super.initState();

    _model.fetchChatrooms();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: _model,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Center(child: Text('1 new message')),
          leading: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(FontAwesomeIcons.edit, size: 20, color: Colors.grey),
            ),
          ],
        ),
        body: Container(
          child: ScopedModelDescendant<ChatRoomsModel>(
            builder: (_, __, model) {
              return RefreshIndicator(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return new ChatRoomListTile(
                        chatRoom: model.chatrooms[index], index: index);
                  },
                  itemCount: model.chatrooms.length,
                ),
                onRefresh: model.fetchChatrooms,
              );
            },
          ),
        ),
      ),
    );
  }
}

class ChatRoomListTile extends StatelessWidget {
  const ChatRoomListTile(
      {Key key, @required this.chatRoom, @required this.index})
      : super(key: key);

  final ChatRoom chatRoom;
  final int index;

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 16);
    final subtitleStyle = TextStyle(fontWeight: FontWeight.w400, fontSize: 12);

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 18),
            child: ListTile(
              onTap: () {
                Navigator.of(context).push<MessagesPage>(MaterialPageRoute(
                    builder: (context) => MessagesPage(room: chatRoom)));
              },
              leading: ChatRoomAvatar(index),
              title: Opacity(
                opacity: index == 0 ? 1.0 : 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(chatRoom.name, style: titleStyle),
                    Text(
                      chatRoom.lastMessage.content,
                      style: subtitleStyle,
                    ),
                  ],
                ),
              ),
              trailing:
                  Text(_dateFormat.format(chatRoom.lastMessage.timestamp)),
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}

class ChatRoomAvatar extends StatelessWidget {
  const ChatRoomAvatar(
    this.index, {
    Key key,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 25,
            spreadRadius: -9,
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
                'http://lorempixel.com/200/200/cats/${math.Random().nextInt(10)}/'),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Color.fromARGB(255, 117, 190, 54),
                border: Border.all(width: 1, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

final DateFormat _dateFormat = DateFormat.Hm();
