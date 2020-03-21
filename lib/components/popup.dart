import 'package:flutter/material.dart';

class Popup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      color: Colors.greenAccent,
      child: Icon(Icons.delete),
    );
  }
}
