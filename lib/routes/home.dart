import 'package:flutter/material.dart';
import 'package:w27/components/disclaimer.dart';
import 'package:w27/components/general_info_card.dart';
import 'package:w27/components/map.dart';
import 'package:w27/helper/popups.dart';
import 'package:w27/helper/storage.dart';
import 'package:w27/main.dart';
import 'package:w27/w27_colors.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 2000), () async {
      bool firstTime = await Storage.isFirstTime();
      if(firstTime) {
        await Storage.setFirstTime(false);
        Popups.generic(
          context: context,
          height: MediaQuery.of(context).size.height * 0.7,
          content: Disclaimer()
        );
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: W27Colors.primaryColor,
        title: Text(APP_NAME),
      ),
      body: Stack(
        children: [
          CoronaMap(),
          Align(
            alignment: Alignment.bottomCenter,
            child: GeneralInfoCard(),
          )
        ],
      )
    );
  }
}
