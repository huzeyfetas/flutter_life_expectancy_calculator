import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final Color renk;
  final Widget child;
  final Function onPress;

  MyWidget({this.renk = Colors.white, this.child, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: renk,
          borderRadius: BorderRadius.circular(5),
        ),
        child: child,
      ),
    );
  }
}
