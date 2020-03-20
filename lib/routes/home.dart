import 'package:flutter/material.dart';
import 'package:w27/language/language.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('W27'),
      ),
      body: Center(
        child: Text(t('hello')),
      ),
    );
  }
}
