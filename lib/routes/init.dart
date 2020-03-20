import 'package:flutter/material.dart';
import 'package:w27/components/no_animation_route.dart';
import 'package:w27/language/language.dart';
import 'package:w27/routes/home.dart';

class Init extends StatefulWidget {

  @override
  _InitState createState() => _InitState();
}

class _InitState extends State<Init> {
  bool initialized = false;

  void postInit(BuildContext context) async {
    String language = Localizations.localeOf(context).languageCode;
    LanguageHandler.setLocale(language);
    await LanguageHandler.load(context);
    setState(() {
      initialized = true;
      Navigator.pushReplacement(context, NoAnimationRoute(builder: (context) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {

    if(!initialized) {
      postInit(context);
    }

    return Scaffold(
      body: Container(),
    );
  }
}
