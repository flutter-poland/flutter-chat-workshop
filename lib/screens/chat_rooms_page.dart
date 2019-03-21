import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatRoomsPage extends StatefulWidget {
  @override
  _ChatRoomsPageState createState() => _ChatRoomsPageState();
}

class _ChatRoomsPageState extends State<ChatRoomsPage> {
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
            itemCount: 1,
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
    int index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('text'),
    );
  }
}
