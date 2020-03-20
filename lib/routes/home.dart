import 'package:flutter/material.dart';
import 'package:w27/language/language.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool initialized = false;

  void postInit(BuildContext context) async {
    String language = Localizations.localeOf(context).languageCode;
    LanguageHandler.setLocale(language);
    await LanguageHandler.load(context);
    setState(() {
      initialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {

    if(!initialized) {
      postInit(context);
    }

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
