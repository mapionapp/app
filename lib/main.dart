import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:w27/routes/home.dart';

import 'adaptive.dart';

void main() => runApp(Main());

class Main extends StatefulWidget {
  @override
  MainState createState() => MainState();
}

class MainState extends State<Main> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'W27',
      color: Colors.black,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('de')
      ],
      builder: Adaptive.getBehaviour(context),
      home: Home()
    );
  }
}