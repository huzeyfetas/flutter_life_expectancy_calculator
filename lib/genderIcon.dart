import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Gender extends StatelessWidget {
  final IconData icon;
  final String gender;

  const Gender({
    @required this.icon = FontAwesomeIcons.facebook,
    @required this.gender = 'default',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 50,
          color: Colors.black54,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          gender,
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        )
      ],
    );
  }
}
