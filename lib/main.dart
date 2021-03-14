import 'package:flutter/material.dart';

import 'inputPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.lightBlue,
          primaryColor: Colors.blue,
          accentColor: Colors.green),
      home: InputPage(),
    );
  }
}
