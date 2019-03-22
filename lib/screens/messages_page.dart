import 'package:flutter/material.dart';
import 'package:flutter_chat/models/chat_room.dart';
import 'package:flutter_chat/models/messages_model.dart';
import 'package:flutter_chat/widgets/message_cell.dart';
import 'package:flutter_chat/widgets/my_message_cell.dart';
import 'package:flutter_chat/widgets/send_message_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';

class MessagesPage extends StatefulWidget {
  MessagesPage({Key key, @required this.room}) : super(key: key);

  final ChatRoom room;

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  MessagesModel _model;

  @override
  void initState() {
    super.initState();

    _model = MessagesModel(roomId: widget.room.id);
    _model.fetchMessages();
  }

  @override
  void dispose() {
    super.dispose();
    _model.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final subtitleTextStyle = TextStyle(fontSize: 9);
    return ScopedModel(
      model: _model,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.room.name,
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
              Expanded(
                child: ScopedModelDescendant<MessagesModel>(
                  builder: (_, __, model) {
                    return RefreshIndicator(
                      onRefresh: () {
                        return Future.delayed(Duration(milliseconds: 400));
                      },
                      child: ListView.builder(
                        itemCount: model.messages.length,
                        itemBuilder: (___, index) {
                          final message = model.messages[index];
                          if (message.isMine())
                            return MyMessageCell(message: message);
                          else
                            return MessageCell(message: message);
                        },
                        reverse: true,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: SendMessageField(model: _model),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
