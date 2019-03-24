import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/models/message.dart';
import 'package:flutter_chat/utils/design_helpers.dart';

class MyMessageCell extends StatelessWidget {
  const MyMessageCell({Key key, @required this.message}) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.fromLTRB(16, 4, 16, 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color.fromARGB(255, 0, 120, 255),
                boxShadow: [DesignHelpers.getShadow()]),
            child: Text(message.content, style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
