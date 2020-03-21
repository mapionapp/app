import 'package:flutter/material.dart';
import 'package:w27/components/info_card_row.dart';
import 'package:w27/language/language.dart';

class GeneralInfoCard extends StatefulWidget {
  @override
  _GeneralInfoCardState createState() => _GeneralInfoCardState();
}

class _GeneralInfoCardState extends State<GeneralInfoCard> {
  
  bool opened = false;
  
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    if(opened) {
      return Container(
        width: double.infinity,
        height: height * 0.6,
        color: Colors.orange,
        child: FlatButton(
          child: Column(
            children: [
              SizedBox(height: 15,),
              Icon(Icons.keyboard_arrow_down, size: 50,),
              InfoCardRow(title: t('infoCard.nearYou'),),
              SizedBox(height: 30,),
              InfoCardRow(title: t('infoCard.openGrocerieStores'),),
            ],
          ),
          color: Colors.white,
          onPressed: () {
            setState(() {
              opened = false;
            });
        },
        ),
      );
    } else {
      return Container(
        width: double.infinity,
        height: 100,
        color: Colors.orange,
        child: FlatButton(
          child: Column(
            children: [
              SizedBox(height: 15,),
              Icon(Icons.keyboard_arrow_up, size: 50,),
            ],
          ),
          color: Colors.white,
          onPressed: () {
            setState(() {
              opened = true;
            });
          },
        ),
      );
    }
  }
}
