import 'package:flutter/material.dart';
class PageSub extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wellcome to Flutter",
      home: Scaffold(
        appBar: AppBar(
          title: Text("appbar title"),
        ),
        body: new Container(
          color: Colors.green,
        ),
      ),
    );
  }
}