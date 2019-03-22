import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/models/message.dart';
import 'package:flutter_chat/utils/design_helpers.dart';

class MessageCell extends StatelessWidget {
  const MessageCell({Key key, @required this.message}) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    // backgroundImage: message.avatar == null ? const AssetImage('assets/avatar_placeholder.png') : CachedNetworkImageProvider(message.avatar),
                    radius: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                    // child: Text(message.from),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [DesignHelpers.getShadow()]),
              child: Text('Lorem ipsum'),
              // Text(message.content, style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
