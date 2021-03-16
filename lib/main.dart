import 'package:beklenen_yasam_suresi/result.dart';
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
      //home: InputPage(),
      // initialRoute: '/',
      // routes: {
      //   InputPage.routhName: (context) => InputPage(),
      //   Result.routhName: (context) => Result(),
      // },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case InputPage.routhName:
            {
              return MaterialPageRoute(builder: (context) => InputPage());
            }
          case Result.routhName:
            {
              return MaterialPageRoute(
                  builder: (context) => Result(settings.arguments));
            }
          default:
            {
              return null;
            }
        }
      },
    );
  }
}
