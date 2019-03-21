import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat',
      theme: ThemeData(
        primaryColor: Colors.white,
        secondaryHeaderColor: Colors.grey,
      ),
      home: Scaffold(
        body: Center(
          child: Text('Hello Flutter Warsaw!'),
        ),
      ),
    );
  }
}
