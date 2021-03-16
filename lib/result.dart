import 'package:beklenen_yasam_suresi/Hesapla.dart';
import 'package:beklenen_yasam_suresi/userData.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  static const String routhName = '/Result';

  final UserData _userData;

  Result(this._userData);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sonuç'.toUpperCase(),
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 8,
                child: Center(
                  child: Text(
                    Hesapla(widget._userData).hesapla().toString(),
                    style: TextStyle(
                      color: Colors.deepPurple[50],
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                      //backgroundColor: Colors.blue[100],
                    ),
                  ),
                ),
              ),
              //Text("$param"),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Geri Dön'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.yellow,
                    onPrimary: Colors.blue,
                    //textStyle: TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
