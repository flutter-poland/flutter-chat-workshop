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
          leading: CircleAvatar(),
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
          onTap: () {},
        ),
      ),
    );
  }
}
