import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:w27/routes/init.dart';
import 'package:w27/w27_colors.dart';

import 'adaptive.dart';

const APP_NAME = 'Mapion';

void main() => runApp(Main());

class Main extends StatefulWidget {
  @override
  MainState createState() => MainState();
}

class MainState extends State<Main> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: APP_NAME,
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
      theme: Theme.of(context).copyWith(accentColor: W27Colors.primaryColor),
      home: Init()
    );
  }
}