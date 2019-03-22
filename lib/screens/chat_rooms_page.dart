import 'package:flutter/material.dart';
import 'package:flutter_chat/models/chat_rooms_model.dart';
import 'package:flutter_chat/screens/messages_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' as math;

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
    return Scaffold(
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
        child: RefreshIndicator(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return new ChatRoomListTile(index: index);
            },
            itemCount: 3,
          ),
          onRefresh: () {
            return Future.delayed(Duration(milliseconds: 200));
          },
        ),
      ),
    );
  }
}

class ChatRoomListTile extends StatelessWidget {
  const ChatRoomListTile({
    Key key,
    this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 16);
    final subtitleStyle = TextStyle(fontWeight: FontWeight.w400, fontSize: 12);

    return Container(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18),
        child: ListTile(
          leading: ChatRoomAvatar(index),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Offtopic',
                style: titleStyle,
              ),
              Text(
                'Lorem ipsum dolor sit amet',
                style: subtitleStyle,
              ),
            ],
          ),
          trailing: Text('12:32'),
          onTap: () {
            Navigator.of(context).push<MessagesPage>(
                MaterialPageRoute(builder: (context) => MessagesPage()));
          },
        ),
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
