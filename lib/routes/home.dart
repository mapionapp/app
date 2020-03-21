import 'package:flutter/material.dart';
import 'package:w27/components/popup.dart';
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
      body: Stack(
        children: [
          Container(
            color: Colors.amber,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(t('hello')),
                Icon(Icons.access_alarms, size: 100)
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              color: Colors.blue,
              width: 100,
              height: 100,
              child: Center(child: Text('Deine Mudda'))
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: 200,
              child: RaisedButton(
                onPressed: () {
                  print('Hello World');
                },
                child: Icon(Icons.hdr_on),
              )
            ),
          )
        ],
      )
    );
  }
}
