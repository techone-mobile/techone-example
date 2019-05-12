import 'package:flutter/material.dart';
import 'pages/index.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  ThemeData buildTheme() {
    final ThemeData base = ThemeData();
    return base.copyWith(
      hintColor: Colors.white,
      primaryColor: Colors.red,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: Colors.green,
        ),
      ),
    );
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: buildTheme(),
      home: new Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
