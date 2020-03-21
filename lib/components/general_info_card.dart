import 'package:flutter/material.dart';

class GeneralInfoCard extends StatefulWidget {
  @override
  _GeneralInfoCardState createState() => _GeneralInfoCardState();
}

class _GeneralInfoCardState extends State<GeneralInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.orange,
      child: Icon(Icons.delete),
    );
  }
}
