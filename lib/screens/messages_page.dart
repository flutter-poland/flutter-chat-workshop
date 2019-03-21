import 'package:flutter/material.dart';
import 'package:flutter_chat/widgets/send_message_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MessagesPage extends StatefulWidget {
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    final subtitleTextStyle = TextStyle(fontSize: 9);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Offtopic',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Online',
                  style: subtitleTextStyle,
                ),
                Text(
                  ' | ',
                  style: subtitleTextStyle,
                ),
                Text(
                  '2 min ago',
                  style: subtitleTextStyle,
                )
              ],
            )
          ],
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              FontAwesomeIcons.microphone,
              color: Colors.grey,
            ),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 241, 241, 241),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: SendMessageField(),
            ),
          ],
        ),
      ),
    );
  }
}
