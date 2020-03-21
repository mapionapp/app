import 'package:flutter/material.dart';
import 'package:w27/components/info_card_row.dart';
import 'package:w27/language/language.dart';

class GeneralInfoCard extends StatefulWidget {
  @override
  _GeneralInfoCardState createState() => _GeneralInfoCardState();
}

class _GeneralInfoCardState extends State<GeneralInfoCard> {
  
  bool opened = false;

  List<Widget> getChildren() {
    if(opened) {
      return [
        FlatButton(
          onPressed: () {
            setState(() {
              opened = false;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(Icons.keyboard_arrow_down, size: 50,),
          ),
        ),
        InfoCardRow(title: t('infoCard.nearYou'),),
        SizedBox(height: 30,),
        InfoCardRow(title: t('infoCard.openGrocerieStores'),),
        SizedBox(height: 30,),
      ];
    } else {
      return [
        FlatButton(
          onPressed: () {
            setState(() {
              opened = true;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(Icons.keyboard_arrow_up, size: 50,),
          ),
        ),
        SizedBox(height: 15,),
      ];
    }
  }
  
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
      width: double.infinity,
      height: opened ? height * 0.6 : Theme.of(context).platform == TargetPlatform.iOS ? 100 : 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))
      ),
      child: ListView(
        children: getChildren(),
      ),
    );
  }
}
